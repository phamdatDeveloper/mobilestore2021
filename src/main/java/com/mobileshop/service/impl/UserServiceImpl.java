package com.mobileshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsPasswordService;
import org.springframework.stereotype.Service;

import com.mobileshop.converter.UserConverter;
import com.mobileshop.dto.UserDTO;
import com.mobileshop.entity.RoleEntity;
import com.mobileshop.entity.UserEntity;
import com.mobileshop.entity.UsersRolesEntity;
import com.mobileshop.repository.RoleRepository;
import com.mobileshop.repository.UserRepository;
import com.mobileshop.repository.UsersRolesRepository;
import com.mobileshop.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserConverter userConverter;
	@Autowired
	private UsersRolesRepository usersRolesRepository;
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public void save(UserDTO user) {
		UserEntity userEntity = userRepository.save(userConverter.convertToEntity(user));
		if (user.getActive() != 0) {
			UserDTO userDTO = userConverter.convertToDTO(userEntity);
			UsersRolesEntity usersRoles = new UsersRolesEntity();
			usersRoles.setUsers(userEntity);
			usersRoles.setRole(roleRepository.findByName("ROLE_USER"));
			usersRolesRepository.save(usersRoles);
		}
	}

	@Override
	public UserDTO findOneByUsernameOrEmail(String username, String email) {
		UserEntity userEntity = userRepository.findOneByUsernameAndEmail(username, email);
		if (userEntity == null) {
			return null;
		} else {
			UserDTO userDTO = userConverter.convertToDTO(userEntity);
			return userDTO;
		}
	}

	@Override
	public UserDTO findByEmail(String email) {
		UserEntity userEntity = userRepository.findByEmail(email);
		if (userEntity == null) {
			return null;
		} else {
			UserDTO userDTO = userConverter.convertToDTO(userEntity);
			return userDTO;
		}
	}

	@Override
	public UserDTO findByUsernameAndActive(String username,int active) {
		UserEntity userEntity = userRepository.findByUsernameAndActive(username, active);
		if (userEntity == null) {
			return null;
		} else {
			UserDTO userDTO = userConverter.convertToDTO(userEntity);
			return userDTO;
		}
	}

	@Override
	public UserDTO findByConfirmToken(String confirmToken) {
		UserEntity userEntity = userRepository.findByConfirmToken(confirmToken);
		if (userEntity == null) {
			return null;
		} else {
			UserDTO userDTO = userConverter.convertToDTO(userEntity);
			return userDTO;
		}

	}

	

}
