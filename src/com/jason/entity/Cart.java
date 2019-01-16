package com.jason.entity;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	List<CartItem> items = new ArrayList<>();
	
	public void addProduct(Product product, int amount) {
		CartItem item = items.stream().filter(i->i.getProduct().getId()==product.getId())
				.findFirst().orElseGet(()->{
					CartItem newItem = new CartItem(product, 0);
					items.add(newItem);
					return newItem;
				});
		item.setAmount(item.getAmount() + amount);
	}

	public List<CartItem> getItems() {
		return items;
	}
}
