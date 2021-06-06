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
	private CategoryRepository categoryRepository;

	@Override
	public Map<Long, CategoryDTO> findByActive(boolean active) {
		Map<Long, CategoryDTO> listCategoryDTO = new HashMap<Long, CategoryDTO>();
		List<CategoryEntity> listCategoryEntity = categoryRepository.findByActive(active);
		for (CategoryEntity categoryEntity : listCategoryEntity) {
			listCategoryDTO.put(categoryEntity.getId(), converter.convertToDTO(categoryEntity));
		}
		return listCategoryDTO;
	}

	@Override
	public CategoryDTO save(CategoryDTO categoryDTO) {
		CategoryEntity categoryEntity = categoryRepository.save(converter.convertToEntity(categoryDTO));
		return converter.convertToDTO(categoryEntity);
	}

	@Override
	public CategoryDTO findById(Long id) {
		CategoryDTO category = converter.convertToDTO(categoryRepository.findById(id));
		return category;
	}

	@Override
	public List<CategoryDTO> findAll() {
		List<CategoryDTO> listCategoryDTO = new ArrayList<CategoryDTO>();
		List<CategoryEntity> listCategoryEntity = categoryRepository.findAll();
		for (CategoryEntity categoryEntity : listCategoryEntity) {
			listCategoryDTO.add(converter.convertToDTO(categoryEntity));
		}
		return listCategoryDTO;
	}

}
