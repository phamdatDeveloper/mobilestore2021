package com.mobileshop.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.constant.SystemConstant;
import com.mobileshop.dto.CartDTO;
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
	public ModelAndView index(ModelAndView model) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(1);
		List<ProductDTO> products = productService.findAll();
		Map<String,ProductDTO> listProductCategory = new HashMap<String, ProductDTO>();
		
		model.addObject("products", products);
		model.addObject("categorys", categorys);
		model.setViewName("user/index");
		return model;
	}

	@RequestMapping("/product/{category}")
	public ModelAndView pageProductByCategory(ModelAndView model, @PathVariable("category") String category) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(SystemConstant.ACTIVE_STATUS);
		List<ProductDTO> products;
		if(("").equals(category)) {
			products = productService.findAll();
		}else {
			products = productService.findByCategoryAndActive(category, true);
		}
//		Long categoryID = 0L;
//		for (CategoryDTO categoryDTO : categorys) {
//			if (categoryDTO.getCategoryName().equals(category)) {
//				categoryID = categoryDTO.getId();
//			}
//			break;
//		}
		model.addObject("products", products);
		model.addObject("categorys", categorys);
		model.setViewName("user/shop-left-sidebar");
		return model;
	}

	@RequestMapping("/checkout")
	public ModelAndView checkoutPage(ModelAndView model, HttpSession session) {

		HashMap<Long, CartDTO> carts = (HashMap<Long, CartDTO>) session.getAttribute("carts");
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") == null) {

			model.setViewName("redirect:/login");

		} else if (carts == null) {
			carts = new HashMap<Long, CartDTO>();
			model.setViewName("redirect:/");
		} else {
//			List<CategoryDTO> categorys = categoryService.findByActive(1);

			List<ProductDTO> products = productService.findAll();
			model.addObject("products", products);
//			model.addObject("categorys", categorys);

			model.setViewName("user/checkout");
		}

		return model;
	}
}
