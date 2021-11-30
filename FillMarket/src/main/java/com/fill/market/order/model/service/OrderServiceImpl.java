package com.fill.market.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.admin.model.vo.Product;
import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.dao.OrderDAO;
import com.fill.market.order.model.vo.Order;
import com.fill.market.order.model.vo.OrderDetail;
import com.fill.market.order.model.vo.OrderList;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;

	@Override
	public List<Cart> orderPage(String userId) {
		
		return orderDAO.orderPage(userId);
	}

	@Override
	public int sumPrice(String userId) {
		
		return orderDAO.sumPrice(userId);
	}

	@Override
	public void insertOrder(Order order) {
		
		orderDAO.insertOrder(order);
	}

	@Override
	public void deleteCart(String userId) {

		orderDAO.deleteCart(userId);
		
	}

	@Override
	public List<OrderList> orderList(OrderList orderList) {
		
		return orderDAO.orderList(orderList);
	}
	

	@Override
	public List<OrderList> orderDetail(OrderList orderList) {
		
		return orderDAO.orderDetail(orderList);
	}

	@Override
	public void insertOrderDetail(OrderDetail orderDetail) {
		
		orderDAO.insertOrderDetail(orderDetail);
		
	}

	@Override
	public List<OrderList> orderDetailProduct(OrderList orderList) {
		
		return orderDAO.orderDetailProduct(orderList);
	}

	@Override
	public void psellUpdate(Product product) {
		
		orderDAO.psellUpdate(product);
		
	}

	@Override
	public void pstockUpdate(Product product) {
		
		orderDAO.pstockUpdate(product);
		
	}


}
