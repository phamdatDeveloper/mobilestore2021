package com.mobileshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class ProductEntity extends BaseEntity {

//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Long Id;

	@Column(name = "productname")
	private String productName;

	@Column(name = "price")
	private double price;

	@Column(name = "pricesale")
	private double priceSale;
	
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "specification")
	private String specification;
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "categoryid", referencedColumnName="id")
//	private CategoryEntity category;
	
	@Column(name = "quantity")
	private int quantity;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "active")
	private int active;
	
	@Column(name = "categoryid")
	private int categoryId;

//	private String createBy;
//
//	private Date createDate;
//
//	private String modifyBy;
//
//	private Date modifyDate;

//	public Long getId() {
//		return Id;
//	}
//
//	public void setId(Long id) {
//		Id = id;
//	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(double priceSale) {
		this.priceSale = priceSale;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

//	public CategoryEntity getCategory() {
//		return category;
//	}
//
//	public void setCategory(CategoryEntity category) {
//		this.category = category;
//	}


}
