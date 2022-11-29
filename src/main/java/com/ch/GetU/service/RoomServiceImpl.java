package com.ch.GetU.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.GetU.dao.RoomDao;
import com.ch.GetU.model.Info;
import com.ch.GetU.model.Parking;
import com.ch.GetU.model.Review;
import com.ch.GetU.model.Room;
import com.ch.GetU.model.Subway;

@Service
public class RoomServiceImpl implements RoomService{
	 @Autowired
	   private RoomDao rd;
	   @Override
	   public List<Room> selectCanRoom(Room room) {
	      return rd.selectCanRoom(room);
	   }
	   @Override
	   public List<Room> oneDayRoomList(Room room) {
	      return rd.oneDayRoomList(room);
	   }
	   @Override
	   public int count(Room room) {
	      return rd.count(room);
	   }
	   @Override
	   public int roomSeting(Room room) {
	      return rd.roomSeting(room);
	   }
	   @Override
	   public int updateRoom(Room room) {
	      return rd.updateRoom(room);
	   }
	   @Override
	   public int insertFo(Parking park) {
	      return rd.insertFo(park);
	   }
	   @Override
	   public int maxNo() {
	      return rd.maxNo();
	   }
	   @Override
	   public int maxNo1() {
	      return rd.maxNo1();
	   }
	   @Override
	   public int insertSub(Subway subway) {
	      return rd.insertSub(subway);
	   }
	   @Override
	   public int maxNo2() {
	      return rd.maxNo2();
	   }
	   @Override
	   public int insertinf(Info inf) {
	      return rd.insertinf(inf);
	   }
	   @Override
	   public int MaxReview() {
	      return rd.MaxReview();
	   }
	   @Override
	   public int maxPay() {
	      return rd.maxPay();
	   }
	   @Override
	   public int insertPayNo(int payNo) {
	      return rd.insertPayNo(payNo);
	   }
	   @Override
	   public int insertReview(Review review) {
	      return rd.insertReview(review);
	   
	   }
}