package com.mobileshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.service.impl.ProductServiceImpl;

@Controller

public class AdminHomeController {
	@Autowired
	private ProductServiceImpl productService;
	
	@RequestMapping("/admin/home")
	public String adminHome(ModelAndView modelAndView) {
		return "admin/index";
	}
	
	@RequestMapping("/admin/editproduct")
	public String adminEdit(ModelAndView modelAndView) {
		return "admin/product-edit";
	}
	
	@RequestMapping("/admin/add" )
	public String adminAdd(ModelAndView modelAndView,HttpServletRequest request) {
		
		return "admin/index";
	}
}
