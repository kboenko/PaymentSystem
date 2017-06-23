package my.learning.payment.system.ctrls;

import my.learning.payment.system.dao.AccountRepository;
import my.learning.payment.system.dao.PaymentRepository;
import my.learning.payment.system.dao.ServiceRepository;
import my.learning.payment.system.domain.Account;
import my.learning.payment.system.domain.MetaPayment;
import my.learning.payment.system.domain.Payment;
import my.learning.payment.system.domain.Services;
import my.learning.payment.system.utils.StringUtils;
import my.learning.payment.system.utils.Validator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
public class MainController {
    private static final Logger log = Logger.getLogger(MainController.class);

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private ServiceRepository serviceRepository;

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value={"/", "/welcome"}, method = RequestMethod.GET)
    public String index(Model model) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Account loggedUser = accountRepository.findByPhone(userDetails.getUsername());
        List<Services> services = serviceRepository.findAll();
        MetaPayment metaPayment = new MetaPayment();
        model.addAttribute("loggedUser", loggedUser);
        model.addAttribute("services", services);
        model.addAttribute("payment", metaPayment);
        Account account = new Account();
        model.addAttribute("account", account);
        System.out.println("CURRENT LOGGED USER: " + SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
        return "privateForm";

    }

    @RequestMapping(value="/list", method = RequestMethod.GET)
    @ResponseBody
    public List<Payment> paymentList() {
        return paymentRepository.findAll();
    }

    @RequestMapping(value="/listForUser/{id}")
    public String showPaymentHistory(Model model, @PathVariable("id") Long accountId) {
      model.addAttribute("payments", paymentRepository.findByAccountId(accountId));
      return "history";
    }

    @RequestMapping("/bySum/{sum}")
    @ResponseBody
    public List<Payment> paymentListBySum(@PathVariable("sum") Integer sum) {
        return paymentRepository.findBySum(sum);
    }

    @RequestMapping(value="/getBalance/{id}", method = RequestMethod.GET)
    public @ResponseBody Integer getBalance (@PathVariable("id") Long accountId) {
        return accountRepository.findOne(accountId).getBalance();
    }

    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    @Transactional
    public synchronized String savePayment(MetaPayment metaPayment) {
        Account account = accountRepository.findOne(metaPayment.getAccountId());
        Services service = serviceRepository.findOne(metaPayment.getServiceId());
        Integer sum = metaPayment.getSum();

        System.out.println("SUM: " + sum);
        System.out.println("MIN PAYMENT: " + service.getMinPayment());
        System.out.println("MAX PAYMENT: " + service.getMaxPayment());
        System.out.println("BALANCE: " + account.getBalance());

        if(!Validator.isSumValid(sum, service.getMinPayment(), service.getMaxPayment(), account.getBalance())) {
            return "errorPayment";
        }

        Payment newPayment = new Payment();
        newPayment.setAccount(account);
        newPayment.setService(service);
        newPayment.setSum(sum);
        newPayment.setPaymentDate(new Date());

        paymentRepository.save(newPayment);

        Account user = accountRepository.findOne(newPayment.getAccount().getId());
        Integer newBalance = user.getBalance() - sum;
        user.setBalance(newBalance);

        accountRepository.save(user);

        return "redirect:/";
    }

    @RequestMapping(value = "/getServiceItems", method = RequestMethod.GET)
    public @ResponseBody List<Services> serviceItemList() {
        return serviceRepository.findAll();
    }

    @RequestMapping(value = "/back", method = RequestMethod.GET)
    public String goBack() { return "redirect:/"; }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String regPage(Model model) {
        Account account = new Account();
        model.addAttribute("account", account);
        return "register";
    }

    @RequestMapping(value = "/createNewAccount", method = RequestMethod.POST)
    public String congrats(Account account, Model model) {
        account.setBalance(100);
        account.setRole("ROLE_USER");
        account.setPassword(StringUtils.generateRandomPassword());
        accountRepository.save(account);
        model.addAttribute("newAccount", account);
        return "congratulation";
    }
}
