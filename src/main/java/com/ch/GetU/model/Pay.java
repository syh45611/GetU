package com.ch.GetU.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Pay 
{
	private int payNo;
	private int memberNo;
	private Date payDate;
	private String payType;
	private String payDel;
	
	private String merchant_uid;
	private String imp_uid;
	private String method;
	private int paySum;
	
	private int payState;
	private int houseNo;
}
