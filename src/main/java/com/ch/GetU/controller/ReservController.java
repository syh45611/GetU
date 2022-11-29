package com.ch.GetU.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.GetU.model.House;
import com.ch.GetU.model.Reservation;
import com.ch.GetU.model.Room;
import com.ch.GetU.service.HouseService;
import com.ch.GetU.service.ReservService;

@Controller
public class ReservController {
   @Autowired
   private ReservService rs;
   @Autowired
   private HouseService hs;

   @RequestMapping("resevChkList")
   public String resevChkList(int[] roomType, int[] roomCount, Model model, Date chkOut, int Days, Date chkIn,
         int houseNo, HttpSession session) throws ParseException {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 예약상 체크아웃 날짜를 구한다
      String out = sdf.format(chkOut);
      DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
      java.util.Date cOut = format.parse(out);
      Calendar cal = Calendar.getInstance();
      cal.setTime(cOut);
      cal.add(Calendar.DATE, 1);
      String rOut = sdf.format(cal.getTime());
   
      int   memberNo = (Integer)session.getAttribute("memberNo");
   
      List<Reservation> resevRoom = new ArrayList<Reservation>();
      for (int i = 0; i < roomType.length; i++) { // reservation 에 룸갯수와 타입을 resevRoom에 넣는다
         Reservation ins = new Reservation();
         ins.setChkIn(chkIn);
         ins.setChkOut(chkOut);
         ins.setRoomCount(roomCount[i]);
         ins.setRoomType(roomType[i]);
         resevRoom.add(ins);
      }      
      List<Room> Rooms = new ArrayList<Room>(); // Rooms에 룸 갯수가 0이 아닌 타입을 넣는다
      for (Reservation room : resevRoom) {
         int i = room.getRoomCount();
         if (i != 0) {
            Room rom = new Room();
            rom.setRoomCount(room.getRoomCount());
            rom.setRoomType(room.getRoomType());
            Rooms.add(rom);
         }
      }

      List<Room> RoomList = new ArrayList<Room>(); // RoomList에 룸 갯수가 0이 아닌 타입의 체크기준 총내용을 구함
      int sum = 0; // 총 금액을 구한다
      for (Room room : Rooms) {
         Room rom = new Room();
         rom.setRoomType(room.getRoomType());
         rom.setChkIn(chkIn);
         rom.setChkOut(chkOut);
         rom.setHouseNo(houseNo);      
         rom = rs.selectRevRoom(rom);         
         int count = room.getRoomCount(); // 예약 갯수 대입         
         int multi = rom.getRoomPrice(); // 각 기간별 총금액
         multi *= count; // 각 기간별 총금액 * 예약갯수
         sum += multi; // sum 에 모든 금액을 넣는다
         rom.setRoomPrice(multi);
         rom.setRoomType(room.getRoomType());
         rom.setChkIn(chkIn);
         rom.setChkOut(chkOut);
         rom.setHouseNo(houseNo);
         rom.setRoomCount(room.getRoomCount());
         rom.setDays(Days);
         RoomList.add(rom);
      }
      int result = 1;
         if (sum == 0) {
            result = 0;
      }            
      House house = hs.select(houseNo);
      String houseName = house.getHouseName();      
      model.addAttribute("chkIn",chkIn);
      model.addAttribute("houseName",houseName);
      model.addAttribute("houseNo",houseNo);
      model.addAttribute("memberNo",memberNo);
      model.addAttribute("rOut", rOut);
      model.addAttribute("Days", Days);
      model.addAttribute("result", result);
      model.addAttribute("sum", sum);
      model.addAttribute("RoomList", RoomList);
      return "/reservation/chekIn2";
   }
}