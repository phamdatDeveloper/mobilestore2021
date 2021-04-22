package com.mobileshop.dto;

import javax.persistence.Column;

import com.mobileshop.entity.BaseEntity;

public class CategoryDTO extends BaseDTO{

	private String categoryName;
	
	private int active;

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
	
	
}
