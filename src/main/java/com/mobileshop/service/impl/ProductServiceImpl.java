package com.mobileshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	public List<ProductDTO> findAll() {
		List<ProductDTO> listProductDTO = new ArrayList<ProductDTO>();
		List<ProductEntity> listProductEntity = productRepository.findAll();
		for (ProductEntity productEntity : listProductEntity) {
			listProductDTO.add(converter.convertToDTO(productEntity));
		}
		return listProductDTO;
	}

//	@Override
//	public List<ProductDTO> findByActive(boolean active) {
//		List<ProductDTO> listProductDTO = new ArrayList<ProductDTO>();
//		List<ProductEntity> listProductEntity = productRepository.findByActive(true);
//		for (ProductEntity product : listProductEntity) {
//			ProductDTO productDTO = converter.convertToDTO(product);
//			listProductDTO.add(productDTO);
//		}
//		return listProductDTO;
//	}

	@Override
	public ProductDTO findById(Long id) {
		ProductDTO product = converter.convertToDTO(productRepository.findById(id));
		return product;
	}

	@Override
	public ProductDTO save(ProductDTO product) {
		ProductEntity productEntity = converter.convertToEntity(product);
		ProductDTO productDTO = converter.convertToDTO(productRepository.save(productEntity));
		return productDTO;
	}

//	@Override
//	public void update(ProductDTO product) {
//		ProductEntity productEntity = converter.convertToEntity(product);
//		converter.convertToDTO(productRepository.save(productEntity));
//
//	}

	@Override
	public Long count() {
		return productRepository.count();

	}

//	@Override
//	public List<ProductDTO> findByCategoryAndActive(String categoryName, boolean active) {
//		List<ProductEntity> productEntitys = productRepository.findByCategoryAndActive(categoryName, active);
//		List<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
//		for (ProductEntity productEntity : productEntitys) {
//			ProductDTO productDTO = converter.convertToDTO(productEntity);
//			productDTOs.add(productDTO);
//		}
//
//		return productDTOs;
//	}

	@Override
	public Page<ProductDTO> getByActive(boolean active, Pageable pageable) {
		Page<ProductEntity> productEntitys = productRepository.getByActive(active, pageable);
//		Page<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
		Page<ProductDTO> productDTOs = productEntitys.map(new Converter<ProductEntity, ProductDTO>() {

			@Override
			public ProductDTO convert(ProductEntity productEntity) {
				ProductDTO productDTO = converter.convertToDTO(productEntity);
				return productDTO;
			}
		});
//		for (ProductEntity productEntity : productEntitys) {
//			ProductDTO productDTO = converter.convertToDTO(productEntity);
//			productDTOs.add(productDTO);
//		}
		return productDTOs;
	}

	@Override
	public Page<ProductDTO> findByCategoryIdAndActive(Long categoryId, boolean active, Pageable pageable) {
		Page<ProductEntity> productEntitys = productRepository.findByCategoryIdAndActive(categoryId, active, pageable);
		Page<ProductDTO> productDTOs = productEntitys.map(new Converter<ProductEntity, ProductDTO>() {

			@Override
			public ProductDTO convert(ProductEntity productEntity) {
				ProductDTO productDTO = converter.convertToDTO(productEntity);
				return productDTO;
			}
		});
//		for (ProductEntity productEntity : productEntitys) {
//			ProductDTO productDTO = converter.convertToDTO(productEntity);
//			productDTOs.add(productDTO);
//		}
		return productDTOs;
	}

	@Override
	public Page<ProductDTO> findByProductNameStartingWith(String productName, Pageable pageable) {
		Page<ProductEntity> productEntitys = productRepository.findByProductNameStartingWith(productName, pageable);
		Page<ProductDTO> productDTOs = productEntitys.map(new Converter<ProductEntity, ProductDTO>() {

			@Override
			public ProductDTO convert(ProductEntity productEntity) {
				ProductDTO productDTO = converter.convertToDTO(productEntity);
				return productDTO;
			}
		});
//		for (ProductEntity productEntity : productEntitys) {
//			ProductDTO productDTO = converter.convertToDTO(productEntity);
//			productDTOs.add(productDTO);
//		}
		return productDTOs;
	}

}
