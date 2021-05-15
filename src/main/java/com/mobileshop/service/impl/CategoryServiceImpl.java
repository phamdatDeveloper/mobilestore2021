package com.mobileshop.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.converter.CategoryConverter;
import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.entity.CategoryEntity;
import com.mobileshop.repository.CategoryRepository;
import com.mobileshop.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryConverter converter;
	@Autowired
	private CategoryRepository CategoryRepository;

	@Override
	public Map<Long,CategoryDTO> findByActive(int active) {
		Map<Long,CategoryDTO> listCategoryDTO = new HashMap<Long,CategoryDTO>();
		List<CategoryEntity> listCategoryEntity = CategoryRepository.findByActive(active);
		for (CategoryEntity categoryEntity : listCategoryEntity) {
			listCategoryDTO.put(categoryEntity.getId(), converter.convertToDTO(categoryEntity));		
		}
		return listCategoryDTO;
	}

}
