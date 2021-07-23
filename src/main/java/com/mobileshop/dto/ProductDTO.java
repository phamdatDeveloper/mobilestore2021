package com.mobileshop.dto;

import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

public class ProductDTO extends BaseDTO {

	@NotEmpty(message="Không được để trống trường này")
	private String productName;
	@NotEmpty(message="Không được để trống trường này")
	private int price;

	private int priceSale;
	@NotEmpty(message="Không được để trống trường này")
	private String description;

	private String specification;

	private String mainImage;

	private List<String> secondaryImage;

	private int quantity;

	private String status;

	private boolean isSale;

	private boolean isNew;

	private boolean active;

	private int categoryId;

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

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public List<String> getSecondaryImage() {
		return secondaryImage;
	}

	public void setSecondaryImage(List<String> secondaryImage) {
		this.secondaryImage = secondaryImage;
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

	public boolean getIsSale() {
		return isSale;
	}

	public void setIsSale(boolean isSale) {
		this.isSale = isSale;
	}

	public boolean getIsNew() {
		return isNew;
	}

	public void setIsNew(boolean isNew) {
		this.isNew = isNew;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	


	
}
