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
public class Member implements Serializable{

	private String userId;
	private int levelType;
	private String password;
	private String userName;
	private Date birth;
	private String birthYear;
	private String birthMonth;
	private String birthDay;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private Date enrollDate;
	private String status;
	
	private String memo;
	
}
