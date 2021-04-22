package com.mobileshop.service;

import java.util.List;

import com.mobileshop.dto.CategoryDTO;

public interface CategoryService {
	List<CategoryDTO> findByActive(int active);
}
