package com.ch.GetU.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.GetU.model.House;

@Repository
public class MainPageDaoImpl implements MainPageDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<House> houseList(House house) 	{
		return sst.selectList("housens.houseList", house);
	}

	@Override
	public List<House> getAllHouseList() {
		return sst.selectList("housens.getAllHouseList");
	}

	@Override
	public List<House> getHousePageList(int startRow, int endRow) {
		HashMap<String, Integer> hplm = new HashMap<String, Integer>();
		hplm.put("startRow", startRow);
		hplm.put("endRow", endRow);		
		return sst.selectList("housens.getHousePageList", hplm);
	}

	@Override
	public List<House> resultHouseList(String searchKey, String searchValue) {
		HashMap<String, String> rhlm = new HashMap<String, String>();
		rhlm.put("searchKey", searchKey);
		rhlm.put("searchValue", searchValue);		
		return sst.selectList("housens.resultHouseList", rhlm);
	}

	@Override
	public List<House> resultHousePageList(String searchKey, String searchValue, String startRow2, String endRow2) {
		HashMap<String, String> rhplm = new HashMap<String, String>();
		rhplm.put("searchKey", searchKey);
		rhplm.put("searchValue", searchValue);
		rhplm.put("startRow", startRow2);
		rhplm.put("endRow", endRow2);		
		return sst.selectList("housens.resultHousePageList", rhplm);
	}
}
