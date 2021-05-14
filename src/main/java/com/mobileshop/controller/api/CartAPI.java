package com.mobileshop.controller.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

	@RequestMapping(value = "/addCart/{id}")
	public @ResponseBody List<CartDTO> addCart(@PathVariable("id") long id, HttpSession session) {
		HashMap<Long, CartDTO> carts = (HashMap<Long, CartDTO>) session.getAttribute("carts");
		List<CartDTO> listCart = new ArrayList<CartDTO>();
		if (carts == null) {
			carts = new HashMap<Long, CartDTO>();
		} else {
			carts = cartService.addCart(id, carts);
			carts.forEach((k, v) -> {
				listCart.add(v);
			});
		}
		session.setAttribute("carts", carts);
		session.setAttribute("totalPrice", cartService.totalPrice(carts));
		session.setAttribute("totalQuantity", cartService.totalQuantity(carts));
		return listCart;

	}

	@RequestMapping(value = "/deleteCart/{id}")
	public @ResponseBody List<CartDTO> deleteCart(@PathVariable("id") long id, HttpSession session) {
		HashMap<Long, CartDTO> carts = (HashMap<Long, CartDTO>) session.getAttribute("carts");
		List<CartDTO> listCart = new ArrayList<CartDTO>();
		if (carts == null) {
			carts = new HashMap<Long, CartDTO>();
		} else {
			carts = cartService.deleteCart(id, carts);
			session.setAttribute("carts", carts);
			if (carts != null) {
				session.setAttribute("totalPrice", cartService.totalPrice(carts));
				session.setAttribute("totalQuantity", cartService.totalQuantity(carts));
			}
			carts.forEach((k, v) -> {
				listCart.add(v);
			});
		}

		return listCart;

	}

	@RequestMapping(value = "/updateCart/{id}/{quantity}")
	public @ResponseBody List<CartDTO> updatecart(@PathVariable("id") long id, @PathVariable("quantity") int quantity,
			HttpSession session) {
		HashMap<Long, CartDTO> carts = (HashMap<Long, CartDTO>) session.getAttribute("carts");
		List<CartDTO> listCart = new ArrayList<CartDTO>();
		if (carts == null) {
			carts = new HashMap<Long, CartDTO>();
		} else {
			carts = cartService.editCart(id, quantity, carts);
			session.setAttribute("carts", carts);
			if (carts != null) {
				session.setAttribute("totalPrice", cartService.totalPrice(carts));
				session.setAttribute("totalQuantity", cartService.totalQuantity(carts));
			}
			carts.forEach((k, v) -> {
				listCart.add(v);
			});
		}

		return listCart;

	}

}
