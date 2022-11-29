package com.ch.GetU.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.GetU.model.Member;
import com.ch.GetU.model.Reservation;
import com.ch.GetU.model.Review;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Member selectMember(String memberId) {
		return sst.selectOne("memberns.selectMember", memberId);
	}

	@Override
	public int getTotalReservation(int memberNo) {
		return sst.selectOne("reservationns.getTotalReservation", memberNo);
	}

	@Override
	public List<Reservation> reservationList(int memberNo) {
		return sst.selectList("reservationns.reservationList", memberNo);
	}

	@Override
	public int getTotalReview(int memberNo) {
		return sst.selectOne("reviewns.getTotalReview", memberNo);
	}

	@Override
	public List<Review> reviewList(int memberNo) {
		return sst.selectList("reviewns.reviewList", memberNo);
	}

	@Override
	public List<Review> reviewPageList(int memberNo, int startRow, int endRow) {
		HashMap<String, Integer> rplm = new HashMap<String, Integer>();
		rplm.put("memberNo", memberNo);
		rplm.put("startRow", startRow);
		rplm.put("endRow", endRow);
		return sst.selectList("reviewns.reviewPageList", rplm);
	}

	@Override
	public List<Reservation> reservationPageList(int memberNo, int startRow, int endRow) {
		HashMap<String, Integer> rplm = new HashMap<String, Integer>();
		rplm.put("memberNo", memberNo);
		rplm.put("startRow", startRow);
		rplm.put("endRow", endRow);
		return sst.selectList("reservationns.reservationPageList", rplm);
	}

	@Override
	public String selectHouseName(int houseNo) {
		return sst.selectOne("housens.selectHouseName", houseNo);
	}

	@Override
	public String selectHouseName2(int payNo) {
		return sst.selectOne("payns.selectHouseName2", payNo);
	}

	@Override
	public List<Integer> payNoList(int memberNo) {
		return sst.selectList("payns.payNoList", memberNo);
	}

	@Override
	public int reviewChk(int payNo, int memberNo) {
		HashMap<String, Integer> rcm = new HashMap<String, Integer>();
		rcm.put("payNo", payNo);
		rcm.put("memberNo", memberNo);
		return sst.selectOne("reviewns.reviewChk", rcm);
	}

	@Override
	public int reviewWrite(String s_reviewNo, String payNo, String s_houseNo, String reviewSubject,
						String reviewContent, String reviewScore) {
		HashMap<String, String> rwm = new HashMap<String, String>();
		rwm.put("s_reviewNo", s_reviewNo);
		rwm.put("payNo", payNo);
		rwm.put("s_houseNo", s_houseNo);
		rwm.put("reviewSubject", reviewSubject);
		rwm.put("reviewContent", reviewContent);
		rwm.put("reviewScore", reviewScore);
		return sst.insert("reviewns.reviewWrite", rwm);
	}

	@Override
	public int createReviewNo() {
		return sst.selectOne("reviewns.createReviewNo");
	}

	@Override
	public int selectHouseNo2(int payNo) {
		return sst.selectOne("payns.selectHouseNo2", payNo);
	}

	@Override
	public String RCmemberName(int resNo) {
		return sst.selectOne("reservationns.RCmemberName", resNo);
	}

	@Override
	public String RChouseName(int resNo) {
		return sst.selectOne("reservationns.RChouseName", resNo);
	}

	@Override
	public String RChouseAddr(int resNo) {
		return sst.selectOne("reservationns.RChouseAddr", resNo);
	}

	@Override
	public Reservation selectReservation(int resNo) {
		return sst.selectOne("reservationns.selectReservation", resNo);
	}

	@Override
	public Review selectReview(int reviewNo) {
		return sst.selectOne("reviewns.selectReview", reviewNo);
	}

	@Override
	public int selectHouseNo3(int reviewNo) {
		return sst.selectOne("reviewns.selectHouseNo3", reviewNo);
	}

	@Override
	public String selectMemberName(int reviewNo) {
		return sst.selectOne("memberns.selectMemberName", reviewNo);
	}

	@Override
	public int reviewUpdate(String s_reviewNo, String payNo, String s_houseNo, String reviewSubject,
			String reviewContent, String reviewScore) {
		HashMap<String, String> rum = new HashMap<String, String>();
		rum.put("s_reviewNo", s_reviewNo);
		rum.put("payNo", payNo);
		rum.put("s_houseNo", s_houseNo);
		rum.put("reviewSubject", reviewSubject);
		rum.put("reviewContent", reviewContent);
		rum.put("reviewScore", reviewScore);
		return sst.update("reviewns.reviewUpdate", rum);
	}

	@Override
	public int selectReviewNo(String payNo) {
		return sst.selectOne("reviewns.selectReviewNo", payNo);
	}

	@Override
	public List<Reservation> reservationTemp(int memberNo) {
		return sst.selectList("reservationns.reservationTemp", memberNo);
	}

	@Override
	public int reviewDelete(int reviewNo) {
		return sst.update("reviewns.reviewDelete", reviewNo);
	}

	@Override
	public int findPayNo(int resNo) {
		return sst.selectOne("reservationns.findPayNo", resNo);
	}

	@Override
	public List<Reservation> samePayNoList(int payNo) {
		return sst.selectList("reservationns.samePayNoList", payNo);
	}

	@Override
	public String getRoomName(int resNo) {
		return sst.selectOne("reservationns.getRoomName", resNo);
	}

	@Override
	public String getRoomNameTemp(int payNo) {
		return sst.selectOne("payns.getRoomNameTemp", payNo);
	}

	@Override
	public String getHouseNameTemp(int payNo) {
		return sst.selectOne("payns.getHouseNameTemp", payNo);
	}
	@Override
	   public String getPayDateTemp(int payNo)  {
	      return sst.selectOne("payns.getPayDateTemp", payNo);
	}
}