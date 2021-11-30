package com.fill.market.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
public class Product implements Serializable {
	
	private int pno;
	private int cno;
	private String pname;
	private int pprice;
	private String pinfo;
	private String fprec;
	private Date penroll;
	private int pstock;
	private int psell;
	
	private String changename;
	
}
