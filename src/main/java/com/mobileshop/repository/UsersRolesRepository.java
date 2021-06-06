package com.mobileshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mobileshop.entity.UserEntity;
import com.mobileshop.entity.UsersRolesEntity;

@Repository
public interface UsersRolesRepository extends JpaRepository<UsersRolesEntity, Long> {
//	List<UsersRolesEntity> findByUsers(UserEntity users);

	List<UsersRolesEntity> findByUsers(UserEntity users);;
}
