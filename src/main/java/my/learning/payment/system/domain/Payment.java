package my.learning.payment.system.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "payments")
public class Payment {
    private Long id;
    private Account account;
    private Services service;
    private Date paymentDate;
    private Integer sum;

    public Payment() {this.paymentDate = new Date(); }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne
    @JoinColumn(name = "account_id")
    @JsonManagedReference
    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @ManyToOne
    @JoinColumn(name = "service_id")
    @JsonManagedReference
    public Services getService() {
        return service;
    }

    public void setService(Services service) {
        this.service = service;
    }

    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    @Column(name = "sum")
    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }
}
