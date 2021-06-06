package com.mobileshop.dto;

import java.util.HashMap;

import javax.persistence.Column;

import org.hibernate.validator.constraints.NotEmpty;

public class OrderDTO extends BaseDTO{

	private String userName;
	@NotEmpty(message = "Bạn không được bỏ trống trường này")
	private String name;
	@NotEmpty(message = "Bạn không được bỏ trống trường này")
	private String shipAddress;
	@NotEmpty(message = "Bạn không được bỏ trống trường này")
	private String orderPhone;
	
	private String statusOrder;
	@NotEmpty(message = "Bạn chưa chọn phương thức thanh toán")
	@Column(name = "methodpay")
	private String methodPay;

	@Column(name = "totalprice")
	private double totalPrice;

	private HashMap<Long, CartDTO> carts;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
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

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public HashMap<Long, CartDTO> getCarts() {
		return carts;
	}

//	public String getA() {
//		return a;
//	}
//
//	public void setA(String a) {
//		this.a = a;
//	}

	public void setCarts(HashMap<Long, CartDTO> carts) {
		this.carts = carts;
	}

}
