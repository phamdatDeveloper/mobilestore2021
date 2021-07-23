package com.mobileshop.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.constant.SystemConstant;
import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.dto.ProductDTO;
import com.mobileshop.dto.UserDTO;
import com.mobileshop.service.CategoryService;
import com.mobileshop.service.ProductService;
import com.mobileshop.service.UserService;

@Controller
public class AdminHomeController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private UserService userService;

	@RequestMapping("/admin/home")
	public String adminHome(Model model) {
		Long countProduct = productService.count();
		model.addAttribute("countProduct", countProduct);
		return "admin/index";
	}

	@RequestMapping("/admin/user-manager")
	public ModelAndView adminUserManagerPage(ModelAndView model) {
		List<UserDTO> listUser = userService.findByIsDelete(SystemConstant.ISDELETE);
		model.addObject("listUser", listUser);
		model.setViewName("admin/user-manager");
		return model;
	}

	@RequestMapping("/admin/category-manager")
	public ModelAndView adminCategoryManagerPage(ModelAndView model) {
		List<CategoryDTO> listCategory = categoryService.findAll();
		model.addObject("listCategory", listCategory);
		model.setViewName("admin/category-manager");
		return model;
	}

	@RequestMapping("/admin/product-edit/{id}")
	public String adminEdit(@PathVariable("id") Long id, Model model) {
		ProductDTO product = productService.findById(id);

		List<String> secondaryImage = product.getSecondaryImage();

		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		List<CategoryDTO> listCategory = new ArrayList<CategoryDTO>();
		for (Map.Entry<Long, CategoryDTO> entry : categorys.entrySet()) {
			listCategory.add(entry.getValue());
		}
		model.addAttribute("secondaryImage", secondaryImage);
		model.addAttribute("product", product);
		model.addAttribute("categorys", listCategory);
		return "admin/product-edit";
	}

	@PostMapping("/admin/product-edit/{id}")
	public ModelAndView adminUpdateProduct(@PathVariable("id") Long id, @ModelAttribute("product") ProductDTO product,
			BindingResult bindingResult) {
		ModelAndView mv = new ModelAndView();
		if (bindingResult.hasErrors()) {
			mv.setViewName("admin/product-edit");
		} else {
			productService.save(product);
			mv.setViewName("redirect:/admin/product-edit/{id}");
		}
		return mv;
	}

	@RequestMapping("/admin/product-manager")
	public String adminAdd(Model model, HttpServletRequest request) {
		List<ProductDTO> listProduct = productService.findAll();
		model.addAttribute("products", listProduct);
		return "admin/product-manager";
	}

	@RequestMapping("/admin/product-add")
	public String adminShowAddProduct(Model model, HttpServletRequest request,
			@ModelAttribute("product") ProductDTO product) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		List<CategoryDTO> listCategory = new ArrayList<CategoryDTO>();
		for (Map.Entry<Long, CategoryDTO> entry : categorys.entrySet()) {
			listCategory.add(entry.getValue());
		}
		model.addAttribute("categorys", listCategory);
		return "admin/product-add";
	}

	@PostMapping("/admin/product-add")
	public ModelAndView adminAddProduct(Model model, HttpServletRequest request,
			@ModelAttribute("product") ProductDTO product,BindingResult bindingResult) {
		ModelAndView mv = new ModelAndView();
		if(bindingResult.hasErrors()) {
			mv.setViewName("admin/product-add");
		}else {
		productService.save(product);
		mv.setViewName("redirect:/admin/product-manager");
		}
		return mv;

	}
}
