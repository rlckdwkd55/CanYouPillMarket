package com.fill.market.survey.model.vo;

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
public class Survey implements Serializable {

	private static final long serialVersionUID = 79337L;
	
	private String q1;
	private String q2;
	private String q3;
	private String q4;
	private String q5;
	private String q6;
	private String surveyuserid;
}
