package com.mobileshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mobileshop.entity.OrderEntity;
@Repository
public interface OrderRepository extends JpaRepository<OrderEntity, Long> {
	@Query(value = "SELECT count(createdate) FROM mobileshop.`order` where year(createdate) = :year and status LIKE CONCAT('%',:status,'%');", nativeQuery = true)
	int findOrderByYear(@Param("year")int year,@Param("status")String status);
	
	@Query(value = "SELECT count(createdate) FROM mobileshop.`order` where month(createdate) = :month and  year(createdate) = :year and status LIKE CONCAT('%',:status,'%');", nativeQuery = true)
	int findOrderByMonth(@Param("month")int month,@Param("year")int year,@Param("status")String status);
	
	@Query(value = "SELECT sum(totalprice) FROM mobileshop.`order` where month(createdate) = :month and  year(createdate) = :year and status LIKE CONCAT('%',:status,'%');", nativeQuery = true)
	Double sumOrderByYear(@Param("month")int month,@Param("year")int year,@Param("status")String status);
}
