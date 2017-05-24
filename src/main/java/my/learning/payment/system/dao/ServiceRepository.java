package my.learning.payment.system.dao;

import my.learning.payment.system.domain.Services;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServiceRepository extends JpaRepository<Services, Long>{
}
