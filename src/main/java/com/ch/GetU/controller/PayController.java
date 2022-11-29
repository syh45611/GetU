package com.ch.GetU.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.GetU.model.Pay;
import com.ch.GetU.model.Reservation;
import com.ch.GetU.model.Room;
import com.ch.GetU.service.PayService;


@Controller
public class PayController {
	@Autowired
	private PayService ps;
	
	@RequestMapping("pay")
	public String pay(String sum, String method, Model model, int houseNo, int[] roomType, Date chkIn, Date chkOut,
							int[] roomCount, int Days, Date rOut, HttpSession session) {
		int memberNo = (Integer) session.getAttribute("memberNo");		
		int payNo = ps.payNoChk();		
		ps.payNoInsert(payNo);
		for(int i=0; i < roomType.length; i++) {
			Room rom = new Room();
			rom.setRoomType(roomType[i]);
			rom.setChkIn(chkIn);
			rom.setChkOut(chkOut);
			rom.setHouseNo(houseNo);
			List<Room>room = ps.getRoomNo(rom);
			int resNo = 0;
				for(Room rm:room) {
					resNo = ps.getResNo();
					Reservation resev = new Reservation();
					resev.setResNo(resNo);
					resev.setRoomNo(rm.getRoomNo());
					resev.setRoomCount(roomCount[i]);
					resev.setHouseNo(houseNo);
					resev.setMemberNo(memberNo);
					resev.setPayNo(payNo);
					resev.setChkIn(chkIn);
					resev.setChkOut(rOut);
					ps.revInsert(resev);
				}
			}
		String payType = method.toString();
		if(payType.equals("kakaopay")) {payType = "kakaopay";}
		if(payType.equals("nice")) {payType = "card";}
		if(payType.equals("danal")) {payType = "phone";}		
		model.addAttribute("houseNo",houseNo);
		model.addAttribute("payNo",payNo);
		model.addAttribute("payType",payType);
		model.addAttribute("paySum", sum);
		model.addAttribute("method", method);
		
		
		return "pay/pay";
	}
	@ResponseBody
	@RequestMapping(value="payComplete", method=RequestMethod.POST)
	public Map<String,String> payComplete(@RequestBody Map<String,String> map ) {
		Map<String, String> payContent = map;
		int memberNo = Integer.parseInt(payContent.get("memberNo"));
		String merchant_uid = payContent.get("merchant_uid");
		String imp_uid = payContent.get("imp_uid");
		String method = payContent.get("method");
		int paySum = Integer.parseInt(payContent.get("paySum"));
		String payType = payContent.get("payType");
		int payNo = Integer.parseInt(payContent.get("payNo"));
		int payState = Integer.parseInt(payContent.get("payState"));
		int houseNo = Integer.parseInt(payContent.get("houseNo"));
		Pay pay = new Pay();
		pay.setImp_uid(imp_uid);
		pay.setMerchant_uid(merchant_uid);
		pay.setMethod(method);
		pay.setPaySum(paySum);
		pay.setPayType(payType);
		pay.setPayNo(payNo);
		pay.setPayState(payState);
		pay.setMemberNo(memberNo);
		pay.setHouseNo(houseNo);
		ps.insertPay(pay);
		ps.updatePayState(payNo);		
		return map;
	}

	@RequestMapping("payComplete")
	public String payComplete(int payNo,int houseNo, Model model) {
		List<Reservation> chkRoom = new ArrayList<Reservation>();
		chkRoom = ps.roomNoCount(payNo);
		for(Reservation chk:chkRoom) {
			Room rom = new Room();
			int count = chk.getRoomCount();
			int remain = ps.chkRoomRemain(chk.getRoomNo());
			int roomRemain = remain - count;
			rom.setRoomNo(chk.getRoomNo());
			rom.setRoomRemain(roomRemain);
			ps.updateRoomRemain(rom);
		}
		model.addAttribute("houseNo",houseNo);
		model.addAttribute("payNo",payNo);
		return "pay/payComplete";
	}
	
	@RequestMapping("payCancel")
	public String payCancel(int payNo,Model model) {
		List<Reservation> chkRoom = new ArrayList<Reservation>();
		chkRoom = ps.roomNoCount(payNo);
		for(Reservation chk:chkRoom) {
			Room rom = new Room();
			int count = chk.getRoomCount();
			int remain = ps.chkRoomRemain(chk.getRoomNo());
			int roomRemain = remain + count;
			rom.setRoomNo(chk.getRoomNo());
			rom.setRoomRemain(roomRemain);
			ps.updateRoomRemain(rom);
		}
		ps.payCancel(payNo);
		ps.resevCancel(payNo);		
		return "/pay/payCancel";
	}

}



