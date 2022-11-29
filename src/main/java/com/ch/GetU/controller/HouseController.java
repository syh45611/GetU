package com.ch.GetU.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.GetU.model.House;
import com.ch.GetU.model.Info;
import com.ch.GetU.model.Parking;
import com.ch.GetU.model.Review;
import com.ch.GetU.model.Room;
import com.ch.GetU.model.Subway;
import com.ch.GetU.service.HouseService;
import com.ch.GetU.service.PagingBean;

@Controller
public class HouseController {
	   @Autowired
	   private HouseService hs;

	   @RequestMapping("houseContent") // 숙소 메인 첫페이지
	   public String houseContent(int houseNo, HttpSession session, Model model, String pageNum) throws ParseException {
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Calendar c1 = Calendar.getInstance();
	      String chkIn = sdf.format(c1.getTime());
	      c1.add(Calendar.DATE, 1);
	      String chkOut = sdf.format(c1.getTime());
	      House house = hs.select(houseNo);
	      Review reviewA = hs.reviewAv(houseNo);
	      Double reviewAvg = reviewA.getReviewAv();

	      if (pageNum == null || pageNum.equals("")) {
	         pageNum = "0";
	      }
	      int page = Integer.parseInt(pageNum);

	      model.addAttribute("page", page);
	      model.addAttribute("pageNum", pageNum);
	      model.addAttribute("reviewAvg", reviewAvg);
	      model.addAttribute("chkIn", chkIn);
	      model.addAttribute("chkOut", chkOut);
	      model.addAttribute("houseNo", houseNo);
	      model.addAttribute("house", house);
	      return "/house/houseContent";
	   }

	   @RequestMapping("houseContent2") // 그 이후 페이징
	   public String houseContent2(Room room, Model model, Date chkOut, Date chkIn, int houseNo, String pageNum) {
	      House house = hs.select(houseNo);
	      room.setChkIn(chkIn);
	      room.setChkOut(chkOut);
	      Review reviewA = hs.reviewAv(houseNo);
	      Double reviewAvg = reviewA.getReviewAv();
	      if (pageNum == null || pageNum.equals("")) {
	         pageNum = "0";
	      }
	      int page = Integer.parseInt(pageNum);
	      model.addAttribute("page", page);
	      model.addAttribute("pageNum", pageNum);
	      model.addAttribute("reviewAvg", reviewAvg);
	      model.addAttribute("chkIn", room.getChkIn());
	      model.addAttribute("chkOut", room.getChkOut());
	      model.addAttribute("houseNo", houseNo);
	      model.addAttribute("house", house);
	      return "/house/houseContent";
	   }

	   @RequestMapping("map")
	   public String map(Model model, HttpSession session, int houseNo) {
	      House house = hs.select(houseNo);
	      List<Info> info = hs.selectInfo(houseNo);
	      List<Parking> parking = hs.selectPark(houseNo);
	      List<Subway> subway = hs.selectSubway(houseNo);
	      model.addAttribute("info", info);
	      model.addAttribute("parking", parking);
	      model.addAttribute("subway", subway);
	      model.addAttribute("house", house);
	      return "/house/map";
	   }

	   @RequestMapping("reviewCont")
	   public String reviewContent(Model model, int houseNo, String pageNum, Review review) {
	      Review reviewA = hs.reviewAv(houseNo);
	      double reviewAval = reviewA.getReviewAv();
	      if (pageNum == null || pageNum.equals("")) {
	         pageNum = "1";
	      }
	      int currentPage = Integer.parseInt(pageNum);
	      int rowPerPage = 6; // 한 화면에 보여주는 게시글 갯수
	      int total = hs.reviewCo(houseNo);
	      int startRow = (currentPage - 1) * rowPerPage + 1;
	      int endRow = startRow + rowPerPage - 1;
	      review.setStartRow(startRow);
	      review.setEndRow(endRow);
	      List<Review> reviewList = hs.reviewListAll(review); // 공지사항 목록
	      int nowNum = total - startRow + 1; // 번호 순서대로 정렬
	      PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
	      model.addAttribute("nowNum", nowNum);
	      model.addAttribute("pb", pb);
	      model.addAttribute("houseNo", houseNo);
	      model.addAttribute("reviewList", reviewList);
	      model.addAttribute("reviewAval", reviewAval);
	      return "/house/reviewCont";
	   }

	   
	   @RequestMapping("manager")
	   public String manager(Model model, int houseNo, Date chkIn) {
	      int result = 1;
	      if (chkIn == null || chkIn.equals("")) {
	         result = 0;
	         model.addAttribute("houseNo", houseNo);
	         return "/house/managerPage";
	      } else {
	         model.addAttribute("houseNo", houseNo);
	         model.addAttribute("chkIn", chkIn);
	         return "/house/managerPage";
	      }
	   }

	   @RequestMapping("updateRoomList")
	   public String updateRoomList(Model model, int houseNo, Date chkIn) {
	      Date[]chk = new Date[5];	      
	      for(int i = 0; i <5; i++) {
	      Calendar cal1 = Calendar.getInstance();
	      cal1.setTime(chkIn); // 시간 설정
	      cal1.add(Calendar.DATE, i); // 일 연산
	      Date cal2 = new Date(cal1.getTimeInMillis());
	      chk[i] = cal2;
	      }
	      Date chk1 = chk[0];
	      Date chk2 = chk[1];
	      Date chk3 = chk[2];
	      Date chk4 = chk[3];
	      Date chk5 = chk[4];
	      Room room = new Room();
	      room.setRoomDate(chk1); 
	      room.setHouseNo(houseNo);
	      List<Room> roomList1 = hs.selectRoomList(room);
	      room.setRoomDate(chk2); 
	      room.setHouseNo(houseNo);
	      List<Room> roomList2 = hs.selectRoomList(room);
	      room.setRoomDate(chk3); 
	      room.setHouseNo(houseNo);
	      List<Room> roomList3 = hs.selectRoomList(room);
	      room.setRoomDate(chk4); 
	      room.setHouseNo(houseNo);
	      List<Room> roomList4 = hs.selectRoomList(room);
	      room.setRoomDate(chk5); 
	      room.setHouseNo(houseNo);
	      List<Room> roomList5 = hs.selectRoomList(room);	      
	      model.addAttribute("houseNo",houseNo);
	      model.addAttribute("chk1",chk1);
	      model.addAttribute("chk2",chk2);
	      model.addAttribute("chk3",chk3);
	      model.addAttribute("chk4",chk4);
	      model.addAttribute("chk5",chk5);
	      model.addAttribute("roomList1", roomList1); 
	      model.addAttribute("roomList2", roomList2); 
	      model.addAttribute("roomList3", roomList3); 
	      model.addAttribute("roomList4", roomList4); 
	      model.addAttribute("roomList5", roomList5); 
	      model.addAttribute("chkIn", chkIn);
	      return "/house/updateRoom";
	   }
	   @RequestMapping("managerPage")
	   public String cancelTest(Model model,Date chkIn,int houseNo) {
	      String chkI = "";
	      if (chkIn == null || chkIn.equals("")) {
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	         Calendar c1 = Calendar.getInstance();
	         chkI = sdf.format(c1.getTime());
	         model.addAttribute("houseNo",houseNo);
	         model.addAttribute("chkIn",chkI);
	      }else {
	         model.addAttribute("houseNo",houseNo);
	         model.addAttribute("chkIn",chkIn);
	      }
	      return "/house/managerPage";
	   }
}
