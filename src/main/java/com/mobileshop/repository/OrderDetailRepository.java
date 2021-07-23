package com.mobileshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mobileshop.entity.OrderDetailEntity;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetailEntity, Long>{
	@Query(value="SELECT * FROM mobileshop.order_detail where orderid = ?1",nativeQuery=true)
	List<OrderDetailEntity> findByOrderId(long id);
}
