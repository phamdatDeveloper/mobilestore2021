package com.mobileshop.controller.user;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.dto.OrderDTO;
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
		Map<String, List<ProductDTO>> listProductCategory = new LinkedHashMap<String, List<ProductDTO>>();
		for (Map.Entry<Long, CategoryDTO> category : categorys.entrySet()) {
			Page<ProductDTO> products = productService.findByCategoryIdAndActive(category.getKey(), true, new PageRequest(0,10));
			listProductCategory.put(category.getValue().getCategoryName(), products.getContent());
		}
		model.addObject("listProductCategory", listProductCategory);
		model.addObject("categorys", categorys);
		model.setViewName("user/index");
		return model;
	}

	// Trang thong tin user
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

	// Update thong tin trong trang user
	@PostMapping("/user")
	public ModelAndView saveUserInfor(@ModelAttribute("formEditUser") UserDTO userDTO) {
		ModelAndView mv = new ModelAndView();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String username = ((UserDetails) principal).getUsername();
		UserDTO userNameExist = userService.findOneByUsername(username);

		userNameExist.setFullName(userDTO.getFullName());
		userNameExist.setAddress(userDTO.getAddress());
		userNameExist.setNumberPhone(userDTO.getNumberPhone());

		userService.save(userNameExist);
		mv.setViewName("redirect:/user");
		return mv;
	}

	// Trang thay doi mat khau
	@RequestMapping("/changepassword")
	public ModelAndView changePasswordPage(ModelAndView model, HttpSession session) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		model.addObject("categorys", categorys);

		model.setViewName("user/change-password");
		return model;
	}

	// Trang hien thi thong tin don dat hang
	@RequestMapping("/orderInfor")
	public ModelAndView orderInforPage(ModelAndView model, HttpSession session) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		model.addObject("categorys", categorys);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails) principal).getUsername();
		UserDTO userNameExist = userService.findOneByUsername(username);
		long id = userNameExist.getId();
		List<OrderDTO> listOrder = orderService.findByUserId(id);
		model.addObject("listOrder", listOrder);
		model.setViewName("user/order-infor");
		return model;
	}
	@RequestMapping("/about-us")
	public ModelAndView aboutUsPage() {
		ModelAndView mv = new ModelAndView();
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		mv.addObject("categorys", categorys);
		mv.setViewName("user/about-us");
		return mv;
	}
	@RequestMapping("/contact")
	public ModelAndView contactPage() {
		ModelAndView mv = new ModelAndView();
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		mv.addObject("categorys", categorys);
		mv.setViewName("user/contact");
		
		return mv;
	}

}
