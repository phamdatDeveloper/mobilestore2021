package com.mobileshop.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.mobileshop.dto.OrderDTO;

public interface OrderService {
	void save(OrderDTO order);
	
	List<OrderDTO> findAll();
	
	int findOrderByYear(int year, String status);

	int findOrderByMonth(int month, int year, String status);

	Double sumOrderByYear(@Param("month") int month, @Param("year") int year, @Param("status") String status);
}
