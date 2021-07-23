package com.mobileshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.dto.OrderDetailDTO;
import com.mobileshop.entity.OrderDetailEntity;
import com.mobileshop.repository.OrderDetailRepository;
import com.mobileshop.service.OrderDetailService;
@Service
public class OrderDetailServiceImpl implements OrderDetailService {
	@Autowired
	private OrderDetailRepository orderDetailRepository;

	@Override
	public List<OrderDetailDTO> findByOrderId(long id) {
		ModelMapper modelMapper = new ModelMapper();
		List<OrderDetailDTO> listOrder = new ArrayList<OrderDetailDTO>();
		List<OrderDetailEntity> listOrderDetailEntity = orderDetailRepository.findByOrderId(id);
		for (OrderDetailEntity orderDetailEntity : listOrderDetailEntity) {
			OrderDetailDTO dto = modelMapper.map(orderDetailEntity, OrderDetailDTO.class);
			listOrder.add(dto);
		}
		return listOrder;
	}

}
