package com.ch.GetU.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ch.GetU.model.Member;
@Service
public interface MemberService {

	int insert(Member member);

	int getMaxNum();

	Member selectId(String memberId);

	Member selectEmail(String memberEmail);

	Member findId(String memberName, String memberEmail);

	Member findPassword(String memberId, String memberName);

	int updatePw(Member member);

	int update(Member member);

	int getTotal(Member member);

	List<Member> list(int startRow, int endRow);

	int delete(int memberNo);

	List<Member> searchMember(String searchKey, String searchValue);

	Member selectNo(int memberNo);

	int kakaoSelect(String account_email); 

	int kakaoInsert(Member member);

	int chkHouse(int memberNo);	
	

}
