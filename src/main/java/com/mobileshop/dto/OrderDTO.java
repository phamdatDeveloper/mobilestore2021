package com.mobileshop.dto;

import java.util.HashMap;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;


public class OrderDTO {
	
	private String userName;
	@NotEmpty(message = "Bạn không được bỏ trống trường này")
	private String name;
	@NotEmpty(message = "Bạn không được bỏ trống trường này")
	private String shipAddress;
	@NotEmpty(message = "Bạn không được bỏ trống trường này")
	private String orderPhone;
	@NotEmpty(message = "Bạn chưa chọn phương thức thanh toán")
	private String statusPay;

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

	public String getStatusPay() {
		return statusPay;
	}

	public void setStatusPay(String statusPay) {
		this.statusPay = statusPay;
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
