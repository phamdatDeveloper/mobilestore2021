package com.mobileshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mobileshop.dto.ProductDTO;
@Service
public interface ProductService {
	List<ProductDTO> findAll();
	
	List<ProductDTO> findByActive(long id) ;
	
//	List<ProductDTO> findByCategoryAndActive(Long categoryId,boolean active) ;
	
	ProductDTO findById(Long id);
	
	ProductDTO save(ProductDTO product);
	
	void update(ProductDTO product);
	
	Long count();

	List<ProductDTO> findByCategoryAndActive(String categoryName, boolean active);
}
