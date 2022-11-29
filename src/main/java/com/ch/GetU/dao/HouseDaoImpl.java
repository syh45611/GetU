package com.ch.GetU.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.GetU.model.House;
import com.ch.GetU.model.Info;
import com.ch.GetU.model.Parking;
import com.ch.GetU.model.Review;
import com.ch.GetU.model.Room;
import com.ch.GetU.model.Subway;

@Repository
public class HouseDaoImpl implements HouseDao{
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public House select(int houseNo) {
		return sst.selectOne("housens.select",houseNo );
	}

	@Override
	public Review reviewAv(int houseNo) {
		return sst.selectOne("reviewns.reviewAv",houseNo);
	}

	@Override
	public int reviewCo(int houseNo) {
		return sst.selectOne("reviewns.reviewCo",houseNo);
	}

	@Override
	public List<Review> reviewSel(int houseNo) {
		return sst.selectList("reviewns.reviewSel",houseNo);
	}

	@Override
	public List<Info> selectInfo(int houseNo) {
		return sst.selectList("infons.selectInfo",houseNo);
	}

	@Override
	public List<Parking> selectPark(int houseNo) {
		return sst.selectList("parkingns.selectPark",houseNo);
	}

	@Override
	public List<Subway> selectSubway(int houseNo) {
		return sst.selectList("subwayns.selectSubway",houseNo);
	}

	@Override
	public List<Room> selectRoomList(Room room) {
		return sst.selectList("roomns.selectRoomList", room);
	}

	@Override
	public List<Review> reviewListAll(Review review) {
		return sst.selectList("reviewns.reviewListAll", review);
	}

}
