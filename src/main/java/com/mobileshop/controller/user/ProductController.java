package com.mobileshop.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mobileshop.dto.ProductDTO;
import com.mobileshop.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;

	@RequestMapping("/product")
	public String product(Model model) {
		List<ProductDTO> products = productService.findAll();
		model.addAttribute("products", products);
		return "user/shop-left-sidebar";
		
	}
}
