package com.mobileshop.dto;

public class CategoryDTO extends BaseDTO{

	private String categoryName;
	
	private boolean active;

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
	
}
