package com.ch.GetU.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.GetU.model.Room;
import com.ch.GetU.service.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService rs;
	@RequestMapping("roomList")	
	public String roomList(Room room, Model model, Date chkOut, Date chkIn, int houseNo) {		
		room.setChkIn(chkIn);
		room.setChkOut(chkOut);
		model.addAttribute("houseNo",houseNo);
		model.addAttribute("chkIn",room.getChkIn());
		model.addAttribute("chkOut",room.getChkOut());
		return "/room/roomList";
	}

	@RequestMapping("roomListContent")	
	public String roomListContent(Room room,Model model,Date chkOut,Date chkIn,int houseNo) throws ParseException {
		Room room1 = new Room();
		room1.setChkIn(chkIn);
		room1.setChkOut(chkOut);
		room1.setHouseNo(houseNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //Date를 비교 하기 위해
		String in = sdf.format(chkIn); // 1박, 1박초과 별도처리
		String out = sdf.format(chkOut);
		int Button = 0;	// 예약하기 버튼 생성유무 체크		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); // 기간별 필요한 방갯수를 구한다
		java.util.Date cIn = format.parse(in);
		java.util.Date cOut = format.parse(out);
		long Sec = (cOut.getTime() - cIn.getTime()) / 1000;
		long Days = Sec/(24*60*60)+1;
		if(in.equals(out)) { 						// 1박일 경우
			List<Room>oneDayRoomList = rs.oneDayRoomList(room1);
			for(Room rom:oneDayRoomList) { 		// 예약 버튼 생성 유무 체크
				Button += rom.getRoomRemain();
			}
			model.addAttribute("Button",Button);
			model.addAttribute("Days",Days);
			model.addAttribute("oneDayRoomList",oneDayRoomList);
			model.addAttribute("houseNo",houseNo);
			model.addAttribute("chkIn",room1.getChkIn());
			model.addAttribute("chkOut",room1.getChkOut());
			return "/room/roomListContent";
		}else { 									// 1박 초과일 경우
			List<Room>CanRoomList = rs.selectCanRoom(room1);			
			//타입별 0이거나 널값이 있는 경우 roomRemain을 0으로 만들어준다
			 for(Room chkRoom:CanRoomList) { 		// 기간별 해당 타입의 방갯수를 구한다
				 chkRoom.setChkIn(chkIn);
				 chkRoom.setChkOut(chkOut);
				 chkRoom.setHouseNo(houseNo);
				 int RoomCount = rs.count(chkRoom);				 
			 if(RoomCount < Days) {
				 chkRoom.setRoomRemain(0);
			 	}
			 }
			 for(Room rom:CanRoomList) {	// 예약 버튼 생성 유무 체크
					Button += rom.getRoomRemain();
				}
			model.addAttribute("Button",Button);
			model.addAttribute("Days",Days);
			model.addAttribute("CanRoomList",CanRoomList);
			model.addAttribute("houseNo",houseNo);
			model.addAttribute("chkIn",room1.getChkIn());
			model.addAttribute("chkOut",room1.getChkOut());		
			return "/room/roomListContent";
		}		
	}
		@RequestMapping("updateRoom")
		public String updateRoom( Model model, int[] roomNo,int[] roomRemain,Date chkIn,Integer houseNo) {			
			Integer hous = houseNo;	
			int update = 0;			
			for(int i=0; i < roomNo.length; i++) {
				Room room = new Room();
				room.setRoomNo(roomNo[i]);
				room.setRoomRemain(roomRemain[i]);
				update = rs.updateRoom(room);
			}
			model.addAttribute("update",update);
			model.addAttribute("houseNo",houseNo);
			model.addAttribute("chkIn",chkIn);
			return "/house/managerPage";
		}	
	}

