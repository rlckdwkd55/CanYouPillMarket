package com.fill.market.order.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class OrderDetail implements Serializable {
	
	private static final long serialVersionUID = 2315L;
	
	private int orderdetailno;
	private String orderid;
	private int pno;
	private int amount;
	private int cnt;
	


}
