package com.mobileshop.service;

import java.util.List;
import java.util.Map;

import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.entity.CategoryEntity;

public interface CategoryService {
	Map<Long, CategoryDTO> findByActive(boolean active);
	
	CategoryDTO save(CategoryDTO categoryDTO);
	
	CategoryDTO findById(Long id);

	List<CategoryDTO> findAll();
}
