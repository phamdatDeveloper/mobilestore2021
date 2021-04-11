package com.mobileshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin")
public class AdminHomeController {
	@RequestMapping("/")
	public String adminHome(ModelAndView modelAndView) {
		return "admin/index";
	}
}
