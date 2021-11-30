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
public class QNA implements Serializable {
	
	private int qano;
	private String qauserid;
	private String qatitle;
	private String qacontent;
	private Date qauploaddate;
	private String status;
	private String cstatus;
	
	private String rcontent;
	
}
