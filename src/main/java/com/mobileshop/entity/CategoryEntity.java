package com.mobileshop.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class CategoryEntity extends BaseEntity {

	@Column(name = "categoryname")
	private String categoryName;
	@Column(name = "active")
	private int active;

//	@OneToMany(mappedBy = "category")
//	private List<ProductEntity> products;

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
