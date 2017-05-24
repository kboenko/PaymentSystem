package my.learning.payment.system.dao;

import my.learning.payment.system.domain.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, Long> {
    Account findByPhone(String phone);
}
