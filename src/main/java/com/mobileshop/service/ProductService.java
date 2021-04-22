package com.mobileshop.service;

import java.util.List;

import com.mobileshop.dto.ProductDTO;

public interface ProductService {
	List<ProductDTO> findAll();
	
	List<ProductDTO> findAllProductActive() ;
	
	ProductDTO getProductByID(Long id);
	
	ProductDTO save(ProductDTO product);
	
	void update(ProductDTO product);
}
