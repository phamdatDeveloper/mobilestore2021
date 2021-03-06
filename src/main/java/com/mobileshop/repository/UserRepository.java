package com.mobileshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mobileshop.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {
	List<UserEntity> findByIsDelete(boolean isDelete);

	UserEntity findById(long id);
	
	UserEntity findByEmail(String email);

	UserEntity findOneByUsername(String username);

	UserEntity findOneByUsernameOrActive(String username, int active);

	UserEntity findOneByUsernameAndEmail(String username, String email);

	UserEntity findByUsernameAndActive(String username, int active);

	UserEntity findByConfirmToken(String confirmToken);

	UserEntity findOneByUsernameOrEmail(String username, String email);
}
