package com.fill.market.order.model.dao;

import java.util.List;

import com.fill.market.admin.model.vo.Product;
import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.vo.Order;
import com.fill.market.order.model.vo.OrderDetail;
import com.fill.market.order.model.vo.OrderList;

public interface OrderDAO {
	
	List<Cart> orderPage(String userId);
	
	int sumPrice(String userId);
	
	void insertOrder(Order order);
	
	void deleteCart(String userId);
	
	List<OrderList> orderList(OrderList orderList);
	
	List<OrderList> orderDetail(OrderList orderList);
	
	void insertOrderDetail(OrderDetail orderDetail);
	
	List<OrderList> orderDetailProduct(OrderList orderList);
	
	void psellUpdate(Product product);

	void pstockUpdate(Product product);

}
