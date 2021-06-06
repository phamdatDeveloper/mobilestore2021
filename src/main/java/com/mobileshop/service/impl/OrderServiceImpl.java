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
//		orderEntity.setUserId(user.getId());
//		orderEntity.setName(order.getName());
//		orderEntity.setOrderPhone(order.getOrderPhone());
//		orderEntity.setShipAddress(order.getShipAddress());
//		orderEntity.setOrderEmail(user.getEmail());
//		orderEntity.setStatus("COD");
//
//		List<OrderDetailEntity> orderDetails = new ArrayList<OrderDetailEntity>();
//		for (Map.Entry<Long, CartDTO> cart : order.getCarts().entrySet()) {
//			OrderDetailEntity orderDetail = new OrderDetailEntity();
//			orderDetail.setQuatity(cart.getValue().getQuantity());
//			orderDetail.setProductId(cart.getValue().getProduct().getId());
//			orderDetail.setPrice(cart.getValue().getTotalPrice());
//			orderDetail.setOrder(orderEntity);
//			orderDetails.add(orderDetail);
//		}
//		orderEntity.setOrderDetail(orderDetails);

		orderRepository.save(orderEntity);
//		orderRepository.save(orderEntity);

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

}
