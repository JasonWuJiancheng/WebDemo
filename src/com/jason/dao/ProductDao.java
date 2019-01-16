package com.jason.dao;

import java.util.List;

import com.jason.entity.Product;

public interface ProductDao {
	public List<Product> findAllProduct();
	public List<Product> findProductByType(int type);
	public List<Product> findProductByKeyInTitle(String key);
	public Product findProductById(int id);
	public List<Product> getPageProductList(int pageNo, int pageSize);
	public int getTotalCount();
}
