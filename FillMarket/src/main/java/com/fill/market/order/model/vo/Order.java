package com.fill.market.order.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class Order implements Serializable {
	
	private static final long serialVersionUID = 22L;
	
	private int orderno;
	private String orderuserid;
	private int totalprice;
	private Date orderenroll;
	private String customername;
	private String receivername;
	private String address1;
	private String address2;
	private String phone;
	private String orderid;		// 날짜와 랜덤숫자 조합한 문자열 ####_####
	private int fee;
	private int statusno;		// 배송상태
	
}
