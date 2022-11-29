package com.ch.GetU.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.GetU.dao.PayDao;
import com.ch.GetU.model.Pay;
import com.ch.GetU.model.Reservation;
import com.ch.GetU.model.Room;

@Service
public class PayServiceImpl implements PayService{
	@Autowired
	private PayDao pd;
	
	@Override
	public int payNoChk() {
		// TODO Auto-generated method stub
		return pd.payNoChk();
	}

	@Override
	public int payNoInsert(int payNo) {
		// TODO Auto-generated method stub
		return pd.payNoInsert(payNo);
	}

	@Override
	public int getResNo() {
		// TODO Auto-generated method stub
		return pd.getResNo();
	}

	@Override
	public List<Room> getRoomNo(Room room) {
		// TODO Auto-generated method stub
		return pd.getRoomNo(room);
	}

	@Override
	public int revInsert(Reservation reservation) {
		// TODO Auto-generated method stub
		return pd.revInsert(reservation);
	}

	@Override
	public int insertPay(Pay pay) {
		// TODO Auto-generated method stub
		return pd.insertPay(pay);
	}

	@Override
	public int updatePayState(int payNo) {
		// TODO Auto-generated method stub
		return pd.updatePayState(payNo);
	}

	@Override
	public List<Reservation> roomNoCount(int payNo) {
		// TODO Auto-generated method stub
		return pd.roomNoCount(payNo);
	}

	@Override
	public int chkRoomRemain(int roomNo) {
		// TODO Auto-generated method stub
		return pd.chkRoomRemain(roomNo);
	}

	@Override
	public int updateRoomRemain(Room room) {
		// TODO Auto-generated method stub
		return pd.updateRoomRemain(room);
	}

	@Override
	public int payCancel(int payNo) {
		// TODO Auto-generated method stub
		return pd.payCancel(payNo);
	}

	@Override
	public int resevCancel(int payNo) {
		// TODO Auto-generated method stub
		return pd.resevCancel(payNo);
	}
	

}
