package com.mobileshop.controller.api;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.dto.CartDTO;
import com.mobileshop.service.CartService;

@RestController
public class CartAPI {
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value="/addCart/{id}")
	public @ResponseBody String addCart(@PathVariable("id")long id,HttpSession session) {
		HashMap<Long, CartDTO> carts = (HashMap<Long, CartDTO>) session.getAttribute("carts");
		if(carts == null) {
			carts = new HashMap<Long, CartDTO>();
		}
		carts = cartService.addCart(id, carts);
		session.setAttribute("carts", carts);
		session.setAttribute("totalPrice", cartService.totalPrice(carts));
		session.setAttribute("totalQuantity", cartService.totalQuantity(carts));
		return "Add Success";
		
	}
	
	@RequestMapping(value="/deleteCart/{id}")
	public @ResponseBody String deleteCart(@PathVariable("id")long id,HttpSession session) {
		HashMap<Long, CartDTO> carts = (HashMap<Long, CartDTO>) session.getAttribute("carts");
		if(carts == null) {
			carts = new HashMap<Long, CartDTO>();
		}
		carts = cartService.deleteCart(id, carts);
		session.setAttribute("carts", carts);
		if(carts != null) {
		session.setAttribute("totalPrice", cartService.totalPrice(carts));
		session.setAttribute("totalQuantity", cartService.totalQuantity(carts));
		}
		return "Add Success";
		
	}

}
