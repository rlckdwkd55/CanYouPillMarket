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
public class RAttachment implements Serializable{
		
	private static final long serialVersionUID = 6943L;
	
	private int rano;
	private int reno;
	private String originalname;
	private String changename;
	private Date uploaddate;
	private String status;
}