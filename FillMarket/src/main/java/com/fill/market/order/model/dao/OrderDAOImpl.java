package com.fill.market.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fill.market.admin.model.vo.Product;
import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.vo.Order;
import com.fill.market.order.model.vo.OrderDetail;
import com.fill.market.order.model.vo.OrderList;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Cart> orderPage(String userId) {
		
		return sqlSession.selectList("orderSQL.orderPage", userId);
	}

	@Override
	public int sumPrice(String userId) {
		
		return sqlSession.selectOne("orderSQL.sumPrice", userId);
	}

	@Override
	public void insertOrder(Order order) {
		
		sqlSession.insert("orderSQL.insertOrder", order);
	}

	@Override
	public void deleteCart(String userId) {
		
		sqlSession.delete("orderSQL.deleteCart", userId);
		
	}

	@Override
	public List<OrderList> orderList(OrderList orderList) {
		
		return sqlSession.selectList("orderSQL.orderList", orderList);
	}

	@Override
	public List<OrderList> orderDetail(OrderList orderList) {
		
		return sqlSession.selectList("orderSQL.orderDetail", orderList);
	}

	@Override
	public void insertOrderDetail(OrderDetail orderDetail) {
		
		sqlSession.insert("orderSQL.insertOrderDetail", orderDetail);
		
	}

	@Override
	public List<OrderList> orderDetailProduct(OrderList orderList) {
		
		return sqlSession.selectList("orderSQL.orderDetailProduct", orderList);
	}

	@Override
	public void psellUpdate(Product product) {
		
		sqlSession.update("orderSQL.psellUpdate", product);
	}

	@Override
	public void pstockUpdate(Product product) {
		
		sqlSession.update("orderSQL.pstockUpdate", product);
		
	}


}
