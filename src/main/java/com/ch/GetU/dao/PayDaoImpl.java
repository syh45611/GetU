package com.ch.GetU.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.GetU.model.Pay;
import com.ch.GetU.model.Reservation;
import com.ch.GetU.model.Room;


@Repository
public class PayDaoImpl implements PayDao{
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public int payNoChk() {
		return sst.selectOne("payns.payNoChk");
	}

	@Override
	public int payNoInsert(int payNo) {
		return sst.insert("payns.payNoInsert",payNo);
	}

	@Override
	public int getResNo() {
		return sst.selectOne("reservationns.getResNo");
	}

	@Override
	public List<Room> getRoomNo(Room room) {
		return sst.selectList("roomns.getRoomNo",room);
	}

	@Override
	public int revInsert(Reservation reservation) {
		return sst.insert("reservationns.revInsert",reservation);
	}

	@Override
	public int insertPay(Pay pay) {
		return sst.update("payns.insertPay",pay);
	}

	@Override
	public int updatePayState(int payNo) {
		return sst.update("payns.updatePayState",payNo);
	}

	@Override
	public List<Reservation> roomNoCount(int payNo) {
		return sst.selectList("reservationns.roomNoCount",payNo);
	}

	@Override
	public int chkRoomRemain(int roomNo) {
		return sst.selectOne("roomns.chkRoomRemain",roomNo);
	}
	@Override
	public int updateRoomRemain(Room room) {
		return sst.update("roomns.updateRoomRemain",room);
	}

	@Override
	public int payCancel(int payNo) {
		return sst.update("payns.payCancel",payNo);
	}

	@Override
	public int resevCancel(int payNo) {
		return sst.delete("reservationns.resevCancel",payNo);
	}
	
	
	
}
