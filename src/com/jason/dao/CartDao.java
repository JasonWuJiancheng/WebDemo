package com.jason.dao;

import java.util.List;

import com.jason.entity.CartItem;
import com.jason.entity.User;

public interface CartDao {
	
	List<CartItem> findCartItemByUser(User user);
	
	CartItem findCartItem(int uid,int pid);
	
	int countCartItem(int uid,int pid);
	
	int insertCartItem(int uid,int pid,int amount);
	
	int deleteCartItem(int uid,int pid);
	
	int updateCartItem(int uid,int pid,int amount);
}
