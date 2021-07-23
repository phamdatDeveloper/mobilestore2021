package com.mobileshop.controller.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.dto.OrderDTO;
import com.mobileshop.service.OrderService;

@RestController
public class OrderAPI {
	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "/api/orders", method = RequestMethod.PUT)
	public @ResponseBody OrderDTO updateOrder(@RequestParam(value="id",required=false) Long id,
			@RequestParam(value="statusOrder",required=false) String statusOrder) {
		OrderDTO order = orderService.saveByStatusOrder(id, statusOrder);
		return order;
	}
	
	@RequestMapping(value = "/api/order/{id}", method = RequestMethod.GET)
	public @ResponseBody OrderDTO updateOrder(@PathVariable("id") Long id) {
		OrderDTO order = orderService.findById(id);
		return order;
	}

	@RequestMapping(value = "/api/orders/{year}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Integer> getOrderByYear(@PathVariable("year") int year) {
		Map<String, Integer> mapOrder = new HashMap<String, Integer>();
		mapOrder.put("orderSuccess", orderService.findOrderByYear(year, "SUCCESS"));
		mapOrder.put("orderFail", orderService.findOrderByYear(year, "FAIL"));
		return mapOrder;
	}

	@RequestMapping(value = "/api/orders/{month}/{year}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Integer> getOrderByMonth(@PathVariable("month") int month,
			@PathVariable("year") int year) {
		Map<String, Integer> mapOrder = new HashMap<String, Integer>();
		mapOrder.put("orderSuccess", orderService.findOrderByMonth(month, year, "SUCCESS"));
		mapOrder.put("orderFail", orderService.findOrderByMonth(month, year, "FAIL"));
		return mapOrder;
	}

	@RequestMapping(value = "/api/orders/sum/{year}", method = RequestMethod.GET)
	public @ResponseBody Map<Integer, Double> sumOrderByYear(@PathVariable("year") int year) {
		Map<Integer, Double> mapOrder = new HashMap<Integer, Double>();
		for (int i = 0; i < 12; i++) {
			Double total = orderService.sumOrderByYear(i + 1, year, "SUCCESS");

//			 mapOrder.put((i+1),String.format("%,.0f", total)) ;
			mapOrder.put((i + 1), total);
		}
		return mapOrder;
	}
}
