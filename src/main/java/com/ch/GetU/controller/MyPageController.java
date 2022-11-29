package com.ch.GetU.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.GetU.model.Member;
import com.ch.GetU.model.Reservation;
import com.ch.GetU.model.Review;
import com.ch.GetU.service.MyPageService;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService mpService;

	@RequestMapping("myPage")
	public String myPage(HttpSession session, Model model) {
		if (session.getAttribute("memberId") != null) {
			int memberNo = (Integer) session.getAttribute("memberNo");
			String memberId = (String) session.getAttribute("memberId");
			Member member = mpService.selectMember(memberId);

			List<Integer> payNoList = mpService.payNoList(memberNo);
			List<Reservation> reservationTempList = mpService.reservationTemp(memberNo);

			int[] count = new int[payNoList.size()];

			for (int j = 0; j < reservationTempList.size(); j++) {
				for (int k = 0; k < payNoList.size(); k++) {
					if (reservationTempList.get(j).getPayNo() == payNoList.get(k)) {
						if (count[k] > 0) {
							reservationTempList.remove(j);
							break;
						}

						count[k]++;
					}
				}
			}

			int TotalReservation = reservationTempList.size();
			int TotalReview = mpService.getTotalReview(memberNo);

			List<Reservation> reservationPageList = new ArrayList<Reservation>();

			List<Reservation> reservationList = mpService.reservationTemp(memberNo);
			List<Review> reviewList = mpService.reviewList(memberNo);

			for (int i = 1; i <= 4; i++) {
				if (i <= reservationTempList.size()) {
					reservationPageList.add(reservationTempList.get(i - 1));
				}
			}

			String houseName = "";
			List<String> houseNameList = new ArrayList<String>();

			for (int i = 0; i < reservationList.size(); i++) {
				houseName = mpService.selectHouseName(reservationList.get(i).getHouseNo());
				houseNameList.add(houseName);
			}

			model.addAttribute("member", member);
			model.addAttribute("TotalReservation", TotalReservation);
			model.addAttribute("reservationPageList", reservationPageList);
			model.addAttribute("houseNameList", houseNameList);
			model.addAttribute("TotalReview", TotalReview);
			model.addAttribute("reviewList", reviewList);
		}

		return "myPage/myPage";
	}

	@RequestMapping("myReview")
	public String myReview(HttpSession session, Model model, String pageNum) {
		if (session.getAttribute("memberId") != null) {
			int memberNo = (Integer) session.getAttribute("memberNo");
			String memberId = (String) session.getAttribute("memberId");
			Member member = mpService.selectMember(memberId);

			List<Integer> payNoList = mpService.payNoList(memberNo);
			List<Reservation> reservationTempList = mpService.reservationTemp(memberNo);

			int[] count = new int[payNoList.size()];

			for (int j = 0; j < reservationTempList.size(); j++) {
				for (int k = 0; k < payNoList.size(); k++) {
					if (reservationTempList.get(j).getPayNo() == payNoList.get(k)) {
						if (count[k] > 0) {
							reservationTempList.remove(j);
							break;
						}

						count[k]++;
					}
				}
			}

			int TotalReservation = reservationTempList.size();
			int TotalReview = mpService.getTotalReview(memberNo);

			final int ROW_PER_PAGE = 4;
			final int PAGE_PER_BLOCK = 4;

			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}

			int currentPage = Integer.parseInt(pageNum); // 현재 페이지
			int total = TotalReview; // 총 게시글 수
			int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수
			int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
			int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)
			int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
			int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지

			if (endPage > totalPage) {
				endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
			}

			List<Review> reviewPageList = mpService.reviewPageList(memberNo, startRow, endRow);

			String houseName = "";
			List<String> houseNameList = new ArrayList<String>();

			int houseNo = 0;
			List<Integer> houseNoList = new ArrayList<Integer>();

			for (int i = 0; i < reviewPageList.size(); i++) {
				houseName = mpService.selectHouseName2(reviewPageList.get(i).getPayNo());
				houseNameList.add(houseName);
				houseNo = mpService.selectHouseNo2(reviewPageList.get(i).getPayNo());
				houseNoList.add(houseNo);
			}

			model.addAttribute("member", member);
			model.addAttribute("reviewPageList", reviewPageList);
			model.addAttribute("houseNameList", houseNameList);
			model.addAttribute("houseNoList", houseNoList);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("total", total);
			model.addAttribute("TotalReview", TotalReview);
			model.addAttribute("TotalReservation", TotalReservation);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		}

		return "myPage/myReview";
	}

	@RequestMapping("myReservation")
	public String myReservation(HttpSession session, Model model, String pageNum) {
		if (session.getAttribute("memberId") != null) {
			int memberNo = (Integer) session.getAttribute("memberNo");
			String memberId = (String) session.getAttribute("memberId");
			Member member = mpService.selectMember(memberId);

			List<Integer> payNoList = mpService.payNoList(memberNo);
			List<Reservation> reservationTempList = mpService.reservationTemp(memberNo);

			int[] count = new int[payNoList.size()];

			for (int j = 0; j < reservationTempList.size(); j++) {
				for (int k = 0; k < payNoList.size(); k++) {
					if (reservationTempList.get(j).getPayNo() == payNoList.get(k)) {
						if (count[k] > 0) {
							reservationTempList.remove(j);
							break;
						}

						count[k]++;
					}
				}
			}

			List<Reservation> reservationPageList = new ArrayList<Reservation>();

			int TotalReservation = reservationTempList.size();
			int TotalReview = mpService.getTotalReview(memberNo);
			final int ROW_PER_PAGE = 4; // 한 페이지에 게시글 6개 씩
			final int PAGE_PER_BLOCK = 4; // 한 블럭에 5페이지 씩
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
				}
			int currentPage = Integer.parseInt(pageNum); // 현재 페이지
			int total = TotalReservation; // 총 게시글 수
			int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수
			int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
			int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)
			int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
			int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지
			if (endPage > totalPage) {
				endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
			}
			for (int i = startRow; i <= endRow; i++) {
				if (i <= reservationTempList.size()) {
					reservationPageList.add(reservationTempList.get(i - 1));
				}
			}
			String houseName = "";
			List<String> houseNameList = new ArrayList<String>();
			for (int i = 0; i < reservationPageList.size(); i++) {
				houseName = mpService.selectHouseName(reservationPageList.get(i).getHouseNo());
				houseNameList.add(houseName);
			}
			model.addAttribute("member", member);
			model.addAttribute("reservationPageList", reservationPageList);
			model.addAttribute("houseNameList", houseNameList);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("total", total);
			model.addAttribute("TotalReservation", TotalReservation);
			model.addAttribute("TotalReview", TotalReview);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		}
		return "myPage/myReservation";
	}

	@RequestMapping("reviewForm")
	public String reviewForm(Model model, HttpSession session) {
		int memberNo = (Integer) session.getAttribute("memberNo");
		String memberId = (String) session.getAttribute("memberId");
		List<Integer> payNoList = mpService.payNoList(memberNo);
		List<Reservation> reservationTempList = mpService.reservationTemp(memberNo);
		int[] count = new int[payNoList.size()];
		for (int j = 0; j < reservationTempList.size(); j++) {
			for (int k = 0; k < payNoList.size(); k++) {
				if (reservationTempList.get(j).getPayNo() == payNoList.get(k)) {
					if (count[k] > 0) {
						reservationTempList.remove(j);
						break;
					}
					count[k]++;
				}
			}
		}
		List<Integer> reviewChk = new ArrayList<Integer>();
		List<Integer> payNoTempList = new ArrayList<Integer>();
		for (int k = 0; k < reservationTempList.size(); k++) {
			int tempPayNo = reservationTempList.get(k).getPayNo();
			payNoTempList.add(tempPayNo);
		}
		for (int i = 0; i < payNoTempList.size(); i++) {
			int result = mpService.reviewChk(payNoTempList.get(i), memberNo);
			reviewChk.add(result);
		}
		List<String> houseNameTempList = new ArrayList<String>();
		List<String> payDateTempList = new ArrayList<String>();
		for (int j = 0; j < payNoTempList.size(); j++) {
			String houseName = mpService.getHouseNameTemp(payNoTempList.get(j));
			houseNameTempList.add(houseName);

			String payDate = mpService.getPayDateTemp(payNoList.get(j));
			payDateTempList.add(payDate);
		}
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("memberId", memberId);
		model.addAttribute("payNoTempList", payNoTempList);
		model.addAttribute("reviewChk", reviewChk);
		model.addAttribute("houseNameTempList", houseNameTempList);
		model.addAttribute("payDateTempList", payDateTempList);
		return "myPage/reviewForm";
	}

	@RequestMapping("reviewWrite")
	public String reviewWrite(Model model, HttpSession session, String payNo, String reviewSubject,
			String reviewContent, String reviewScore) {
		int memberNo = (Integer) session.getAttribute("memberNo");
		String memberId = (String) session.getAttribute("memberId");

		int reviewNo = mpService.createReviewNo();
		int i_payNo = Integer.parseInt(payNo);
		int ChkResult = mpService.reviewChk(i_payNo, memberNo);
		int result = 0;
		int houseNo = mpService.selectHouseNo2(i_payNo);

		String s_houseNo = String.valueOf(houseNo);
		String s_reviewNo = String.valueOf(reviewNo);

		if (ChkResult == 0) {
			result = mpService.reviewWrite(s_reviewNo, payNo, s_houseNo, reviewSubject, reviewContent, reviewScore);
		} else if (ChkResult == 1) {
			result = 0;
		} else {
			result = -1;
		}
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("memberId", memberId);
		model.addAttribute("result", result);

		return "myPage/reviewWrite";
	}

	@RequestMapping("reservationContent")
	public String reservationContent(HttpSession session, Model model, int resNo) {
		if (session.getAttribute("memberId") != null) {
			int memberNo = (Integer) session.getAttribute("memberNo");
			String memberId = (String) session.getAttribute("memberId");
			String memberName = mpService.RCmemberName(resNo);
			String houseName = mpService.RChouseName(resNo);
			String houseAddr = mpService.RChouseAddr(resNo);
			int payNo = mpService.findPayNo(resNo);
			List<Reservation> samePayNoList = mpService.samePayNoList(payNo);
			List<String> roomNameList = new ArrayList<String>();
			for (int i = 0; i < samePayNoList.size(); i++) {
				roomNameList.add(mpService.getRoomName(samePayNoList.get(i).getResNo()));
			}
			Reservation Res = mpService.selectReservation(resNo);
			model.addAttribute("memberName", memberName);
			model.addAttribute("houseName", houseName);
			model.addAttribute("houseAddr", houseAddr);
			model.addAttribute("Res", Res);
			model.addAttribute("roomNameList", roomNameList);
			model.addAttribute("memberId", memberId);
			model.addAttribute("memberNo", memberNo);
		}
		return "myPage/reservationContent";
	}

	@RequestMapping("reviewContent")
	public String reviewContent(HttpSession session, Model model, int reviewNo) {
		int memberNo = (Integer) session.getAttribute("memberNo");
		String memberId = (String) session.getAttribute("memberId");
		Review review = mpService.selectReview(reviewNo);
		int houseNo = mpService.selectHouseNo3(reviewNo);
		String memberName = mpService.selectMemberName(reviewNo);
		model.addAttribute("review", review);
		model.addAttribute("houseNo", houseNo);
		model.addAttribute("memberName", memberName);
		model.addAttribute("memberId", memberId);
		model.addAttribute("memberNo", memberNo);

		return "myPage/reviewContent";
	}

	@RequestMapping("reviewUpdateForm")
	public String reviewUpdateForm(Model model, HttpSession session) {
		String s_memberNo = String.valueOf(session.getAttribute("memberNo"));
	      int memberNo = Integer.parseInt(s_memberNo);
	      String memberId = (String) session.getAttribute("memberId");	      
	      List<Integer> payNoList = mpService.payNoList(memberNo);
	      List<Integer> reviewChk = new ArrayList<Integer>();
	      int RCB = 0;	      
	      for(int i=0 ; i<payNoList.size() ; i++)
	      {
	         int result = mpService.reviewChk(payNoList.get(i), memberNo);
	         reviewChk.add(result);
	      }	      
	      for(int j=0 ; j<reviewChk.size() ; j++)
	      {
	         if(reviewChk.get(j) == 1)
	         {
	            RCB = 1;
	         }
	      }	      
	      List<String> houseNameTempList = new ArrayList<String>();
	      List<String> payDateTempList = new ArrayList<String>();	      
	      for(int j=0; j<payNoList.size() ; j++)  {
	         String houseName = mpService.getHouseNameTemp(payNoList.get(j));
	         houseNameTempList.add(houseName);	         
	         String payDate = mpService.getPayDateTemp(payNoList.get(j));
	         payDateTempList.add(payDate);
	      }
	      model.addAttribute("memberNo", memberNo);
	      model.addAttribute("memberId", memberId);
	      model.addAttribute("payNoList", payNoList);
	      model.addAttribute("reviewChk", reviewChk);
	      model.addAttribute("houseNameTempList", houseNameTempList);
	      model.addAttribute("payDateTempList", payDateTempList);
	      model.addAttribute("RCB", RCB);	         
	      return "myPage/reviewUpdateForm";      
	}

	@RequestMapping("reviewUpdate")
	public String reviewUpdate(Model model, HttpSession session, String payNo, String reviewSubject,
			String reviewContent, String reviewScore) {
		String s_memberNo = String.valueOf(session.getAttribute("memberNo"));
		int memberNo = Integer.parseInt(s_memberNo);
		String memberId = (String) session.getAttribute("memberId");

		int reviewNo = mpService.selectReviewNo(payNo);
		int i_payNo = Integer.parseInt(payNo);
		int result = 0;
		String s_reviewNo = String.valueOf(reviewNo);
		int houseNo = mpService.selectHouseNo2(i_payNo);
		String s_houseNo = String.valueOf(houseNo);

		result = mpService.reviewUpdate(s_reviewNo, payNo, s_houseNo, reviewSubject, reviewContent, reviewScore);

		model.addAttribute("memberNo", memberNo);
		model.addAttribute("memberId", memberId);
		model.addAttribute("result", result);

		return "myPage/reviewUpdate";
	}

	@RequestMapping("reviewDelete")
	public String reviewDelete(Model model, HttpSession session, int reviewNo) {
		int memberNo = (Integer) session.getAttribute("memberNo");
		String memberId = (String) session.getAttribute("memberId");

		int result = mpService.reviewDelete(reviewNo);

		model.addAttribute("memberNo", memberNo);
		model.addAttribute("memberId", memberId);
		model.addAttribute("result", result);

		return "myPage/reviewDelete";
	}

}
