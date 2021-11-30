package com.fill.market.cart.model.service;

import java.util.List;

import com.fill.market.cart.model.vo.Cart;

public interface CartService {
	
	int countCart(int pno, String userId);

	int updateCart(Cart cart);

	int insertCart(Cart cart);

	List<Cart> listCart(String userId);

	int sumPrice(String userId);

	void deleteCart(int cartno);

	void modifyCart(Cart cart);

	void deleteAll(String userId);

	int cartDetailInsert(Cart cart);

	
}
