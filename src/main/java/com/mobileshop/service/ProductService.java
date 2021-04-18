package com.mobileshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.entity.ProductEntity;
import com.mobileshop.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;
	
	public List<ProductEntity> getProduct() {
		List<ProductEntity> list= productRepository.findAll();
		return list;
	}
}
