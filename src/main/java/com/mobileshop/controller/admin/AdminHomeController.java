package com.mobileshop.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.dto.ProductDTO;
import com.mobileshop.repository.CategoryRepository;
import com.mobileshop.service.CategoryService;
import com.mobileshop.service.ProductService;
import com.mobileshop.service.impl.ProductServiceImpl;

@Controller

public class AdminHomeController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/admin/home")
	public String adminHome(ModelAndView modelAndView) {
		return "admin/index";
	}
	
	@RequestMapping("/admin/product-edit/{id}")
	public String adminEdit(@PathVariable("id")Long id,Model model) {
		ProductDTO product =  productService.getProductByID(id);
		
		List<CategoryDTO> categorys = categoryService.findByActive(1);
		model.addAttribute("product", product);
		model.addAttribute("categorys", categorys);
		return "admin/product-edit";
	}
	
	
	@RequestMapping("/admin/product-manager" )
	public String adminAdd(Model model,HttpServletRequest request) {	
		List<ProductDTO> listProduct = productService.findAll();
		model.addAttribute("products", listProduct);
		return "admin/product-manager";
	}
}
