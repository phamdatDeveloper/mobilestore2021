package com.mobileshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mobileshop.dto.OrderDetailDTO;

public interface OrderDetailService {
	List<OrderDetailDTO> findByOrderId(long id);
}
