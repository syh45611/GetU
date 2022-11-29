package com.ch.GetU.model;

import lombok.Data;

@Data
public class House 
{
	private int houseNo;
	private String houseName;
	private String houseLoc;
	private String houseTel;
	private String houseAddr;
	private String houseDel;
//  점수계산용
	private double avgScore;
//  조인용
	private Parking parking;
	private Info info;
	private Subway subway;

}
