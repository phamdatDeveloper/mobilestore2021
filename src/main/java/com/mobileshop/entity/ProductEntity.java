package com.mobileshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class ProductEntity extends BaseEntity {

	@Column(name = "productname")
	private String productName;

	@Column(name = "price")
	private int price;

	@Column(name = "pricesale")
	private int priceSale;

	@Column(name = "description")
	@Lob
	private String description;

	@Column(name = "specification")
	private String specification;

	@Column(name = "mainimage")
	private String mainImage;

	@Column(name = "secondaryimage")
	private String secondaryImage;

	@Column(name = "quantity")
	private int quantity;

	@Column(name = "status")
	private String status;

	@Column(name = "active")
	private boolean active;

	@Column(name = "categoryid")
	private long categoryId;

//	public CategoryEntity getCategoryEntity() {
//		return categoryEntity;
//	}
//
//	public void setCategoryEntity(CategoryEntity categoryEntity) {
//		this.categoryEntity = categoryEntity;
//	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(int priceSale) {
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

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getSecondaryImage() {
		return secondaryImage;
	}

	public void setSecondaryImage(String secondaryImage) {
		this.secondaryImage = secondaryImage;
	}

}
