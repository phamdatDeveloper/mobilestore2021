package com.mobileshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mobileshop.entity.UsersRolesEntity;

@Repository
public interface UsersRolesRepository extends JpaRepository<UsersRolesEntity, Long> {
	
}
