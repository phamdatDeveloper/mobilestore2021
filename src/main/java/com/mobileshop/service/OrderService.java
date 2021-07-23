package com.mobileshop.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.mobileshop.dto.OrderDTO;

public interface OrderService {
	void save(OrderDTO order);
	
	OrderDTO saveByStatusOrder(Long id,String statusOrder);
	
	OrderDTO findById(Long id);
	
	List<OrderDTO> findByUserId(Long id);
	
	List<OrderDTO> findAll();
	
	int findOrderByYear(int year, String status);

	int findOrderByMonth(int month, int year, String status);

	Double sumOrderByYear(@Param("month") int month, @Param("year") int year, @Param("status") String status);
}
