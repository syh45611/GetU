package com.ch.GetU.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ch.GetU.model.House;
import com.ch.GetU.model.Info;
import com.ch.GetU.model.Parking;
import com.ch.GetU.model.Review;
import com.ch.GetU.model.Room;
import com.ch.GetU.model.Subway;
@Service
public interface HouseService {

	House select(int houseNo);

	Review reviewAv(int houseNo);

	int reviewCo(int houseNo);

	List<Review> reviewSel(int houseNo);

	List<Info> selectInfo(int houseNo);

	List<Parking> selectPark(int houseNo);

	List<Subway> selectSubway(int houseNo);

	List<Room> selectRoomList(Room room);

	List<Review> reviewListAll(Review review);

}
