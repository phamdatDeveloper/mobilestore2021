package com.mobileshop.dto;

import java.util.List;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import com.mobileshop.validation.FieldMatch;

@Component
@FieldMatch(field = "password", fieldMatch = "passwordConfirm", message = "Mật khẩu không tương ứng. Thử lại.")
public class UserDTO extends BaseDTO {

	@NotBlank(message = "Bạn không được bỏ trông trường dữ liệu này")
	@Size(min = 5, message = "Tên tài khoản phải có ít nhất 5 ký tự")
	private String username;
	@NotBlank(message = "Bạn không được bỏ trông trường dữ liệu này")
	@Size(min = 5, message = "Tên tài khoản phải có ít nhất 5 ký tự")
	private String fullName;
	@NotBlank(message = "Bạn không được bỏ trông trường dữ liệu này")
	private String numberPhone;
	@NotBlank(message = "Bạn không được bỏ trông trường dữ liệu này")
	@Email(message = "Vui lòng điền Email hợp lệ (VD:xxx@gmail.com)")
	private String email;
	@NotBlank(message = "Bạn không được bỏ trông trường dữ liệu này")
	private String password;

	private String passwordConfirm;

	private boolean isDelete;

	private List<String> role;

	private boolean active;
	@NotBlank(message = "Bạn không được bỏ trông trường dữ liệu này")
	private String address;

	private String confirmToken;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getNumberPhone() {
		return numberPhone;
	}

	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active2) {
		this.active = active2;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getConfirmToken() {
		return confirmToken;
	}

	public void setConfirmToken(String confirmToken) {
		this.confirmToken = confirmToken;
	}

	public boolean isDelete() {
		return isDelete;
	}

	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	public List<String> getRole() {
		return role;
	}

	public void setRole(List<String> role) {
		this.role = role;
	}

}
