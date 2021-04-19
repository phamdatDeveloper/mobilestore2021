package com.mobileshop.service;

import java.util.List;

import com.mobileshop.dto.ProductDTO;

public interface ProductService {
	
	List<ProductDTO> findAllProductActive() ;
	
	ProductDTO getProductByID(Long id);
}
