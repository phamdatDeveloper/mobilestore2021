package com.mobileshop.service;

import com.mobileshop.dto.UserDTO;


public interface UserService {
	void save(UserDTO user);

	UserDTO findOneByUsernameOrEmail(String username, String email);

	UserDTO findByEmail(String email);
	
	UserDTO findOneByUsername(String username);


	UserDTO findByUsernameAndActive(String username,int active);

	UserDTO findByConfirmToken(String confirmToken);
}
