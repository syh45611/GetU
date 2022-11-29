package com.ch.GetU.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.GetU.dao.MyPageDao;
import com.ch.GetU.model.Member;
import com.ch.GetU.model.Reservation;
import com.ch.GetU.model.Review;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDao mpDao;

	@Override
	public Member selectMember(String memberId) {
		return mpDao.selectMember(memberId);
	}

	@Override
	public int getTotalReservation(int memberNo) {
		return mpDao.getTotalReservation(memberNo);
	}

	@Override
	public List<Reservation> reservationList(int memberNo) {
		return mpDao.reservationList(memberNo);
	}

	@Override
	public int getTotalReview(int memberNo) {
		return mpDao.getTotalReview(memberNo);
	}

	@Override
	public List<Review> reviewList(int memberNo) {
		return mpDao.reviewList(memberNo);
	}

	@Override
	public List<Review> reviewPageList(int memberNo, int startRow, int endRow) {
		return mpDao.reviewPageList(memberNo, startRow, endRow);
	}

	@Override
	public List<Reservation> reservationPageList(int memberNo, int startRow, int endRow) {
		return mpDao.reservationPageList(memberNo, startRow, endRow);
	}

	@Override
	public String selectHouseName(int houseNo) {
		return mpDao.selectHouseName(houseNo);
	}

	@Override
	public String selectHouseName2(int payNo) {
		return mpDao.selectHouseName2(payNo);
	}

	@Override
	public List<Integer> payNoList(int memberNo) {
		return mpDao.payNoList(memberNo);
	}

	@Override
	public int reviewChk(int payNo, int memberNo) {
		return mpDao.reviewChk(payNo, memberNo);
	}

	@Override
	public int reviewWrite(String s_reviewNo, String payNo, String s_houseNo, String reviewSubject,
			String reviewContent, String reviewScore) {
		return mpDao.reviewWrite(s_reviewNo, payNo, s_houseNo, reviewSubject, reviewContent, reviewScore);
	}

	@Override
	public int createReviewNo() {
		return mpDao.createReviewNo();
	}

	@Override
	public int selectHouseNo2(int payNo) {
		return mpDao.selectHouseNo2(payNo);
	}

	@Override
	public String RCmemberName(int resNo) {
		return mpDao.RCmemberName(resNo);
	}

	@Override
	public String RChouseName(int resNo) {
		return mpDao.RChouseName(resNo);
	}

	@Override
	public String RChouseAddr(int resNo) {
		return mpDao.RChouseAddr(resNo);
	}

	@Override
	public Reservation selectReservation(int resNo) {
		return mpDao.selectReservation(resNo);
	}

	@Override
	public Review selectReview(int reviewNo) {
		return mpDao.selectReview(reviewNo);
	}

	@Override
	public int selectHouseNo3(int reviewNo) {
		return mpDao.selectHouseNo3(reviewNo);
	}

	@Override
	public String selectMemberName(int reviewNo) {
		return mpDao.selectMemberName(reviewNo);
	}

	@Override
	public int reviewUpdate(String s_reviewNo, String payNo, String s_houseNo, String reviewSubject,
			String reviewContent, String reviewScore) {
		return mpDao.reviewUpdate(s_reviewNo, payNo, s_houseNo, reviewSubject, reviewContent, reviewScore);
	}

	@Override
	public int selectReviewNo(String payNo) {
		return mpDao.selectReviewNo(payNo);
	}

	@Override
	public List<Reservation> reservationTemp(int memberNo) {
		return mpDao.reservationTemp(memberNo);
	}

	@Override
	public int reviewDelete(int reviewNo) {
		return mpDao.reviewDelete(reviewNo);
	}

	@Override
	public int findPayNo(int resNo) {
		return mpDao.findPayNo(resNo);
	}

	@Override
	public List<Reservation> samePayNoList(int payNo) {
		return mpDao.samePayNoList(payNo);
	}

	@Override
	public String getRoomName(int resNo) {
		return mpDao.getRoomName(resNo);
	}

	@Override
	public String getHouseNameTemp(int payNo) {
		return mpDao.getHouseNameTemp(payNo);
	}

	@Override
	public String getRoomNameTemp(int payNo) {
		return mpDao.getRoomNameTemp(payNo);
	}

	@Override
	public String getPayDateTemp(int payNo) {
		return mpDao.getPayDateTemp(payNo);
	}
}