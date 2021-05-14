package com.mobileshop.converter;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import com.mobileshop.dto.ProductDTO;
import com.mobileshop.dto.UserDTO;
import com.mobileshop.entity.ProductEntity;
import com.mobileshop.entity.UserEntity;

@Component
public class UserConverter {
	public  UserDTO convertToDTO(UserEntity entity) {
		ModelMapper modelMapper = new ModelMapper();
		UserDTO dto = modelMapper.map(entity, UserDTO.class);
		return dto;
	}

	public UserEntity convertToEntity(UserDTO dto) {
		ModelMapper modelMapper = new ModelMapper();
		UserEntity entity = modelMapper.map(dto, UserEntity.class);
		return entity;
	}
}
