package com.mobileshop.controller.user;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.dto.CartDTO;
import com.mobileshop.dto.OrderDTO;
import com.mobileshop.dto.ProductDTO;
import com.mobileshop.service.CartService;
import com.mobileshop.service.CategoryService;
import com.mobileshop.service.OrderService;
import com.mobileshop.service.ProductService;

@Controller
public class CartController {
	@Autowired
	private ProductService productService;
//	@Autowired
//	private CategoryService categoryService;
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;


	// Trang gio hang
	@SuppressWarnings("unchecked")
	@RequestMapping("/cart")
	public String cart(HttpSession session) {
		HashMap<Long, CartDTO> carts = (HashMap<Long, CartDTO>) session.getAttribute("carts");
		if (carts == null) {
			carts = new HashMap<Long, CartDTO>();
		}

		session.setAttribute("carts", carts);
		session.setAttribute("totalPrice", cartService.totalPrice(carts));

		return "user/shopping-cart";
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/checkout")
	public ModelAndView checkoutPage(ModelAndView model, HttpSession session) {
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		System.out.println(userName);
		HashMap<Long, CartDTO> carts = (HashMap<Long, CartDTO>) session.getAttribute("carts");
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") == null) {
			model.addObject("alertCart", "loginnull");
			model.setViewName("user/shopping-cart");

		} else if ((carts == null) || carts.isEmpty()) {
			carts = new HashMap<Long, CartDTO>();

			model.addObject("alertCart", "cartnull");
			model.setViewName("user/shopping-cart");
		} else {
//				List<CategoryDTO> categorys = categoryService.findByActive(1);

			List<ProductDTO> products = productService.findAll();
			model.addObject("products", products);
			OrderDTO newOrder = new OrderDTO();
			newOrder.setCarts(carts);
			model.addObject("formCheckout",newOrder);
			model.setViewName("user/checkout");
		}

		return model;
	}

	@RequestMapping(value =  "/checkout" ,method=RequestMethod.POST)
	@SuppressWarnings("unchecked")
	public ModelAndView checkoutProcess(ModelAndView model,@ModelAttribute("formCheckout") @Valid OrderDTO orderDTO,BindingResult bindingResult,
			  HttpSession session) {
		if (bindingResult.hasErrors()) {
			model.setViewName("user/checkout");
			
		}else {
		HashMap<Long, CartDTO> carts = (HashMap<Long, CartDTO>) session.getAttribute("carts");
		orderDTO.setCarts(carts);
//				List<CategoryDTO> categorys = categoryService.findByActive(1);
			orderService.save(orderDTO);
			
			model.addObject("paymentSuccess", "paymentSuccess");
			model.setViewName("redirect:/");
		}
		return model;
	}
}
