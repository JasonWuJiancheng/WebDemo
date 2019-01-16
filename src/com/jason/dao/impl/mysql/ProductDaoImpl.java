package com.jason.dao.impl.mysql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.jason.dao.BaseDao;
import com.jason.dao.ProductDao;
import com.jason.dao.ResultSetProcessor;
import com.jason.entity.Product;

public class ProductDaoImpl extends BaseDao implements ProductDao {
	
	@Override
	public List<Product> findAllProduct() {
		String sql = "select * from product";
		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>)executeQuery(new ResultSetProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
				List<Product> productList = new ArrayList<Product>(); 
				while(rs.next()) {
					int id = rs.getInt("id");
					int type = rs.getInt("type");
					String name = rs.getString("name");
					String price = rs.getString("price");
					String title = rs.getString("title");
					String detail = rs.getString("detail");
					int resnum = rs.getInt("resnum");
					String headerimg = rs.getString("headerimg");
					String imgs = rs.getString("imgs");
					
					String img[] = imgs.split("&");
					ArrayList<String> imgList = new ArrayList<String>(Arrays.asList(img));
					
					productList.add(new Product(id, type, name, price, title, detail, resnum, headerimg, imgList));
				}
				return productList;
			}
		}, sql);
		return list;
	}

	@Override
	public List<Product> findProductByType(int type) {
		String sql = "select * from product where type = ?";
		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>)executeQuery(new ResultSetProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
				List<Product> productList = new ArrayList<Product>(); 
				while(rs.next()) {
					int id = rs.getInt("id");
					int type = rs.getInt("type");
					String name = rs.getString("name");
					String price = rs.getString("price");
					String title = rs.getString("title");
					String detail = rs.getString("detail");
					int resnum = rs.getInt("resnum");
					String headerimg = rs.getString("headerimg");
					String imgs = rs.getString("imgs");
					
					String img[] = imgs.split("&");
					ArrayList<String> imgList = new ArrayList<String>(Arrays.asList(img));
					
					productList.add(new Product(id, type, name, price, title, detail, resnum, headerimg, imgList));
				}
				return productList;
			}
		}, sql, type);
		return list;
	}

	@Override
	public Product findProductById(int id) {
		String sql = "select * from product where id = ?";
		Product user = (Product)executeQuery(new ResultSetProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
				if(rs.next()) {
					int id = rs.getInt("id");
					int type = rs.getInt("type");
					String name = rs.getString("name");
					String price = rs.getString("price");
					String title = rs.getString("title");
					String detail = rs.getString("detail");
					int resnum = rs.getInt("resnum");
					String headerimg = rs.getString("headerimg");
					String imgs = rs.getString("imgs");
					
					String img[] = imgs.split("&");
					ArrayList<String> imgList = new ArrayList<String>(Arrays.asList(img));
					
					return new Product(id, type, name, price, title, detail, resnum, headerimg, imgList);
				} else {
					return null;
				}
			}
		}, sql, id);
		return user;
	}

	@Override
	public List<Product> findProductByKeyInTitle(String key) {
		String sql = "SELECT * FROM `product` WHERE INSTR(`title`, ? )>0 ";
		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>)executeQuery(new ResultSetProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
				List<Product> productList = new ArrayList<Product>(); 
				while(rs.next()) {
					int id = rs.getInt("id");
					int type = rs.getInt("type");
					String name = rs.getString("name");
					String price = rs.getString("price");
					String title = rs.getString("title");
					String detail = rs.getString("detail");
					int resnum = rs.getInt("resnum");
					String headerimg = rs.getString("headerimg");
					String imgs = rs.getString("imgs");
					
					String img[] = imgs.split("&");
					ArrayList<String> imgList = new ArrayList<String>(Arrays.asList(img));
					
					productList.add(new Product(id, type, name, price, title, detail, resnum, headerimg, imgList));
				}
				return productList;
			}
		}, sql, key);
		return list;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getPageProductList(int pageNo, int pageSize) {
		String sql="select * from product limit ?,?";
		Object[] params = {(pageNo - 1) * pageSize, pageSize};
		
		ResultSetProcessor processor = new ResultSetProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				
				List<Product> productList = new ArrayList<Product>();
				
				while(rs != null && rs.next()) {
					int id = rs.getInt("id");
					int type = rs.getInt("type");
					String name = rs.getString("name");
					String price = rs.getString("price");
					String title = rs.getString("title");
					String detail = rs.getString("detail");
					int resnum = rs.getInt("resnum");
					String headerimg = rs.getString("headerimg");
					String imgs = rs.getString("imgs");
					
					String img[] = imgs.split("&");
					ArrayList<String> imgList = new ArrayList<String>(Arrays.asList(img));
					
					productList.add(new Product(id, type, name, price, title, detail, resnum, headerimg, imgList));
				}
				
				return productList;
			}
		};
		
		Object result = executeQuery(processor, sql, params);
		
		return (List<Product>)result;
	}

	@Override
	public int getTotalCount() {
		String sql="select count(1) as r_count from product";
		
		ResultSetProcessor processor = new ResultSetProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				int count = 0;
				if(rs.next()) {
					count = rs.getInt("r_count");
				}
				return count;
			}
		};
		
		Object result = executeQuery(processor, sql);
		
		return (Integer)result;
	}

}
