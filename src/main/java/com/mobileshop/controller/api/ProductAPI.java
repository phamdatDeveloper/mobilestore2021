package com.mobileshop.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.entity.ProductEntity;
import com.mobileshop.service.ProductService;

@RestController
public class ProductAPI {
	@Autowired
	private ProductService productService;

	@GetMapping("/api/product")
	public ResponseEntity<List<ProductEntity>> getProduct() {
		List<ProductEntity> product = productService.getProduct();
		return ResponseEntity.ok().body(product);
	}
}
