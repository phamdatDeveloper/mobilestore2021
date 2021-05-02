package com.mobileshop.service;

import java.util.List;

import com.mobileshop.dto.ProductDTO;

public interface ProductService {
	List<ProductDTO> findAll();
	
	List<ProductDTO> findAllProductActive() ;
	
	List<ProductDTO> findByCategoryIdAndActive(Long categoryId,boolean active) ;
	
	ProductDTO getProductByID(Long id);
	
	ProductDTO save(ProductDTO product);
	
	void update(ProductDTO product);
	
	Long count();
}
