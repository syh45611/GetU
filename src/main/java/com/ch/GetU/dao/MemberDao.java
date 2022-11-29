package com.ch.GetU.dao;

import java.util.HashMap;
import java.util.List;

import com.ch.GetU.model.Member;

public interface MemberDao {

	int insert(Member member);

	int getMaxNum();

	Member selectId(String memberId);

	Member selectEmail(String memberEmail);

	Member findId(HashMap<String, String> hm);

	Member findPassword(HashMap<String, String> hm);

	int update(Member member);

	int updatePw(Member member);

	int getTotal(Member member);

	List<Member> list(HashMap<String, Integer> hm2);

	int delete(int memberNo);

	List<Member> searchMember(HashMap<String, String> hm3);

	Member selectNo(int memberNo);

	int kakaoSelect(String account_email);

	int kakaoInsert(Member member);

	int chkHouse(int memberNo);

}
