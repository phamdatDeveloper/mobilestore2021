package com.mobileshop.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class RoleEntity extends BaseEntity {

	
	@Column(name = "name")
	private String name;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
	private List<UsersRolesEntity> usersRoleses = new ArrayList<UsersRolesEntity>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<UsersRolesEntity> getUsersRoleses() {
		return usersRoleses;
	}

	public void setUsersRoleses(List<UsersRolesEntity> usersRoleses) {
		this.usersRoleses = usersRoleses;
	}

	
}
