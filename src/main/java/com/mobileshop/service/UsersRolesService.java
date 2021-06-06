package com.mobileshop.service;

import java.util.List;

import com.mobileshop.dto.UserDTO;
import com.mobileshop.entity.UsersRolesEntity;

public interface UsersRolesService {
	void save(Long id,String[] role);

}
