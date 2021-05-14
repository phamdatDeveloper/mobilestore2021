package com.mobileshop.service.impl;

import java.util.ArrayList;
import java.util.List;

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
	public List<CategoryDTO> findByActive(int active) {
		List<CategoryDTO> listCategoryDTO = new ArrayList<CategoryDTO>();
		List<CategoryEntity> listCategoryEntity = CategoryRepository.findByActive(active);
		for (CategoryEntity categoryEntity : listCategoryEntity) {
			listCategoryDTO.add(converter.convertToDTO(categoryEntity));
		}
		return listCategoryDTO;
	}

}
