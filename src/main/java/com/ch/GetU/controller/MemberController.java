package com.ch.GetU.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ch.GetU.model.Member;
import com.ch.GetU.service.MemberService;
@Controller
public class MemberController {
	@Autowired
	private BCryptPasswordEncoder bpe; // 비밀번호를 암호화
	@Autowired
	private MemberService ms;
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
	@RequestMapping("loginForm2")
	   public String loginForm2() {
	      return "/member/loginForm2";
	   }
	@RequestMapping("joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	@RequestMapping("confirmId")
	public String confirmId(String memberId, Model model) {		
		String msg="";		
		Member member = ms.selectId(memberId);
		if(member==null) msg="사용가능한 ID 입니다";
		else msg = "이미 사용중인 ID 입니다.";
		model.addAttribute("msg", msg);
			return "/member/confirmId";
	}
	@RequestMapping("confirmEmail")
	public String confirmeEmail(String memberEmail, Model model) {		
		String msg="";		
		Member member = ms.selectEmail(memberEmail);
		if(member==null) msg="사용가능한 이메일 입니다";
		else msg = "이미 사용중인 이메일 입니다.";
		model.addAttribute("msg", msg);
			return "/member/confirmEmail";
	}
	@RequestMapping("join")
	public String join(Member member, Model model){
		int number = ms.getMaxNum();
		member.setMemberNo(number);		
		String encPass = bpe.encode(member.getMemberPass()); // 비밀번호 암호화
		member.setMemberPass(encPass);
		int result = ms.insert(member);
		model.addAttribute("result", result);
		return "/member/join";
	}
	@RequestMapping("loginResult")
	public String loginResult(Member member, String memberId, String memberPass, Model model, HttpSession session) {
			Member member2 = ms.selectId(memberId);			
			int result = 0;
			if(member2 == null || member2.getMemberDel().equals("y"))
				result=-1;
			else {		
				if (bpe.matches(member.getMemberPass(), member2.getMemberPass())) {				
					session.setAttribute("memberId", memberId);		
					session.setAttribute("memberNo", member2.getMemberNo());	
					result = 1;
				}
				else result=0;
			}
			if(result == 1) {
				member.setMemberNo(member2.getMemberNo());
			}
			model.addAttribute("member", member);
			model.addAttribute("result", result);
			return "/member/loginResult";
		}
	@RequestMapping("loginResult2")
	   public String loginResult2(Member member, String memberId, String memberPass, Model model, HttpSession session) {
	         Member member2 = ms.selectId(memberId);   
	         int result = 0;
	            int result2 = ms.chkHouse(member2.getMemberNo());
	            int memberNo = 0;   
	           if(member2==null||member2.getMemberDel().equals("y"))
	                  result = -1;
	               else {
	                  if(member2.getMemberPass().equals(memberPass)) {
	                      memberNo = member2.getMemberNo();
	                     result = 1;
	                  }else result=0;
	               }	       
	         model.addAttribute("result2", result2);
	         model.addAttribute("memberNo", member2.getMemberNo());
	         model.addAttribute("result", result);
	         return "/member/loginResult2";
	         }
	@RequestMapping("kakaoLoginResult")
	   public String kakaoLogin(Member member, Model model, HttpSession session, String account_email, String memberId) {
			int result2 = ms.kakaoSelect(account_email);
				Integer number = ms.getMaxNum();	      		
				if(result2 < 1) {  
				Member member2 = new Member();	         		
				member2.setMemberNo(number);
	      		member2.setMemberEmail(account_email);
	      	    member2.setMemberId(memberId);	
		      	 int result = ms.kakaoInsert(member2);	      	
		         session.setAttribute("email", member.getAccount_email());
		         session.setAttribute("memberId", memberId);
		         session.setAttribute("memberNo", number);
		         model.addAttribute("result", result);
		         return "/member/kakaoLoginResult";	    
			} else {
				number -= 1;
				session.setAttribute("email", member.getAccount_email());
		        session.setAttribute("memberId", memberId);		        
		        session.setAttribute("memberNo", number);
		        int result = 1;
		        model.addAttribute("result", result);
		        return "/member/kakaoLoginResult";	
			}
	   }
	@RequestMapping("logout")
		public String logout(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session = request.getSession();
			session.invalidate();
			return "/member/logout";
		}
	@RequestMapping("findForm")
	public String findForm() {
		return "/member/findForm";
	}
	@RequestMapping("findIdResult")
	public String findIdResult(String memberName, String memberEmail, Model model) {
		Member member = ms.findId(memberName, memberEmail);				
		model.addAttribute("member", member);
		return "/member/findIdResult";
	}
	@RequestMapping("findPwResult")
	public String findPwResult(Member member, String memberId, String memberName, Model model) {
		Member member2 = ms.findPassword(memberId, memberName);			
			//난수 생성
			String msg = "";
			String code = "";
			Random random = new Random();
			for(int i = 0; i<4; i++) {
				int index = random.nextInt(25)+65;	// A~Z까지 랜덤 알파벳 생성
				code += (char)index;
			}
			int numIndex = random.nextInt(9999)+1000;	// 4가지 랜덤 정수 생성
			code += numIndex;
			msg = (String)code;	
			model.addAttribute("msg", msg);
			String encPass = bpe.encode(msg); 	// 비밀번호 암호화
			member.setMemberPass(encPass);
			int resultUpdatePw = ms.updatePw(member);
			model.addAttribute("resultUpdatePw", resultUpdatePw);
			model.addAttribute("member", member);			
		return "/member/findPwResult";		
	}
	@RequestMapping("updateForm")
	public String updateForm(String memberId, Model model) {
		Member member = new Member();		
		member = ms.selectId(memberId);			
		model.addAttribute("member", member);		
		return "/member/updateForm";
	}
	@RequestMapping("updateResult")
	public String updateResult(Member member, Model model) {
		String encPass = bpe.encode(member.getMemberPass()); // 비밀번호 암호화
		member.setMemberPass(encPass);
		int result = ms.update(member);		
		model.addAttribute("result", result);
		model.addAttribute("member", member);
		return "/member/updateResult";
	}
	@RequestMapping("delete")
	public String delete(int memberNo, String memberId, Model model) {
		int result = ms.delete(memberNo);
		System.out.println(memberId);
		model.addAttribute("memberId", memberId);
		model.addAttribute("result", result);
		return "/member/delete";
	}
	@RequestMapping("naverChk")
	public String naverChk() {
		return "/member/naverChk";
	}
}
