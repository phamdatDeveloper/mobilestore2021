package com.mobileshop.entity;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity {

	@Column(name = "username")
	private String username;

	@Column(name = "fullname")
	private String fullName;
	@Column(name = "numberphone")
	private String numberPhone;

	@Column(name = "email")
	private String email;

	@Column(name = "password")
	private String password;

	@Transient
	private String passwordConfirm;

	@Column(name = "active")
	private int active;
	@Column(name = "address")
	private String address;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "users")
	private List<UsersRolesEntity> usersRoleses = new ArrayList<UsersRolesEntity>();
	
	@Column(name = "confirmtoken")
	private String confirmToken;

	public String getUserName() {
		return username;
	}

	public void setUserName(String userName) {
		this.username = userName;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<UsersRolesEntity> getUsersRoleses() {
		return usersRoleses;
	}

	public void setUsersRoleses(List<UsersRolesEntity> usersRoleses) {
		this.usersRoleses = usersRoleses;
	}

	public String getConfirmToken() {
		return confirmToken;
	}

	public void setConfirmToken(String confirmToken) {
		this.confirmToken = confirmToken;
	}

	@Transient
	public List<GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (UsersRolesEntity usersRoles : this.usersRoleses) {
			authorities.add(new SimpleGrantedAuthority(usersRoles.getRole().getName()));
		}
		return authorities;
	}
}
