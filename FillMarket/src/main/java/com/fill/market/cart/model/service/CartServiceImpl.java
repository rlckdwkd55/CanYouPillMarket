package com.fill.market.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.cart.model.dao.CartDAO;
import com.fill.market.cart.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDAO;
	
	// 1. 장바구니 추가
	@Override
	public int insertCart(Cart cart) {
		
		return cartDAO.insertCart(cart);
	}
	
	// 2. 장바구니 목록
	@Override
	public List<Cart> listCart(String userId) {
		
		return cartDAO.listCart(userId);
	}
	
	// 3. 장바구니 삭제
	@Override
	public void deleteCart(int cartno) {
		
		cartDAO.deleteCart(cartno);
		
	}
	
	// 4. 장바구니 수정
	@Override
	public void modifyCart(Cart cart) {
		
		cartDAO.modifyCart(cart);
		
	}
	
	// 5. 장바구니 금액 합계
	@Override
	public int sumPrice(String userId) {
		
		return cartDAO.sumPrice(userId);
	}
	
	// 6. 장바구니 상품 확인
	@Override
	public int countCart(int pno, String userId) {
		
		return cartDAO.countCart(pno, userId);
	}

	// 7. 장바구니 상품 수량 변경
	@Override
	public int updateCart(Cart cart) {

		return cartDAO.updateCart(cart);
	}

	// 8. 장바구니 상품 전체 삭제
	@Override
	public void deleteAll(String userId) {
		
		cartDAO.deleteAll(userId);
		
	}

	@Override
	public int cartDetailInsert(Cart cart) {
		
		return cartDAO.cartDetailInsert(cart);
	}

}
