package com.mobileshop.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.dto.ProductDTO;
import com.mobileshop.entity.ProductEntity;
import com.mobileshop.repository.ProductRepository;
import com.mobileshop.service.CategoryService;
import com.mobileshop.service.ProductService;

@Controller
public class UserHomeController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/")
	public String index(Model model) {
		List<CategoryDTO> categorys = categoryService.findByActive(1);

		List<ProductDTO> products = productService.findAll();
		model.addAttribute("products", products);
		model.addAttribute("categorys", categorys);

		return "user/index";
	}
	
	@RequestMapping("/product/{category}")
	public String getByProductCategory(Model model,@PathVariable("category") String category) {
		List<CategoryDTO> categorys = categoryService.findByActive(1);
		Long categoryID = 0L;
		for (CategoryDTO categoryDTO : categorys) {
			if(categoryDTO.getCategoryName().equals(category)) {
				categoryID = categoryDTO.getId();
			}
			break;
		}
		List<ProductDTO> products = productService.findAll();
		model.addAttribute("products", products);
		model.addAttribute("categorys", categorys);

		return "user/index";
	}
}
