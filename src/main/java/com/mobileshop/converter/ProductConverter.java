package com.mobileshop.converter;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import com.mobileshop.dto.ProductDTO;
import com.mobileshop.entity.ProductEntity;

@Component
public class ProductConverter {
	public  ProductDTO convertToDTO(ProductEntity entity) {
		ModelMapper modelMapper = new ModelMapper();
		ProductDTO dto = modelMapper.map(entity, ProductDTO.class);
//		Map<String, String> districs = new HashMap<>();
//		for (DistrictsEnum item : DistrictsEnum.values()) {
//			districs.put(item.toString(), item.getDistrictValue());
//		}
//		dto.setAddress(dto.getStreet()+", "+dto.getWard()+", "+dto.getDistrict());
//		dto.setAddress(dto.getStreet() + ", " + dto.getWard() + ", " + districs.get(dto.getDistrict()));
		return dto;
	}

	public static ProductEntity convertToEntity(ProductDTO dto) {
		ModelMapper modelMapper = new ModelMapper();
		ProductEntity entity = modelMapper.map(dto, ProductEntity.class);
		return entity;
	}
}
