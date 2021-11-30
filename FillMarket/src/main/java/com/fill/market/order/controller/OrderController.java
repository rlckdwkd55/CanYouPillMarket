package com.fill.market.order.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fill.market.admin.model.vo.Member;
import com.fill.market.admin.model.vo.Product;
import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.service.OrderService;
import com.fill.market.order.model.vo.Order;
import com.fill.market.order.model.vo.OrderDetail;
import com.fill.market.order.model.vo.OrderList;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	/*
	@RequestMapping("/order/orderPage.do")
	public String orderPage(HttpSession session) {
		
		return "order/orderPage";
		
	}*/

	@RequestMapping("/order/orderPage.do")
	public ModelAndView orderPage(HttpSession session, ModelAndView mav, Cart cart) {
		
		String userId = ((Member)session.getAttribute("member")).getUserId();
		String userName = ((Member)session.getAttribute("member")).getUserName();
		String userPhone = ((Member)session.getAttribute("member")).getPhone();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// System.out.println("orderPage 세션 확인 : " + userId + "/" + userName + "/" + userPhone);
		
		List<Cart> list = orderService.orderPage(userId);
		int sumPrice = orderService.sumPrice(userId);
		int fee = sumPrice >= 30000 ? 0 : 2500;
		
		map.put("list", list);
		map.put("userId", userId);
		map.put("userName", userName);
		map.put("userPhone", userPhone);
		map.put("sumPrice", sumPrice);
		map.put("fee", fee);
		map.put("allSum", sumPrice+fee);
		mav.setViewName("order/orderPage");
		mav.addObject("map", map);
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("order/orderInsert.do")
	public String OrderInsert(HttpSession session, Order order, OrderDetail orderDetail, Product product, Model model) {
		
		System.out.println("orderInsert 접근!");
		
		String userId = ((Member)session.getAttribute("member")).getUserId();	// 세션 아이디값
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for (int i = 0; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String orderId = ymd + "_" + subNum;
		
//		System.out.println("주문번호 생성 : " + orderId);
		
			
			order.setOrderid(orderId);
			order.setOrderuserid(userId);
			
			orderService.insertOrder(order);	// 카트내역 주문
			
			orderDetail.setOrderid(orderId);
			orderService.insertOrderDetail(orderDetail);	// 주문 후 카트정보 orderDetail 테이블에 담음
			
			orderService.deleteCart(userId);	// 주문완료 한 카트내역 삭제
			orderService.psellUpdate(product);
			orderService.pstockUpdate(product);
			
//			System.out.println("주문하기 : " + order);
			
			
		
		return "order/orderFinish";
	}
	
	@RequestMapping("order/orderFinish.do")
	public String orderFinish(HttpSession session) {
		
		return "order/orderFinish";
	}
	
	@RequestMapping("order/orderList.do")
	public String orderList(HttpSession session, OrderList orderList, Model model) {
		
		String userId = ((Member)session.getAttribute("member")).getUserId();
		
		orderList.setOrderuserid(userId);
		
		List<OrderList> list = orderService.orderList(orderList);
		
		model.addAttribute("list", list);
		
		return "order/orderList";
	}
	
	
	@RequestMapping("order/orderDetail.do")
	public String orderDetail(HttpSession session, @RequestParam("n") String orderId, OrderList orderList, Model model) {
		
		String userId = ((Member)session.getAttribute("member")).getUserId();
		
		orderList.setOrderuserid(userId);
		orderList.setOrderid(orderId);
		
		List<OrderList> list = orderService.orderDetail(orderList);
		List<OrderList> detailList = orderService.orderDetailProduct(orderList);
		
		model.addAttribute("list", list);
		model.addAttribute("detailList", detailList);
		
		return "order/orderDetail";
	}
	
	@RequestMapping("order/orderDetailAdmin.do")
	public String  adminOrderDetail(@RequestParam("n") String orderId, @RequestParam(value="u") String userId, Model model, OrderList orderList) {
		System.out.println(orderId);
		System.out.println(userId);
		
		orderList.setOrderuserid(userId);
		orderList.setOrderid(orderId);
	
		List<OrderList> list = orderService.orderDetail(orderList);
		List<OrderList> detailList = orderService.orderDetailProduct(orderList);
		
		model.addAttribute("list", list);
		model.addAttribute("detailList", detailList);
		
		return "order/orderDetail";
		
	}

}
