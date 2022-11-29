package com.ch.GetU.dao;

import java.util.List;

import com.ch.GetU.model.House;

public interface MainPageDao 
{
	List<House> houseList(House house);

	List<House> getAllHouseList();

	List<House> getHousePageList(int startRow, int endRow);

	List<House> resultHouseList(String searchKey, String searchValue);

	List<House> resultHousePageList(String searchKey, String searchValue, String startRow2, String endRow2);

}
