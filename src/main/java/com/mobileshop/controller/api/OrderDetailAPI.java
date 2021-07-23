package com.mobileshop.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.dto.OrderDetailDTO;
import com.mobileshop.service.OrderDetailService;

@RestController
public class OrderDetailAPI {
	@Autowired
	private OrderDetailService orderDetailService;

	@RequestMapping(value = "/api/orderdetail/{id}" , method = RequestMethod.GET)
	public @ResponseBody List<OrderDetailDTO> listOrderDetail(@PathVariable("id") long id) {
		List<OrderDetailDTO> listOrder = orderDetailService.findByOrderId(id);
		return listOrder;
	}
}
