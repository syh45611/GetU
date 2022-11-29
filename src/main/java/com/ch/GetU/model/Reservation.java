package com.ch.GetU.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation 
{
	private int resNo;
	private int payNo;
	private int memberNo;
	private int roomNo;
	private int houseNo;
	private Date chkIn;
	private Date chkOut;
	private int roomCount;
	
	private int roomType;
}
