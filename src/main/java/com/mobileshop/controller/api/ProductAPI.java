package com.mobileshop.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.dto.ProductDTO;
import com.mobileshop.service.impl.ProductServiceImpl;

@RestController
public class ProductAPI {
	@Autowired
	private ProductServiceImpl productService;

	@GetMapping("/api/product")
	public ResponseEntity<List<ProductDTO>> getAllProduct() {
		List<ProductDTO> product = productService.findAllProductActive();
		return ResponseEntity.ok().body(product);
	}
	@GetMapping("/api/product/{id}")
	public ResponseEntity<ProductDTO> getProductById(@PathVariable("id") Long id) {
		ProductDTO product = productService.getProductByID(id);
		if(product == null) {
		return (ResponseEntity<ProductDTO>) ResponseEntity.notFound();
		}
		return ResponseEntity.ok().body(product);
	}
}
