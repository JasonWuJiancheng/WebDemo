package com.jason.dao.impl.mysql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jason.dao.BaseDao;
import com.jason.dao.CartDao;
import com.jason.dao.ProductDao;
import com.jason.dao.ResultSetProcessor;
import com.jason.entity.CartItem;
import com.jason.entity.Product;
import com.jason.entity.User;

public class CartDaoImpl extends BaseDao implements CartDao {

	@Override
	public List<CartItem> findCartItemByUser(User user) {
		String sql = "select * from cart where uid = ?";
		ProductDao productDao = new ProductDaoImpl();
		@SuppressWarnings("unchecked")
		List<CartItem> list = (List<CartItem>)executeQuery(new ResultSetProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
				List<CartItem> cartItemList = new ArrayList<CartItem>(); 
				while(rs.next()) {
					int pid = rs.getInt("pid");
					int amount = rs.getInt("amount");
					
					Product product = productDao.findProductById(pid);
					cartItemList.add(new CartItem(product,amount));
				}
				return cartItemList;
			}
		}, sql,user.getId());
		return list;
	}

	@Override
	public int insertCartItem(int uid,int pid,int amount) {
		String sql = "insert into cart (uid, pid, amount) values (?, ?, ?)";
		return executeUpdate(sql,uid,pid,amount);
	}

	@Override
	public int deleteCartItem(int uid, int pid) {
		String sql = "delete from cart where uid = ? and pid = ?";
		return executeUpdate(sql,uid,pid);
	}

	@Override
	public int updateCartItem(int uid, int pid, int amount) {
		String sql = "update cart set amount = ? where uid = ? and pid = ?";
		return executeUpdate(sql,amount,uid,pid);
	}

	@Override
	public int countCartItem(int uid, int pid) {
		String sql="select count(1) as r_count from cart where uid = ? and pid = ?";
		
		ResultSetProcessor processor = new ResultSetProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				int count = 0;
				if(rs.next()) {
					count = rs.getInt("r_count");
				}
				return count;
			}
		};
		
		Object result = executeQuery(processor, sql, uid, pid);
		
		return (Integer)result;
	}

	@Override
	public CartItem findCartItem(int uid, int pid) {
		String sql = "select * from cart where uid = ? and pid = ?";
		ProductDao productDao = new ProductDaoImpl();
		CartItem cartItem = (CartItem)executeQuery(new ResultSetProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
				if(rs.next()) {
					int pid = rs.getInt("pid");
					int amount = rs.getInt("amount");
					Product product = productDao.findProductById(pid);
					return new CartItem(product,amount);
				} else {
					return null;
				}
			}
		}, sql, uid, pid);
		return cartItem;
	}


}
