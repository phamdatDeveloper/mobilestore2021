package com.mobileshop.converter;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import com.mobileshop.dto.UserDTO;
import com.mobileshop.entity.UserEntity;
import com.mobileshop.entity.UsersRolesEntity;

@Component
public class UserConverter {
	public  UserDTO convertToDTO(UserEntity entity) {
		ModelMapper modelMapper = new ModelMapper();
		UserDTO dto = modelMapper.map(entity, UserDTO.class);
		List<String> roles = new ArrayList<String>();
		List<UsersRolesEntity> usersRoles = entity.getUsersRoleses();
		for (UsersRolesEntity usersRolesEntity : usersRoles) {
			roles.add(usersRolesEntity.getRole().getName());
		}
		dto.setRole(roles);
		return dto;
	}

	public UserEntity convertToEntity(UserDTO dto) {
		ModelMapper modelMapper = new ModelMapper();
		UserEntity entity = modelMapper.map(dto, UserEntity.class);
		
		return entity;
	}
}
