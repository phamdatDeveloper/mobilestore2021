package com.mobileshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.dto.OrderDTO;
import com.mobileshop.service.OrderService;

@Controller
public class AdminOrderManager {
	@Autowired
	private OrderService orderService;
	@RequestMapping("/admin/order-manager")
	public ModelAndView orderManagerPage(ModelAndView model) {
		List<OrderDTO> listOrder = orderService.findAll();
		model.addObject("listOrder", listOrder);
		model.setViewName("admin/order-manager");
		return model;
	}
}
