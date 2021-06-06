package com.mobileshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class CategoryEntity extends BaseEntity {

	@Column(name = "categoryname")
	private String categoryName;
	@Column(name = "active")
	private boolean active;

//	@OneToMany(mappedBy = "category")
//	private List<ProductEntity> products;

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
