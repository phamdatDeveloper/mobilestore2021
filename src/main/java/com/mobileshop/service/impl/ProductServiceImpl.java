package com.mobileshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.mobileshop.converter.ProductConverter;
import com.mobileshop.dto.ProductDTO;
import com.mobileshop.entity.ProductEntity;
import com.mobileshop.repository.ProductRepository;
import com.mobileshop.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductConverter converter;

	@Autowired
	private ProductRepository productRepository;

	@Override
	public List<ProductDTO> findAllProductActive() {
		List<ProductDTO> listProductDTO = new ArrayList<ProductDTO>();
		List<ProductEntity> listProductEntity = productRepository.findAllProductActive();
		for (ProductEntity product : listProductEntity) {
			ProductDTO productDTO = converter.convertToDTO(product);
			listProductDTO.add(productDTO);
		}
		return listProductDTO;
	}

	@Override
	public ProductDTO getProductByID(Long id) {
		ProductDTO product = converter.convertToDTO(productRepository.findOne(id));
		
		return product;
	}
}
