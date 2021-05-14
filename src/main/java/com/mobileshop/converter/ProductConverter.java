package com.mobileshop.converter;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import com.mobileshop.dto.ProductDTO;
import com.mobileshop.entity.ProductEntity;

@Component
public class ProductConverter {
	public  ProductDTO convertToDTO(ProductEntity entity) {
		ModelMapper modelMapper = new ModelMapper();
		ProductDTO dto = modelMapper.map(entity, ProductDTO.class);
		List<String> secondaryImage = new ArrayList<String>();
		StringTokenizer link = new StringTokenizer(entity.getSecondaryImage(), ",");
		while (link.hasMoreTokens()) {
			secondaryImage.add(link.nextToken());
        }
		dto.setSecondaryImage(secondaryImage);
		if(entity.getStatus() != null) {
			StringTokenizer status = new StringTokenizer(entity.getStatus(), ",");
			while (status.hasMoreTokens()) {
				String token = status.nextToken();
				if(token.equals("MOI")) {
					dto.setIsNew(true);
				}else if(token.equals("KHUYEN_MAI")) {
					dto.setIsSale(true);
				}else {
					dto.setIsNew(false);
					dto.setIsSale(false);
				}
	        }
		}
		return dto;
	}

	public ProductEntity convertToEntity(ProductDTO dto) {
		ModelMapper modelMapper = new ModelMapper();
		ProductEntity entity = modelMapper.map(dto, ProductEntity.class);
		StringBuilder secondaryImage = new StringBuilder();
		for (String link : dto.getSecondaryImage()) {
			secondaryImage.append(link+",");
		}
		@SuppressWarnings("deprecation")
		Date date = new Date(2021, 9, 12);
		entity.setCreateDate(date);
		entity.setModifyDate(date);
		entity.setSecondaryImage(secondaryImage.toString());
		return entity;
	}
}
