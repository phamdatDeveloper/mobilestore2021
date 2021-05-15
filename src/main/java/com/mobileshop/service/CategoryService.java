package com.mobileshop.service;

import java.util.List;
import java.util.Map;

import com.mobileshop.dto.CategoryDTO;

public interface CategoryService {
	Map<Long, CategoryDTO> findByActive(int active);
}
