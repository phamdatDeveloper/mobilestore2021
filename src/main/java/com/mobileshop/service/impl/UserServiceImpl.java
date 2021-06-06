package com.mobileshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserConverter userConverter;
	@Autowired
	private UsersRolesRepository usersRolesRepository;
	@Autowired
	private RoleRepository roleRepository;

	@Override
	@Transactional
	public void save(UserDTO user) {
//		UserEntity userEntity = userRepository.save(userConverter.convertToEntity(user));
//		if (user.getActive() != 0) {
		UserEntity userEntity = userConverter.convertToEntity(user);
		List<UsersRolesEntity> usersRolesEntity = new ArrayList<UsersRolesEntity>();
		List<String> roles = user.getRole();
		// Truong hop nguoi dang ky moi chua co id
		if (user.getId() == null) {
			UsersRolesEntity usersRoles = new UsersRolesEntity();
			usersRoles.setRole(roleRepository.findByName("ROLE_USER"));
			usersRoles.setUsers(userEntity);
//			usersRolesEntity.add(usersRoles);
//		} else {
//			for (String role : roles) {
//				UsersRolesEntity usersRoles = new UsersRolesEntity();
//				usersRoles.setRole(roleRepository.findByName(role));
//				usersRoles.setUsers(userEntity);
//				usersRolesEntity.add(usersRoles);
//			}
//		}

//		usersRoles.setUsers(userEntity);
//
//		usersRolesRepository.save(usersRoles);
			userEntity.setUsersRoleses(usersRolesEntity);
			userRepository.save(userEntity);
			usersRolesRepository.save(usersRoles);
		} else {
			for (String string : roles) {
				UsersRolesEntity usersRoles = new UsersRolesEntity();
				usersRoles.setRole(roleRepository.findByName(string));
				usersRoles.setUsers(userEntity);
				usersRolesEntity.add(usersRoles);
			}
			userEntity.setUsersRoleses(usersRolesEntity);
			List<UsersRolesEntity> listUserRoleDelete = usersRolesRepository.findByUsers(userEntity);
			for (UsersRolesEntity usersRolesEntity2 : listUserRoleDelete) {
				usersRolesRepository.delete(usersRolesEntity2.getId());
			}
			userRepository.save(userEntity);
		}
//		}
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
	public UserDTO findByUsernameAndActive(String username, int active) {
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

	@Override
	public UserDTO findOneByUsername(String username) {
		UserEntity userEntity = userRepository.findOneByUsername(username);
		if (userEntity == null) {
			return null;
		} else {
			UserDTO userDTO = userConverter.convertToDTO(userEntity);
			return userDTO;
		}
	}

	@Override
	public List<UserDTO> findByIsDelete(boolean isDelete) {
		List<UserEntity> listUserEntity = userRepository.findByIsDelete(isDelete);

		List<UserDTO> listUserDTO = new ArrayList<UserDTO>();

		for (UserEntity userEntity : listUserEntity) {
			UserDTO newUser = userConverter.convertToDTO(userEntity);
			List<UsersRolesEntity> listUsersRoles = userEntity.getUsersRoleses();
			List<String> roles = new ArrayList<String>();
			for (UsersRolesEntity usersRolesEntity : listUsersRoles) {
				RoleEntity role = usersRolesEntity.getRole();
				roles.add(role.getName());
			}
			newUser.setRole(roles);
			listUserDTO.add(newUser);
		}
		return listUserDTO;
	}

	@Override
	public UserDTO findById(long id) {
		UserEntity userEntity = userRepository.findById(id);
		if (userEntity == null) {
			return null;
		} else {
			UserDTO userDTO = userConverter.convertToDTO(userEntity);
			List<UsersRolesEntity> listUsersRoles = userEntity.getUsersRoleses();
			List<String> roles = new ArrayList<String>();
			for (UsersRolesEntity usersRolesEntity : listUsersRoles) {
				RoleEntity role = usersRolesEntity.getRole();
				roles.add(role.getName());
			}
			userDTO.setRole(roles);
			return userDTO;
		}
	}

}
