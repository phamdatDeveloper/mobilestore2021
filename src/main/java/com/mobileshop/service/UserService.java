package com.mobileshop.service;

import java.util.List;

import com.mobileshop.dto.UserDTO;
import com.mobileshop.entity.UserEntity;

public interface UserService {
	void save(UserDTO user);

	List<UserDTO> findByIsDelete(boolean isDelete);
	
	UserDTO findById(long id);

	UserDTO findOneByUsernameOrEmail(String username, String email);

	UserDTO findByEmail(String email);

	UserDTO findOneByUsername(String username);

	UserDTO findByUsernameAndActive(String username, int active);

	UserDTO findByConfirmToken(String confirmToken);
}
