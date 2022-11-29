package com.ch.GetU.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.GetU.dao.HouseDao;
import com.ch.GetU.model.House;
import com.ch.GetU.model.Info;
import com.ch.GetU.model.Parking;
import com.ch.GetU.model.Review;
import com.ch.GetU.model.Room;
import com.ch.GetU.model.Subway;

@Service
public class HouseServiceImpl implements HouseService{
	@Autowired
	private HouseDao hd;
	
	@Override
	public House select(int houseNo) {
		return hd.select(houseNo);
	}
	@Override
	public Review reviewAv(int houseNo) {
		return hd.reviewAv(houseNo);
	}

	@Override
	public int reviewCo(int houseNo) {
		return hd.reviewCo(houseNo);
	}

	@Override
	public List<Review> reviewSel(int houseNo) {
		return hd.reviewSel(houseNo);
	}

	@Override
	public List<Info> selectInfo(int houseNo) {
		return hd.selectInfo(houseNo);
	}

	@Override
	public List<Parking> selectPark(int houseNo) {
		return hd.selectPark(houseNo);
	}

	@Override
	public List<Subway> selectSubway(int houseNo) {
		return hd.selectSubway(houseNo);
	}

	@Override
	public List<Room> selectRoomList(Room room) {
		return hd.selectRoomList(room);
	}
	@Override
	public List<Review> reviewListAll(Review review) {
		return hd.reviewListAll(review);
	}

}
