package com.ch.GetU.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.GetU.dao.ReservDao;
import com.ch.GetU.model.Room;

@Service
public class ReservServiceImpl implements ReservService{
	@Autowired
	private ReservDao rd;

	@Override
	public Room selectRevRoom(Room Room) {
		// TODO Auto-generated method stub
		return rd.selectRevRoom(Room);
	}

	

}
