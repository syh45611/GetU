package com.ch.GetU.dao;

import java.util.List;

import com.ch.GetU.model.Member;
import com.ch.GetU.model.Reservation;
import com.ch.GetU.model.Review;

public interface MyPageDao 
{
	Member selectMember(String memberId);

	int getTotalReservation(int memberNo);

	List<Reservation> reservationList(int memberNo);

	int getTotalReview(int memberNo);

	List<Review> reviewList(int memberNo);

	List<Review> reviewPageList(int memberNo, int startRow, int endRow);

	List<Reservation> reservationPageList(int memberNo, int startRow, int endRow);

	String selectHouseName(int houseNo);

	String selectHouseName2(int payNo);

	List<Integer> payNoList(int memberNo);

	int reviewChk(int payNo, int memberNo);

	int reviewWrite(String s_reviewNo, String payNo, String s_houseNo, String reviewSubject, String reviewContent, String reviewScore);

	int createReviewNo();

	int selectHouseNo2(int payNo);

	String RCmemberName(int resNo);

	String RChouseName(int resNo);

	String RChouseAddr(int resNo);

	Reservation selectReservation(int resNo);

	Review selectReview(int reviewNo);

	int selectHouseNo3(int reviewNo);

	String selectMemberName(int reviewNo);

	int reviewUpdate(String s_reviewNo, String payNo, String s_houseNo, String reviewSubject, String reviewContent, String reviewScore);

	int selectReviewNo(String payNo);

	List<Reservation> reservationTemp(int memberNo);

	int reviewDelete(int reviewNo);

	int findPayNo(int resNo);

	List<Reservation> samePayNoList(int payNo);

	String getRoomName(int resNo);

	String getRoomNameTemp(int payNo);

	String getHouseNameTemp(int payNo);
	
	String getPayDateTemp(int payNo);
}
