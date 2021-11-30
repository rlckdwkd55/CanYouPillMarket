package com.fill.market.cart.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fill.market.cart.model.vo.Cart;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 1. 장바구니 추가
	@Override
	public int insertCart(Cart cart) {
		
		return sqlSession.insert("cartSQL.insertCart", cart);
	}
	
	// 2. 장바구니 목록
	@Override
	public List<Cart> listCart(String userId) {
		
		return sqlSession.selectList("cartSQL.listCart", userId);
	}
	
	// 3. 장바구니 삭제
	@Override
	public void deleteCart(int cartno) {
		
		sqlSession.delete("cartSQL.deleteCart", cartno);
	}
	
	// 4. 장바구니 수정
	@Override
	public void modifyCart(Cart cart) {
		
		sqlSession.update("cartSQL.modifyCart", cart);
	}
	
	// 5. 장바구니 금액 합계
	@Override
	public int sumPrice(String userId) {
		
		return sqlSession.selectOne("cartSQL.sumPrice", userId);
	}
	
	// 6. 장바구니 내 동일한 상품 확인
	@Override
	public int countCart(int pno, String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("userId", userId);
		
		return sqlSession.selectOne("cartSQL.countCart", map);
	}

	// 7. 장바구니 상품 수량 변경
	@Override
	public int updateCart(Cart cart) {
		
		return sqlSession.update("cartSQL.updateCart", cart);
	}

	// 8. 장바구니 상품 전체 삭젝
	@Override
	public void deleteAll(String userId) {
		
		sqlSession.delete("cartSQL.deleteAll", userId);
		
	}

	@Override
	public int cartDetailInsert(Cart cart) {
		
		return sqlSession.insert("cartSQL.cartDetailInsert", cart);
	}


}
