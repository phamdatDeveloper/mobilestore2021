package com.mobileshop.controller.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.dto.UserDTO;
import com.mobileshop.service.UserService;
import com.mobileshop.service.UsersRolesService;

@RestController
public class UserAPI {

	@Autowired
	private UserService userService;
	@Autowired
	private UsersRolesService userRoleService;

	@RequestMapping(value =  "/api/user/{id}", method = RequestMethod.GET)
	public @ResponseBody UserDTO getUser(@PathVariable("id") Long id) {
		UserDTO user = userService.findById(id);
		return user;
	}
	
	@RequestMapping(value =  "/api/user", method = RequestMethod.PUT)
	@Transactional
	public @ResponseBody UserDTO updateUser(@RequestParam(value = "id", required = false) Long id, @RequestParam(value ="roles", required = false) String[] role,
			@RequestParam(value ="active", required = false) boolean active) {
		
		UserDTO userDTO = userService.findById(id);
		userDTO.setActive(active);
		List<String> listRole = new ArrayList<String>();
		for (String string : role) {
			listRole.add(string);
		}
		userDTO.setRole(listRole);
		userService.save(userDTO);
//		userRoleService.save(id, role);
		
		
		return userService.findById(id);
	}
	
	@RequestMapping(value =  "/api/user/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String deleteUser(@PathVariable("id") Long id) {
		UserDTO user = userService.findById(id);
		user.setDelete(true);
		userService.save(user);
		return "delete ok";
	}
}
