package com.ch.GetU.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Review 
{
	private int reviewNo;
	private int payNo;
	private int houseNo;
	private String reviewSubject;
	private String reviewContent;
	private int reviewScore;
	private Date reviewDate;
	private String reviewDel;
	
	private double reviewAv;
	
	 //paging용
    private int startRow;
    private int endRow;
}
