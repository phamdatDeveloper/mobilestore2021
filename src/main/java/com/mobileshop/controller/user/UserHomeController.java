package com.mobileshop.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.entity.ProductEntity;
import com.mobileshop.repository.ProductRepository;

@Controller
public class UserHomeController {
	@Autowired
	private ProductRepository productRepository;
	@RequestMapping("/")
	public String index(Model model) {
		ProductEntity p = productRepository.findOne(2L);
		List<ProductEntity> products = productRepository.findAll();
		model.addAttribute("listProduct", p);
		model.addAttribute("products", products);
		return "user/index";
	}
}
