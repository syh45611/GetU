package com.ch.GetU.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ch.GetU.model.Pay;
import com.ch.GetU.model.Reservation;
import com.ch.GetU.model.Room;
@Service
public interface PayService {
	int payNoChk();
	int payNoInsert(int payNo);
	List<Room> getRoomNo(Room room);
	int getResNo();
	int revInsert(Reservation reservation);
	int insertPay(Pay pay);
	int updatePayState(int payNo);
	List<Reservation> roomNoCount(int payNo);
	int chkRoomRemain(int roomNo);
	int updateRoomRemain(Room room);
	int payCancel(int payNo);
	int resevCancel(int payNo);
}
