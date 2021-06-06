package com.mobileshop.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.converter.ProductConverter;
import com.mobileshop.dto.CartDTO;
import com.mobileshop.dto.ProductDTO;
import com.mobileshop.repository.ProductRepository;
import com.mobileshop.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ProductConverter productConverter;

	public HashMap<Long, CartDTO> addCart(long id, HashMap<Long, CartDTO> carts) {
		CartDTO cart = new CartDTO();
		ProductDTO product = productConverter.convertToDTO(productRepository.findById(id));
		if (product != null) {
			if (carts.containsKey(id)) {
				carts.get(id).setQuantity(carts.get(id).getQuantity() + 1);
				return carts;
			} else {
				cart.setProduct(product);
				cart.setQuantity(1);
				if (product.getIsSale()) {
					cart.setTotalPrice(product.getPriceSale());

				} else {
					cart.setTotalPrice(product.getPrice());
				}
				carts.put(id, cart);
				return carts;
			}

		}
		return carts;
	}

	public HashMap<Long, CartDTO> editCart(long id, int quantity, HashMap<Long, CartDTO> carts) {
		CartDTO cart = new CartDTO();
		if (carts == null) {
			return carts;
		}
		if (carts.containsKey(id)) {
			cart = carts.get(id);
			if (quantity <= cart.getProduct().getQuantity()) {
				for (Map.Entry<Long, CartDTO> oneCart : carts.entrySet()) {
					oneCart.getValue().setMessage("");
					carts.put(oneCart.getKey(), oneCart.getValue());
				}
				cart.setQuantity(quantity);
				cart.setMessage("");
				if (cart.getProduct().getIsSale()) {
					cart.setTotalPrice(cart.getProduct().getPriceSale() * quantity);

				} else {
					cart.setTotalPrice(cart.getProduct().getPrice() * quantity);
				}
				carts.put(id, cart);
			} else {
				cart = carts.get(id);
				cart.setMessage("ERROR");
				carts.put(id, cart);
			}
		}
		return carts;
	}

	public HashMap<Long, CartDTO> deleteCart(long id, HashMap<Long, CartDTO> carts) {
		if (carts == null) {
			return carts;
		}
		if (carts.containsKey(id)) {
			carts.remove(id);
		}

		return carts;
	}

	public int totalQuantity(HashMap<Long, CartDTO> carts) {
		int sum = 0;
		for (Map.Entry<Long, CartDTO> cart : carts.entrySet()) {
			sum += cart.getValue().getQuantity();
		}
		return sum;
	}

	public double totalPrice(HashMap<Long, CartDTO> carts) {
		double sum = 0;
		for (Map.Entry<Long, CartDTO> cart : carts.entrySet()) {
			sum += cart.getValue().getTotalPrice();
		}
		return sum;
	}

}
