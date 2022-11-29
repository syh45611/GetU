package com.ch.GetU.service;

import org.springframework.stereotype.Service;

import com.ch.GetU.model.Room;
@Service
public interface ReservService {

	Room selectRevRoom(Room Room);

}
