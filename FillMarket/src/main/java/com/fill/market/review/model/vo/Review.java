package com.fill.market.review.model.vo;

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
public class Review implements Serializable {
	
	private static final long serialVersionUID = 79337L;
	
	private int reno;
	private int pno;
	private String reuserid;
	private String retitle;
	private String recontent;
	private Date reuploaddate;
	private String status;
	private RAttachment rattachment;
	private String pname;
	
}
