package com.mobileshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order_detail")
public class OrderDetailEntity extends BaseEntity {

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "orderid")
	private OrderEntity order;

	@Column(name = "productid")
	private long productId;

	@Column(name = "productname")
	private String productName;

	@Column(name = "pricesale")
	private double priceSale;

	@Column(name = "price")
	private double price;

	@Column(name = "quantity")
	private int quatity;

	@Column(name = "totalprice")
	private double totalPrice;

	public OrderEntity getOrder() {
		return order;
	}

	public void setOrder(OrderEntity order) {
		this.order = order;
	}

	public double getPrice() {
		return price;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public void setPrice(double d) {
		this.price = d;
	}

	public int getQuatity() {
		return quatity;
	}

	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(double priceSale) {
		this.priceSale = priceSale;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
