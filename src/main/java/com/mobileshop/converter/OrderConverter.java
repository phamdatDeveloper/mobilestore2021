package com.mobileshop.converter;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import com.mobileshop.dto.CartDTO;
import com.mobileshop.dto.OrderDTO;
import com.mobileshop.entity.OrderDetailEntity;
import com.mobileshop.entity.OrderEntity;

@Component
public class OrderConverter {
	public OrderDTO convertToDTO(OrderEntity entity) {
		ModelMapper modelMapper = new ModelMapper();
		OrderDTO dto = modelMapper.map(entity, OrderDTO.class);

		return dto;
	}

	public OrderEntity convertToEntity(OrderDTO dto) {
		ModelMapper modelMapper = new ModelMapper();
		OrderEntity entity = modelMapper.map(dto, OrderEntity.class);
		double totalPrice = 0;

		entity.setName(dto.getName());
		entity.setOrderPhone(dto.getOrderPhone());
		entity.setShipAddress(dto.getShipAddress());
		entity.setStatus(dto.getStatusPay());

		List<OrderDetailEntity> orderDetails = new ArrayList<OrderDetailEntity>();
		for (Map.Entry<Long, CartDTO> cart : dto.getCarts().entrySet()) {
			OrderDetailEntity orderDetail = new OrderDetailEntity();
			orderDetail.setOrder(entity);
			orderDetail.setProductId(cart.getValue().getProduct().getId());
			orderDetail.setProductName(cart.getValue().getProduct().getProductName());
			if (cart.getValue().getProduct().getIsSale()) {
				orderDetail.setPriceSale(cart.getValue().getProduct().getPriceSale());
				totalPrice += (cart.getValue().getProduct().getPriceSale() * cart.getValue().getQuantity());
			} else {
				totalPrice += (cart.getValue().getProduct().getPrice() * cart.getValue().getQuantity());
			}
			orderDetail.setPrice(cart.getValue().getProduct().getPrice());
			orderDetail.setQuatity(cart.getValue().getQuantity());
			orderDetail.setTotalPrice(cart.getValue().getTotalPrice());
			orderDetails.add(orderDetail);

		}
		entity.setOrderDetail(orderDetails);
		entity.setTotalPrice(totalPrice);
		return entity;
	}
}
