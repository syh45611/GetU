package com.ch.GetU.dao;

import java.util.List;

import com.ch.GetU.model.Pay;
import com.ch.GetU.model.Reservation;
import com.ch.GetU.model.Room;

public interface PayDao {
	int payNoChk();

	int payNoInsert(int payNo);

	int getResNo();

	List<Room> getRoomNo(Room room);

	int revInsert(Reservation reservation);

	int insertPay(Pay pay);

	int updatePayState(int payNo);

	List<Reservation> roomNoCount(int payNo);

	int chkRoomRemain(int roomNo);

	int updateRoomRemain(Room room);

	int payCancel(int payNo);

	int resevCancel(int payNo);
	

}
