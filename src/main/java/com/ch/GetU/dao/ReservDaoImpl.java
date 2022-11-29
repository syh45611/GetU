package com.ch.GetU.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.GetU.model.Room;

@Repository
public class ReservDaoImpl implements ReservDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Room selectRevRoom(Room room) {
		return sst.selectOne("roomns.selectRevRoom",room);
	}	
}
