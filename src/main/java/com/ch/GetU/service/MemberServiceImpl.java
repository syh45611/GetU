package com.ch.GetU.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.GetU.dao.MemberDao;
import com.ch.GetU.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;

	public int insert(Member member) {
		return md.insert(member);
	}

	public int getMaxNum() {
		return md.getMaxNum();
	}

	public Member selectId(String memberId) {
		return md.selectId(memberId);
	}

	public Member selectEmail(String memberEmail) {
		return md.selectEmail(memberEmail);
	}

	public Member findId(String memberName, String memberEmail) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("memberName", memberName);
		hm.put("memberEmail", memberEmail);
		return md.findId(hm);
	}

	public Member findPassword(String memberId, String memberName) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("memberId", memberId);
		hm.put("memberName", memberName);
		return md.findPassword(hm);
	}

	public int update(Member member) {
		return md.update(member);
	}

	public int updatePw(Member member) {
		return md.updatePw(member);
	}

	public int getTotal(Member member) {
		return md.getTotal(member);
	}

	public List<Member> list(int startRow, int endRow) {
		HashMap<String, Integer> hm2 = new HashMap<String, Integer>();
		hm2.put("startRow", startRow);
		hm2.put("endRow", endRow);
		return md.list(hm2);
	}

	public int delete(int memberNo) {
		return md.delete(memberNo);
	}

	public List<Member> searchMember(String searchKey, String searchValue) {
		HashMap<String, String> hm3 = new HashMap<String, String>();
		hm3.put("searchKey", searchKey);
		hm3.put("searchValue", searchValue);
		return md.searchMember(hm3);
	}

	public Member selectNo(int memberNo) {
		return md.selectNo(memberNo);
	}

	public int kakaoSelect(String account_email) {
		return md.kakaoSelect(account_email);
	}

	public int kakaoInsert(Member member) {
		return md.kakaoInsert(member);
	}

	public int chkHouse(int memberNo) {
		return md.chkHouse(memberNo);
	}

}
