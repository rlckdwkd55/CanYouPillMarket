package com.fill.market.board.model.vo;

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
public class Board implements Serializable {

	private static final long serialVersionUID = 79337L;
	
	private int qano;
	private String qauserid;
	private String qatitle;
	private String qacontent;
	private Date qauploaddate;
	private String status;
	private int replycount;
	private String qasel;
	
}
