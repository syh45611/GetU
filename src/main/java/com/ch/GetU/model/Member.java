package com.ch.GetU.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Member {
	private int memberNo;
	private String memberName;
	private String memberId;
	private String memberPass;
	private String memberEmail;
	private String memberGender;
	private String memberDel;
	private Date reg_date;
	
	private String account_email;
}