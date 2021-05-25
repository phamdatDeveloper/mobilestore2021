package com.mobileshop.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.mobileshop.dto.ProductDTO;
import com.mobileshop.entity.ProductEntity;
@Service
public interface ProductService {
	List<ProductDTO> findAll();
	
//	List<ProductDTO> findByActive(boolean active) ;
	
	Page<ProductDTO> getByActive(boolean active, Pageable pageable);

	Page<ProductDTO> findByCategoryIdAndActive(Long categoryId,boolean active, Pageable pageable);
	
	ProductDTO findById(Long id);
	
	ProductDTO save(ProductDTO product);
	
//	void update(ProductDTO product);
	
	Long count();

//	List<ProductDTO> findByCategoryAndActive(String categoryName, boolean active);
	

}
