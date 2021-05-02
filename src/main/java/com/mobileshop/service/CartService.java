package com.mobileshop.service;

import java.util.HashMap;

import com.mobileshop.dto.CartDTO;

public interface CartService {
	HashMap<Long, CartDTO> addCart(long id, HashMap<Long, CartDTO> cart);

	HashMap<Long, CartDTO> editCart(long id, int quantity, HashMap<Long, CartDTO> carts);

	HashMap<Long, CartDTO> deleteCart(long id, HashMap<Long, CartDTO> carts);
	
	int totalQuantity(HashMap<Long, CartDTO> carts);
	
	double totalPrice(HashMap<Long, CartDTO> carts);
}
