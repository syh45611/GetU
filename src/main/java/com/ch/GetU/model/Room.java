package com.ch.GetU.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class Room 
{
	private int roomNo;
	private int houseNo;
	private String roomName;
	private int roomType;
	private int roomPrice;
	private int roomCapa;
	private int roomRemain;
	private Date roomDate;
	private String roomDel;
	/* 검색용 */
	private Date chkIn;
	private Date chkOut;
	/* 전체조인용 */
	private House house;	
	/* 수량파악용 */
	private int roomCount;
	private int Days;
	
	private Reservation reservation;

}
