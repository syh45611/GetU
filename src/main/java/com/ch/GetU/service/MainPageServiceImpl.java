package com.ch.GetU.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.GetU.dao.MainPageDao;
import com.ch.GetU.model.House;

@Service
public class MainPageServiceImpl implements MainPageService {
	@Autowired
	private MainPageDao gcDao;

	@Override
	public List<House> houseList(House house) {
		return gcDao.houseList(house);
	}

	@Override
	public List<House> getAllHouseList() {
		return gcDao.getAllHouseList();
	}

	@Override
	public List<House> getHousePageList(int startRow, int endRow) {
		return gcDao.getHousePageList(startRow, endRow);
	}

	@Override
	public List<House> resultHouseList(String searchKey, String searchValue) {
		return gcDao.resultHouseList(searchKey, searchValue);
	}

	@Override
	public List<House> resultHousePageList(String searchKey, String searchValue, String startRow2, String endRow2) {
		return gcDao.resultHousePageList(searchKey, searchValue, startRow2, endRow2);
	}
}
