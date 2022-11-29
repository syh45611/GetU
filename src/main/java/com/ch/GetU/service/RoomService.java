package com.ch.GetU.service;

import java.util.List;

import com.ch.GetU.model.Info;
import com.ch.GetU.model.Parking;
import com.ch.GetU.model.Review;
import com.ch.GetU.model.Room;
import com.ch.GetU.model.Subway;
public interface RoomService {

	List<Room> selectCanRoom(Room room);

	   List<Room> oneDayRoomList(Room room);

	   int count(Room room);

	   int roomSeting(Room room);

	   int updateRoom(Room room);

	   int insertFo(Parking park);

	   int maxNo();

	   int maxNo1();

	   int insertSub(Subway subway);

	   int maxNo2();

	   int insertinf(Info inf);

	   int MaxReview();

	   int maxPay();

	   int insertPayNo(int payNo);

	   int insertReview(Review review);
	


}
