package com.mobileshop.entity;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "order", catalog = "mobileshop")
public class OrderEntity extends BaseEntity {

	@Column(name = "userid")
	private long userId;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "order", cascade = CascadeType.ALL)
	private List<OrderDetailEntity> orderDetail = new ArrayList<OrderDetailEntity>();

	@Column(name = "shipaddress")
	private String shipAddress;

	@Column(name = "name")
	private String name;

	@Column(name = "orderemail")
	private String orderEmail;

	@Column(name = "orderphone")
	private String orderPhone;

	@Column(name = "statusorder")
	private String statusOrder;
	
	@Column(name = "methodpay")
	private String methodPay;

	@Column(name = "totalprice")
	private double totalPrice;

	public String getShipAddress() {
		return shipAddress;
	}

	public List<OrderDetailEntity> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(List<OrderDetailEntity> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public String getOrderEmail() {
		return orderEmail;
	}

	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	

	public String getStatusOrder() {
		return statusOrder;
	}

	public void setStatusOrder(String statusOrder) {
		this.statusOrder = statusOrder;
	}

	public String getMethodPay() {
		return methodPay;
	}

	public void setMethodPay(String methodPay) {
		this.methodPay = methodPay;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
