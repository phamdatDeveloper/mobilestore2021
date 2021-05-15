package com.mobileshop.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.dto.ProductDTO;
import com.mobileshop.service.CategoryService;
import com.mobileshop.service.ProductService;

@Controller
public class AdminHomeController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/admin/home")
	public String adminHome(Model model) {
		Long countProduct = productService.count();
		model.addAttribute("countProduct", countProduct);
		return "admin/index";
	}
	
	@RequestMapping("/admin/product-edit/{id}")
	public String adminEdit(@PathVariable("id")Long id,Model model) {
		ProductDTO product =  productService.findById(id);
		
		List<String> secondaryImage = product.getSecondaryImage();
		
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(1);
		
		model.addAttribute("secondaryImage", secondaryImage);
		model.addAttribute("product", product);
		model.addAttribute("categorys", categorys);
		return "admin/product-edit";
	}
	
	@PostMapping("/admin/product-edit/{id}")
	public String adminUpdateProduct(@PathVariable("id")Long id,@ModelAttribute("product") ProductDTO product) {
		productService.update(product);
		
		return "redirect:/admin/product-edit/{id}";
	}
	
	@RequestMapping("/admin/product-manager" )
	public String adminAdd(Model model,HttpServletRequest request) {	
		List<ProductDTO> listProduct = productService.findAll();
		model.addAttribute("products", listProduct);
		return "admin/product-manager";
	}
	@RequestMapping("/admin/product-add" )
	public String adminShowAddProduct(Model model,HttpServletRequest request,@ModelAttribute("product") ProductDTO product) {	
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(1);

		model.addAttribute("categorys", categorys);
		return "admin/product-add";
	}
	
	@PostMapping("/admin/product-add" )
	public String adminAddProduct(Model model,HttpServletRequest request,@ModelAttribute("product") ProductDTO product) {	
		productService.save(product);
		
		return "redirect:/admin/product-manager";
		
	}
}
