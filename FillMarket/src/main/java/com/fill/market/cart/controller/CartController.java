package com.fill.market.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fill.market.admin.model.vo.Member;
import com.fill.market.cart.model.service.CartService;
import com.fill.market.cart.model.vo.Cart;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	@RequestMapping(value="/cart/cartInsert.do", method = RequestMethod.GET)
	public String cartInsert(@ModelAttribute Cart cart, HttpSession session, Model model) {
		String userId = ((Member)session.getAttribute("member")).getUserId();
		cart.setCartuserid(userId);
		
		System.out.println("아이디 확인 : " + userId);
		
		String loc = "/product/productList.do";
		String msg = "";
		
		// 장바구니에 기존 상품이 있는지 확인
		int count = cartService.countCart(cart.getPno(), userId);
		
		System.out.println("상품 개수 : " + count);
		count = count == 0 ? cartService.updateCart(cart) : cartService.insertCart(cart);
		
		if(count == 0) {
			// 없으면 insert
			cart.setAmount(1);
			cart.setOrderprice(cart.getAmount() * cart.getPprice());
			cartService.insertCart(cart);
			
			System.out.println("장바구니 추가 : " + cart);
			
			msg = "상품이 장바구니에 담겼습니다.";
	
		} else { 
			cart.setAmount(1);
			cart.setOrderprice(cart.getAmount() * cart.getPprice());
			cartService.updateCart(cart);
			
			msg = "이미 있는 상품의 수량을 추가하였습니다.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/cart/cartDetailInsert.do")
	public String cartDetailInsert(@ModelAttribute Cart cart, HttpSession session, Model model) {
		String userId = ((Member)session.getAttribute("member")).getUserId();
		
		cart.setCartuserid(userId);
		
		String loc = "/cart/cartList.do";
		String msg = "";
		
		int count = cartService.countCart(cart.getPno(), userId);
		count = count ==0 ? cartService.updateCart(cart) : cartService.cartDetailInsert(cart);
		if(count == 0) {
			cart.setOrderprice(cart.getAmount() * cart.getPprice());
			cartService.cartDetailInsert(cart);
			
			msg = "상품이 장바구니에 담겼습니다.";
			
		} else {
			cart.setOrderprice(cart.getAmount() * cart.getPprice());
			cartService.updateCart(cart);
			
			msg = "이미 있는 상품의 수량을 추가하였습니다.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}

	
	@RequestMapping("/cart/cartList.do")
	public ModelAndView cartList(HttpSession session, ModelAndView mav, Cart cart) {
		String userId = ((Member)session.getAttribute("member")).getUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("세션 확인 : " + userId);
			
			List<Cart> list = cartService.listCart(userId);	//장바구니 정보
			
			if(list.size() > 0) {
			
			
			int sumPrice = cartService.sumPrice(userId);
			
			
			
			int fee = sumPrice >= 30000 ? 0 : 2500;
			
//			System.out.println("장바구니 정보 : " + list);
			System.out.println("총 가격 : " + sumPrice);
			System.out.println("배송비 : " + fee);
			// 장바구니 전체 금액에 따라 배송비 구분
			// 3만원 이상 무료배송 , 미만 배송비 2500원
			
			map.put("list", list);				// 장바구니 정보를 map에 저장
			map.put("count", list.size());		// 장바구니 안 상품의 유무
			map.put("sumPrice", sumPrice);		// 장바구니 전체 금액
			map.put("fee", fee);				// 배송비
			map.put("allSum", sumPrice+fee);	// 전체 주문 금액
			mav.setViewName("cart/cartList"); 	// view(jsp)의 이름 저장
			mav.addObject("map", map);			// map의 변수 저장
			
			return mav;
			
			}else {
			
				mav.setViewName("cart/cartList");
				
				return mav;
			}
			
	}
	
	@RequestMapping("/cart/cartDelete.do")
	public String cartDelete(@RequestParam int cartno) {
		cartService.deleteCart(cartno);
		
		return "redirect:/cart/cartList.do";
	}
	
	@RequestMapping("/cart/cartDeleteAll.do")
	public String cartDeleteAll(HttpSession session) {
		String userId = ((Member)session.getAttribute("member")).getUserId();
		
		cartService.deleteAll(userId);
		
		return "redirect:/cart/cartList.do";
	}
	
	// 안 됨
	@RequestMapping("/cart/cartUpdate.do")
	public String cartUpdate(@RequestParam int[] amount, @RequestParam int[] pno, @RequestParam int[] orderprice, HttpSession session) {
		String userId = ((Member)session.getAttribute("member")).getUserId();
		// 레코드의 갯수만큼 반복문 실행
		for(int i = 0; i < pno.length; i++) {
			Cart cart = new Cart();
			cart.setCartuserid(userId);
			cart.setAmount(amount[i]);
			cart.setPno(pno[i]);
			cart.setOrderprice(orderprice[i]);
			cartService.modifyCart(cart);
		}
		
		return "cart/cartList"; 
	}

	

}





