package com.mobileshop.controller.user;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mobileshop.dto.CartDTO;
import com.mobileshop.service.CartService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;

	@RequestMapping("/cart")
	public String cart(HttpSession session) {
		HashMap<Long, CartDTO> carts = (HashMap<Long, CartDTO>) session.getAttribute("carts");
		if (carts == null) {
			carts = new HashMap<Long, CartDTO>();
		} 
		session.setAttribute("carts", carts);
		session.setAttribute("totalPrice", cartService.totalPrice(carts));
		return "user/shopping-cart";
	}
}
