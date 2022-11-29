package com.ch.GetU.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.GetU.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sst;

	public int insert(Member member) {
		return sst.insert("memberns.insert", member);			
	}
	public int getMaxNum() {
		return sst.selectOne("memberns.getMaxNum");
	}
	public Member selectId(String memberId) {		
		return sst.selectOne("memberns.selectId", memberId);
	}
	public Member selectEmail(String memberEmail) {		
		return sst.selectOne("memberns.selectEmail", memberEmail);
	}
	public Member findId(HashMap<String, String> hm) {
		return (Member) sst.selectOne("memberns.findId", hm);
	}
	public Member findPassword(HashMap<String, String> hm) {
		return (Member) sst.selectOne("memberns.findPassword", hm);
	}
	public int update(Member member) {
		return sst.update("memberns.update", member);
	}
	public int updatePw(Member member) {
		return sst.update("memberns.updatePw", member);
	}
	public int getTotal(Member member) {
		return sst.selectOne("memberns.getTotal", member);
	}
	public List<Member> list(HashMap<String, Integer> hm2) {
		return sst.selectList("memberns.list", hm2);
	}
	public int delete(int memberNo) {
		return sst.update("memberns.delete", memberNo);
	}
	public List<Member> searchMember(HashMap<String, String> hm3) {
		return sst.selectList("memberns.searchMember", hm3);		
	}
	public Member selectNo(int memberNo) {
		return sst.selectOne("memberns.selectNo", memberNo);
	}
	public int kakaoSelect(String account_email) {
		return sst.selectOne("memberns.kakaoSelect", account_email);
	}
	public int kakaoInsert(Member member) {
		return sst.insert("memberns.kakaoInsert", member);
	}
	public int chkHouse(int memberNo) {
		return sst.selectOne("housens.chkHouse", memberNo);
	}
	
}
