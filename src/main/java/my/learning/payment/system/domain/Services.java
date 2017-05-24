package my.learning.payment.system.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "services")
public class Services {
    private Long id;
    private String title;
    private Integer minPayment;
    private Integer maxPayment;
    private Set<Payment> payments;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "name")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "min_pay")
    public Integer getMinPayment() {
        return minPayment;
    }

    public void setMinPayment(Integer minPayment) {
        this.minPayment = minPayment;
    }

    @Column(name = "max_pay")
    public Integer getMaxPayment() {
        return maxPayment;
    }

    public void setMaxPayment(Integer maxPayment) {
        this.maxPayment = maxPayment;
    }

    @OneToMany(mappedBy = "service", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    @JsonBackReference
    public Set<Payment> getPayments() {
        return payments;
    }

    public void setPayments(Set<Payment> payments) {
        this.payments = payments;
    }
}
