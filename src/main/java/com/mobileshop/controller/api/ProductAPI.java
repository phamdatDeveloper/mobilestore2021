package com.mobileshop.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.dto.ProductDTO;
import com.mobileshop.service.impl.ProductServiceImpl;

@RestController
public class ProductAPI {
	@Autowired
	private ProductServiceImpl productService;

	@GetMapping("/api/products")
	public ResponseEntity<List<ProductDTO>> getAllProduct() {
		List<ProductDTO> product = productService.getByActive(true,null).getContent();
		return ResponseEntity.ok().body(product);
	}

	@GetMapping("/api/products/{id}")
	public ResponseEntity<ProductDTO> getProductById(@PathVariable("id") Long id) {
		ProductDTO product = productService.findById(id);
		if (product == null) {
			return (ResponseEntity<ProductDTO>) ResponseEntity.notFound();
		}
		return ResponseEntity.ok().body(product);
	}

	@PostMapping("/api/products")
	public ResponseEntity<ProductDTO> save(@RequestBody ProductDTO productDTO) {
		ProductDTO product = productService.save(productDTO);
		return ResponseEntity.ok().body(product);
	}
	@PostMapping("/api/products/{id}")
	public ResponseEntity<ProductDTO> update(@RequestBody ProductDTO productDTO,@PathVariable("id") Long id) {
		productService.save(productDTO);
		ProductDTO product = productService.findById(id);
		return ResponseEntity.ok().body(product);
	}
}
