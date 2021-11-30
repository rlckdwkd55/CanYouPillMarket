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
public class OrderList implements Serializable {
	
	private static final long serialVersionUID = 22222L;
	
	private int orderno;
	private String orderuserid;
	private int totalprice;
	private Date orderenroll;
	private String customername;
	private String receivername;
	private String address1;
	private String address2;
	private String phone;
	private String orderid;	
	private int fee;
	private int statusno;
	
	private int orderdetailno;
	private int pno;
	private int amount;
	private int cnt;
	
	private String pname;
	private int pprice;
	private String changename;
	
	private String status;	// 배송 상태

}
