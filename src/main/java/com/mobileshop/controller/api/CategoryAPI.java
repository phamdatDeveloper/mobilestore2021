
package com.mobileshop.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.dto.CategoryDTO;
import com.mobileshop.service.CategoryService;

@RestController
public class CategoryAPI {
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/api/categorys", method = RequestMethod.GET)
	public @ResponseBody List<CategoryDTO> getAllCategory() {
		List<CategoryDTO> categorys = categoryService.findAll();
		return categorys;
	}

	@RequestMapping(value = "/api/categorys/{id}", method = RequestMethod.GET)
	public @ResponseBody CategoryDTO getCategory(@PathVariable("id") Long id) {
		CategoryDTO category = categoryService.findById(id);
		return category;
	}

	@RequestMapping(value = "/api/categorys", method = RequestMethod.POST)
	public @ResponseBody String addCategory(@Param("categoryName") String categoryName) {
		CategoryDTO category = new CategoryDTO();
		category.setCategoryName(categoryName);
		category.setActive(true);
		categoryService.save(category);
		return "save ok";
	}

	@RequestMapping(value = "/api/categorys", method = RequestMethod.PUT)
	public @ResponseBody CategoryDTO updateCategory(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "categoryName", required = false) String categoryName,
			@RequestParam(value = "active",defaultValue="true",  required = false) boolean active) {
		if (id != null) {
			CategoryDTO category = categoryService.findById(id);

			category.setCategoryName(categoryName);
			category.setActive(active);
			CategoryDTO newCategory = categoryService.save(category);
			return newCategory;
		} else {
			CategoryDTO category = new CategoryDTO();
			category.setCategoryName(categoryName);
			category.setActive(active);
			CategoryDTO newCategory = categoryService.save(category);
			return newCategory;
		}	

	}
}
