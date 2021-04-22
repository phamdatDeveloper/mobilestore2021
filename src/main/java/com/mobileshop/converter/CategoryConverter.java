package com.mobileshop.converter;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.dto.ProductDTO;
import com.mobileshop.entity.CategoryEntity;
import com.mobileshop.entity.ProductEntity;

@Component
public class CategoryConverter {
	public CategoryDTO convertToDTO(CategoryEntity entity) {
		ModelMapper modelMapper = new ModelMapper();
		CategoryDTO dto = modelMapper.map(entity, CategoryDTO.class);
//		Map<String, String> districs = new HashMap<>();
//		for (DistrictsEnum item : DistrictsEnum.values()) {
//			districs.put(item.toString(), item.getDistrictValue());
//		}
//		dto.setAddress(dto.getStreet()+", "+dto.getWard()+", "+dto.getDistrict());
//		dto.setAddress(dto.getStreet() + ", " + dto.getWard() + ", " + districs.get(dto.getDistrict()));
		return dto;
	}

	public static CategoryEntity convertToEntity(CategoryDTO dto) {
		ModelMapper modelMapper = new ModelMapper();
		CategoryEntity entity = modelMapper.map(dto, CategoryEntity.class);
		return entity;
	}
}
