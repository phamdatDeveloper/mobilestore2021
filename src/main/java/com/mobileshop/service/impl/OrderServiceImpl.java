package com.mobileshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.converter.OrderConverter;
import com.mobileshop.dto.OrderDTO;
import com.mobileshop.entity.OrderEntity;
import com.mobileshop.entity.UserEntity;
import com.mobileshop.repository.OrderRepository;
import com.mobileshop.repository.UserRepository;
import com.mobileshop.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private OrderConverter orderConverter;

	@Override
	public void save(OrderDTO order) {
		OrderEntity orderEntity = orderConverter.convertToEntity(order);
		UserEntity user = userRepository.findOneByUsername(order.getUserName());
		orderEntity.setUserId(user.getId());
		orderEntity.setOrderEmail(user.getEmail());
		orderRepository.save(orderEntity);
	}

	@Override
	public int findOrderByYear(int year, String status) {
		return orderRepository.findOrderByYear(year, status);
	}

	@Override
	public int findOrderByMonth(int month, int year, String status) {
		return orderRepository.findOrderByMonth(month, year, status);
	}

	@Override
	public Double sumOrderByYear(int month, int year, String status) {
		return orderRepository.sumOrderByYear(month, year, status);
	}

	@Override
	public List<OrderDTO> findAll() {
		List<OrderDTO> listOrderDTO = new ArrayList<OrderDTO>();
		List<OrderEntity> listOrderEntity = orderRepository.findAll();
		for (OrderEntity orderEntity : listOrderEntity) {
			listOrderDTO.add(orderConverter.convertToDTO(orderEntity));
		}
		return listOrderDTO;
	}

	@Override
	public OrderDTO findById(Long id) {
		OrderEntity orderEntity = orderRepository.findById(id);
		if (orderEntity == null) {
			return null;
		}
		OrderDTO orderDTO = orderConverter.convertToDTO(orderEntity);
		return orderDTO;
	}

	@Override
	public OrderDTO saveByStatusOrder(Long id, String statusOrder) {
		OrderEntity orderEntity = orderRepository.findById(id);
		orderEntity.setStatusOrder(statusOrder);
		OrderDTO orderDTO = orderConverter.convertToDTO(orderRepository.save(orderEntity));
		return orderDTO;

	}

	@Override
	public List<OrderDTO> findByUserId(Long id) {
		List<OrderDTO> listOrderDTO = new ArrayList<OrderDTO>();
		List<OrderEntity> listOrderEntity = orderRepository.findByUserId(id);
		//Lay danh sach tu duoi len
		for (int i = listOrderEntity.size() - 1; i >= 0; i--) {
			listOrderDTO.add(orderConverter.convertToDTO(listOrderEntity.get(i)));
		}
		return listOrderDTO;
	}

}
