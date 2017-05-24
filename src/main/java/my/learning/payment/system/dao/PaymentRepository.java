package my.learning.payment.system.dao;

import my.learning.payment.system.domain.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by root on 26.04.17.
 */
public interface PaymentRepository extends JpaRepository<Payment, Long> {
    List<Payment> findByAccountId(Long id);
    List<Payment> findBySum(Integer sum);
}
