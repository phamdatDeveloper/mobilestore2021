package com.mobileshop.controller.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.dto.ProductDTO;
import com.mobileshop.service.CategoryService;
import com.mobileshop.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/product")
	public ModelAndView pageCategoryProduct(ModelAndView model,
			@RequestParam(name = "page", defaultValue = "1") Integer page,
			@RequestParam(name = "limit", defaultValue = "7") Integer limit) {
		Pageable pageable = new PageRequest(page - 1, limit);
		if (page == null || limit == null) {
			pageable = new PageRequest(1, 7);
		}

		Page<ProductDTO> products = productService.getByActive(true, pageable);
		model.addObject("totalPage", products.getTotalPages());
		model.addObject("page", pageable.getPageNumber() + 1);
		model.addObject("products", products.getContent());
		model.setViewName("user/shop-left-sidebar");
		return model;

	}
	@RequestMapping("/product-detail")
	public ModelAndView pageProductDetail(ModelAndView model,@RequestParam("id") long id	) {
		
		ProductDTO products = productService.findById(id);
		model.addObject("products", products);
		model.setViewName("user/product-detail");
		return model;

	}


	@RequestMapping("/product/{category}")
	public ModelAndView pageProductByCategory(ModelAndView model, @PathVariable("category") String category,
			@RequestParam(name = "page", defaultValue = "1") Integer page,
			@RequestParam(name = "limit", defaultValue = "7") Integer limit) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		long id = 0;
		for (Map.Entry<Long, CategoryDTO> category1 : categorys.entrySet()) {
			if (category.equals(category1.getValue().getCategoryName())) {
				id = category1.getKey();
				break;
			}
		}

		Pageable pageable = new PageRequest(page - 1, limit);
		if (page == null || limit == null) {
			pageable = new PageRequest(1, 7);
		}

		Page<ProductDTO> products = productService.findByCategoryIdAndActive(id, true, pageable);
		model.addObject("totalPage", products.getTotalPages());
		model.addObject("page", pageable.getPageNumber() + 1);
		model.addObject("products", products.getContent());
		model.addObject("category", category);
		model.addObject("categorys", categorys);
		model.setViewName("user/shop-left-sidebar");
		return model;
	}
	@RequestMapping("/product-search/{search}")
	public ModelAndView pageSearchProduct(ModelAndView model, @PathVariable("search") String search,
			@RequestParam(name = "page", defaultValue = "1") Integer page,
			@RequestParam(name = "limit", defaultValue = "7") Integer limit) {
		Map<Long, CategoryDTO> categorys = categoryService.findByActive(true);
		

		Pageable pageable = new PageRequest(page - 1, limit);
		if (page == null || limit == null) {
			pageable = new PageRequest(1, 7);
		}

		Page<ProductDTO> products = productService.findByProductNameStartingWith(search, pageable);
		model.addObject("totalPage", products.getTotalPages());
		model.addObject("page", pageable.getPageNumber() + 1);
		model.addObject("products", products.getContent());
		model.addObject("categorys", categorys);
		model.addObject("search", search);
		model.setViewName("user/shop-left-sidebar");
		return model;
	}

}
