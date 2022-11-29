package com.ch.GetU.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.GetU.model.Member;
import com.ch.GetU.model.Notice;
import com.ch.GetU.model.QnA;
import com.ch.GetU.service.MemberService;
import com.ch.GetU.service.NoticeService;
import com.ch.GetU.service.PagingBean;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
	@Autowired
	private MemberService ms;

	@RequestMapping("noticeList")	// 비회원 접근 로직 구현x
	public String noticeList(Model model, Notice notice, String pageNum, HttpSession session) {
		// 처음 notice에는 null로 받아오고, startRow, endRow 보내주기 위한 용도
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
		int total = ns.getNtTotal(notice);
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		notice.setStartRow(startRow);
		notice.setEndRow(endRow);		
		List<Notice> noticeList = ns.noticeList(notice);	// 공지사항 목록
		int num = total - startRow + 1;		// 번호 순서대로 정렬
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"제목", "내용", "제목+내용"};	// 작성자는 관리자뿐이므로 제외
		String memberId = (String)session.getAttribute("memberId");
		int memberNo = (Integer)session.getAttribute("memberNo");
		Member memberDB = ms.selectId(memberId);
		model.addAttribute("memberNo", memberNo);	
		model.addAttribute("memberDB", memberDB);	// 아이디로 DB에 있는 회원정보 조회
		model.addAttribute("memberId", memberId);
		model.addAttribute("notice", notice);
		model.addAttribute("title", title);	// 검색 기능
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("noticeList", noticeList);		// 공지사항 검색 시 공지사항번호 발생
		model.addAttribute("num", num);	// 목록 번호 생성 위한 num
		return "notice/noticeList";
	}
	@RequestMapping("noticeView")
	public String noticeView(int NT_num, String pageNum, Model model,  HttpSession session) {
		Notice notice = ns.select(NT_num);
		String memberId = (String)session.getAttribute("memberId");
		Member memberDB = ms.selectId(memberId);
		model.addAttribute("memberDB", memberDB);
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		return "notice/noticeView";
	}

}
