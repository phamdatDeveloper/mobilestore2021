package com.mobileshop.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.dto.ProductDTO;
import com.mobileshop.dto.UserDTO;
import com.mobileshop.service.CategoryService;
import com.mobileshop.service.OrderService;
import com.mobileshop.service.ProductService;
import com.mobileshop.service.UserService;

@Controller
public class UserHomeController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;

// Trang chu
	@RequestMapping("/")
	public ModelAndView index(ModelAndView model, HttpSession session) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		Map<Long, List<ProductDTO>> listProductCategory = new HashMap<Long, List<ProductDTO>>();
		for (Map.Entry<Long, CategoryDTO> category : categorys.entrySet()) {
			Page<ProductDTO> products = productService.findByCategoryIdAndActive(category.getKey(), true, null);
			listProductCategory.put(category.getKey(), products.getContent());
		}
		model.addObject("listProductCategory", listProductCategory);
		model.addObject("categorys", categorys);
		model.setViewName("user/index");
		return model;
	}

	@RequestMapping("/user")
	public ModelAndView userInforPage(ModelAndView model, HttpSession session) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String username = ((UserDetails) principal).getUsername();
		UserDTO userNameExist = userService.findOneByUsername(username);

		model.addObject("categorys", categorys);
		model.addObject("formEditUser", userNameExist);
		model.setViewName("user/user-infor");
		return model;
	}

	@RequestMapping("/changepassword")
	public ModelAndView changePasswordPage(ModelAndView model, HttpSession session) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		model.addObject("categorys", categorys);

		model.setViewName("user/change-password");
		return model;
	}

	@RequestMapping("/orderInfor")
	public ModelAndView orderInforPage(ModelAndView model, HttpSession session) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		model.addObject("categorys", categorys);

		model.setViewName("user/order-infor");
		return model;
	}

}
