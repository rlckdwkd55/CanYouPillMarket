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
public class PAttachment implements Serializable {
	
	private int pano;
	private int pno;
	private String originalname;
	private String changename;
	private Date uploaddate;
	private String status;
	
}
