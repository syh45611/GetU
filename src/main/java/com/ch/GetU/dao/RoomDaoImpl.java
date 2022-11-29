package com.ch.GetU.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.GetU.model.Info;
import com.ch.GetU.model.Parking;
import com.ch.GetU.model.Review;
import com.ch.GetU.model.Room;
import com.ch.GetU.model.Subway;

@Repository
public class RoomDaoImpl implements RoomDao{
	@Autowired
	   private SqlSessionTemplate sst;
	   public List<Room> selectCanRoom(Room room) {
	      return sst.selectList("roomns.selectCanRoom",room);
	   }
	   @Override
	   public List<Room> oneDayRoomList(Room room) {
	      return sst.selectList("roomns.oneDayRoomList",room);
	   }
	   @Override
	   public int count(Room room) {
	      return sst.selectOne("roomns.count",room);
	   }
	   @Override
	   public int roomSeting(Room room) {
	      return sst.insert("roomns.roomSeting",room);
	   }
	   @Override
	   public int updateRoom(Room room) {
	      return sst.update("roomns.updateRoom",room);
	   }
	   @Override
	   public int insertFo(Parking park) {
	      return sst.insert("parkingns.insertFo",park);
	   }
	   @Override
	   public int maxNo() {
	      return sst.selectOne("parkingns.maxNo");
	   }
	   @Override
	   public int maxNo1() {
	      return sst.selectOne("subwayns.maxNo1");
	   }
	   @Override
	   public int insertSub(Subway subway) {
	      return sst.insert("subwayns.insertSub",subway);
	   }
	   @Override
	   public int maxNo2() {
	      return sst.selectOne("infons.maxNo2");	   
	   }
	   @Override
	   public int insertinf(Info inf) {
	      return sst.insert("infons.insertinf",inf);
	   }
	   @Override
	   public int MaxReview() {
	      return sst.selectOne("reviewns.createReviewNo");
	   }
	   @Override
	   public int maxPay() {
	      return sst.selectOne("payns.payNoChk");
	   }
	   @Override
	   public int insertPayNo(int payNo) {
	      return sst.insert("payns.insertPayNo",payNo);
	   }
	   @Override
	   public int insertReview(Review review) {
	      return sst.insert("reviewns.insertReview",review);
	   }
}