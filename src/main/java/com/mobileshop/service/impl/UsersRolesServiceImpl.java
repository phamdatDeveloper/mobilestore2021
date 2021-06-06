package com.mobileshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mobileshop.converter.UserConverter;
import com.mobileshop.entity.RoleEntity;
import com.mobileshop.entity.UsersRolesEntity;
import com.mobileshop.repository.RoleRepository;
import com.mobileshop.repository.UserRepository;
import com.mobileshop.repository.UsersRolesRepository;
import com.mobileshop.service.UsersRolesService;
@Service
public class UsersRolesServiceImpl implements UsersRolesService {
	@Autowired
	private UserConverter userConverter;
	@Autowired
	private UsersRolesRepository usersRolesRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private UserRepository userRepository;

	@Override
	@Transactional
	public void save(Long id, String[] roles) {
		List<UsersRolesEntity> listUserRole = userRepository.findById(id).getUsersRoleses();
		if (roles == null) {
			return;
		} else if (roles.length < listUserRole.size()) {
			for (int i = 0; i < roles.length; i++) {
				UsersRolesEntity userRole = listUserRole.get(i);
				RoleEntity roleEntity = roleRepository.findByName(roles[i]);
				if (roleEntity != null) {
					userRole.setRole(roleEntity);
					usersRolesRepository.save(userRole);
				}
			}
//			usersRolesRepository.delete(listUserRole.get(listUserRole.size()-1));
			listUserRole.remove(listUserRole.size() - 1);
		} else if (roles.length > listUserRole.size()) {
			UsersRolesEntity newUserRole = listUserRole.get(listUserRole.size()-1);
			newUserRole.setId(null);
//			usersRolesRepository.save(newUserRole);
			listUserRole.add(newUserRole);
		}else {
			for (int i = 0; i < roles.length; i++) {
				UsersRolesEntity userRole = listUserRole.get(i);
				RoleEntity roleEntity = roleRepository.findByName(roles[i]);
				if (roleEntity != null) {
					userRole.setRole(roleEntity);
					usersRolesRepository.save(userRole);
				}
			}
		}

//		UserEntity userEntity = userConverter.convertToEntity(userDTO);
//		List<UsersRolesEntity> usersRolesEntity = usersRolesRepository.findByUsers(userEntity);
//
//		if(userDTO.getRole().size() == usersRolesEntity.size()) {
//			return;
//		}else if(userDTO.getRole().size() < usersRolesEntity.size()) {
//			usersRolesRepository.delete(usersRolesEntity.get(0).getId());
//		}
	}

}
