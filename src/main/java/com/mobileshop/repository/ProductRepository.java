package com.mobileshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mobileshop.entity.ProductEntity;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Long> {
	@Query(value = "select * from product p inner join category c on  p.categoryid = c.id where p.active = 1 and c.active =1", nativeQuery = true)
	List<ProductEntity> findAllProductActive();

	List<ProductEntity> findByActive(long id);

	ProductEntity findById(Long id);

	List<ProductEntity> findByCategoryId(long id);

	@Query(value = "select * from product p inner join category c on  p.categoryid = c.id where  c.categoryname like ?1 and p.active = ?2", nativeQuery = true)
	List<ProductEntity> findByCategoryAndActive(String categoryName, boolean active);

}
