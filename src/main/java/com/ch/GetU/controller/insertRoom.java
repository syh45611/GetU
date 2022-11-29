package com.ch.GetU.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.GetU.model.Info;
import com.ch.GetU.model.Parking;
import com.ch.GetU.model.Review;
import com.ch.GetU.model.Room;
import com.ch.GetU.model.Subway;
import com.ch.GetU.service.RoomService;

@Controller
public class insertRoom {
   @Autowired
   private RoomService rs;

   @RequestMapping("insertRoomData")
   public String insertRoomData() {
      int roomNo = 0;
      for (int j = 1; j < 21; j++) {
         int houseNo = j;
         int roomType = 1;
         int roomPrice = 60000;
         int roomCapa = 1;
         String roomName = "싱글방";         
         for (int i = 1; i < 31; i++) {
            Calendar cal = Calendar.getInstance();
            cal.set(2022, 10, i); //  10 -> 11월 
            java.util.Date dd = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String ss = sdf.format(dd);
            java.sql.Date d = java.sql.Date.valueOf(ss);
            int randomVal = (int) (Math.random() * 10);            
            roomNo += 1;
            Room rom = new Room();
            rom.setRoomNo(roomNo);
            rom.setHouseNo(houseNo);
            rom.setRoomType(roomType);
            rom.setRoomPrice(roomPrice);
            rom.setRoomCapa(roomCapa);
            rom.setRoomName(roomName);
            rom.setRoomDate(d);
            rom.setRoomRemain(randomVal);
            rs.roomSeting(rom);
         }
         houseNo = j;
         roomType = 2;
         roomPrice = 70000;
         roomCapa = 2;
         roomName = "더블방";
         for (int i = 1; i < 31; i++) {
            Calendar cal = Calendar.getInstance();
            cal.set(2022, 10, i); // 10 -> 11월 
            java.util.Date dd = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String ss = sdf.format(dd);
            java.sql.Date d = java.sql.Date.valueOf(ss);
            int randomVal = (int) (Math.random() * 10);
            roomNo += 1;
            Room rom = new Room();
            rom.setRoomNo(roomNo);
            rom.setHouseNo(houseNo);
            rom.setRoomType(roomType);
            rom.setRoomPrice(roomPrice);
            rom.setRoomCapa(roomCapa);
            rom.setRoomName(roomName);
            rom.setRoomDate(d);
            rom.setRoomRemain(randomVal);
            rs.roomSeting(rom);
         }
         houseNo = j;
         roomType = 3;
         roomPrice = 90000;
         roomCapa = 3;
         roomName = "트리플방";
         for (int i = 1; i < 31; i++) {
            Calendar cal = Calendar.getInstance();
            cal.set(2022, 10, i); //  10 -> 11월 
            java.util.Date dd = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String ss = sdf.format(dd);
            java.sql.Date d = java.sql.Date.valueOf(ss);
            int randomVal = (int) (Math.random() * 10);
            roomNo += 1;
            Room rom = new Room();
            rom.setRoomNo(roomNo);
            rom.setHouseNo(houseNo);
            rom.setRoomType(roomType);
            rom.setRoomPrice(roomPrice);
            rom.setRoomCapa(roomCapa);
            rom.setRoomName(roomName);
            rom.setRoomDate(d);
            rom.setRoomRemain(randomVal);
            rs.roomSeting(rom);
         }
      }
      return "/room/roomInsert";
   }
   @RequestMapping("insertFo")
   public String insertFo() {
      String st = "주차가 불가하오니 가능한 대중교통을 이용을 권장드립니다.";
      String st1 = "※지하철: 1, 2호선 시청역 4번 출구 도보 3분";
      String st2 = "5호선 광화문역 5번 출구 도보 3분";
      String st3 = "※버스: 광화문 정류장 서울파이낸스빌딩 방향 도보 5분";      
      for(int i=1; i < 21; i++ ) {
         Parking park = new Parking();
         int max =0;
         max = rs.maxNo();
         park.setPno(max);
         park.setHouseno(i);
         park.setParkcontent(st);
         rs.insertFo(park);         
         max = rs.maxNo();
         park.setPno(max);
         park.setParkcontent(st1);
         rs.insertFo(park);         
         max = rs.maxNo();
         park.setPno(max);
         park.setParkcontent(st2);
         rs.insertFo(park);         
         max = rs.maxNo();
         park.setPno(max);
         park.setParkcontent(st3);
         rs.insertFo(park);
      }   
      String tr = "충무로역";
      String tr1 = "충무로역";
      String tr2 = "명동역";
      String tr3 = "회현(남대문시장)역";      
      for(int i=1; i < 21; i++ ) {
         Subway subway = new Subway();
         int max =0;
         max = rs.maxNo1();
         subway.setSno(max);
         subway.setHouseno(i);
         subway.setSubwaycontent(tr);
         rs.insertSub(subway);  
         max = rs.maxNo1();
         subway.setSno(max);
         subway.setHouseno(i);
         subway.setSubwaycontent(tr1);
         rs.insertSub(subway);
         max = rs.maxNo1();
         subway.setSno(max);
         subway.setHouseno(i);
         subway.setSubwaycontent(tr2);
         rs.insertSub(subway);
         max = rs.maxNo1();
         subway.setSno(max);
         subway.setHouseno(i);
         subway.setSubwaycontent(tr3);
         rs.insertSub(subway); 
      }
      String ir ="\"지하철 : 1, 2호선 시청역 4번 출구 도보 3분";
      String ir1 ="  5호선 광화문역 5번 출구 도보 3분";
      String ir2 ="버스 : 광화문 정류장 서울 파이낸스빌딩 방향 도보 5분\"";
      
      for(int i=1; i < 21; i++ ) {
         Info inf = new Info();
         int max =0;
         max = rs.maxNo2();
         inf.setIno(max);
         inf.setHouseno(i);
         inf.setInfocontent(ir);
         rs.insertinf(inf);
         max = rs.maxNo2();
         inf.setIno(max);
         inf.setHouseno(i);
         inf.setInfocontent(ir1);
         rs.insertinf(inf);
         max = rs.maxNo2();
         inf.setIno(max);
         inf.setHouseno(i);
         inf.setInfocontent(ir2);
         rs.insertinf(inf);      
      }
      return "/room/roomInsert";
   }
      @RequestMapping("insertreview")
      public String insertreview() {
         String [] subject = new String [6];
         String [] content = new String [6];
         subject[0] = "여기만한 곳은 어디에도 없을 거예요.";
         subject[1] = "기대 이상이네요.";
         subject[2] = "전체적으로 만족스러웠어요.";
         subject[3] = "여기라면 다음에 또 이용할 거예요.";
         subject[4] = "조금만 더 신경 써 주세요.";
         subject[5] = "기대 이상이네요.";
         content[0] = "처음 가본 호텔이기도 했고 지방친구가 올리와서 나름 호캉스를 즐기려고 간거였는데 정말정말 시설도 좋고 프런트에 계신 분들도 친절하시고 너무너무좋았아요\r\n"
               + "아쉬운게 있다면 조식을 신청해야 먹을수있다는 점 당일 예약은 안되서 못먹었고 주말이라 1층 카페 운영을 안해서 먹고싶었던 빵을 못먹었어요\r\n"
               + "근데 정말정말 편하게 잘 쉬다 간거같아요";
         content[1] = "너무 좋은 숙소 였어요\r\n"
               + "장시간 서울 여행 중 제일 괜찮은 방이였습니다.\r\n"
               + "친구와 여행 중 여기어때를 통해서 숙소를 예약 후 체크인 시 직원분들도 너무 친절하시고 수월히 체크인을 했답니다\r\n"
               + "숙소 객실도 매우 깨끗합니다.\r\n"
               + "너무 만족한 하루를 보냈습니다";
         content[2] = "가격도 좋고 위치도 좋고 생각지도 못한것에서 좋은 경험하고가요!! 이게 메뉴에 있어서 그런데 모텔 아니라 호텔이에요 그리고 로비에 직원분들도 친절하고 고급스러웠어요 다만 수압이 조금 약했어요";
         content[3] = "1. 객실이 버스, 지하철 이용하기에 접근성이 좋은 곳에 위치해 있어서 만족합니다.\r\n"
               + "2. 객실 청결도는 좋으나 샤워실 수압이 너무너무 안좋아서(쫄쫄쫄 수준) 머리가 긴 편이 아닌데도 불편하고 불만족 스러웠습니다.\r\n"
               + "3. 저희 객실 화장실만 그런진 모르겠으나 물을 내리면 밸브 문제인건지 물이 계속 내려가며 소리가 발생해서 변기를 어떻게 건드려서 해결했는데 이 또한 매우 불편합니다. (3-4번 정도 발생)";
         content[4] = "여자친구랑 서울에서 데이트를 하게 되었는데 항상 숙박시설에 민감하는 저희가 하나하나 꼼꼼하게 찾아보고 이용을 하게 되었습니다:)\r\n"
               + "하나부터 열까지 마음에 들었습니다..\r\n"
               + "특히 룸컨디션이 너무 완벽했기에 또 하나의 추억을 만들게 되었습니다 ㅎㅎㅎㅎㅎㅎㅎㅎㅎ";
         content[5] = "객실 컨디션 좋았고 위치도 좋더라구요\r\n"
               + "옛날 호텔 느낌이라 있을 거 다 있고\r\n"
               + "창문이 없는 방을 예약했는데 그렇게 답답하단 느낌도\r\n"
               + "못 받았고 전체적으로 깔끔하고\r\n"
               + "직원분들도 친절하셔서 잘 이용했습니다";
         for (int i = 1; i < 21; i ++) {
           int houseNo = i;
           for(int j = 0; j < 20; j++) {
             Review review = new Review();
              int reviewNo = rs.MaxReview(); // 리뷰테이블에서 최대값
              int payNo = rs.maxPay(); // 페이테이블에서 최대값
              rs.insertPayNo(payNo);   // 페이테이블에 payNo 삽입
              int randomVal = (int) (Math.random() * 6); // 0 ~ 5
              review.setReviewNo(reviewNo);
              review.setPayNo(payNo);
              review.setHouseNo(houseNo);
              review.setReviewSubject(subject[randomVal]);
              review.setReviewContent(content[randomVal]);
              review.setReviewScore(randomVal);
              rs.insertReview(review);
           }
         }         
         return "/room/roomInsert";
      }
}