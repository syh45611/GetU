package com.ch.GetU.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import com.ch.GetU.service.QnAService;


@Controller
public class AdminController {	
	@Autowired
	private MemberService ms;
	@Autowired
	private NoticeService ns;
	@Autowired
	private QnAService qas;
	
	@RequestMapping("adminMain")
	public String adminMain(String memberId, Model model) {
		Member member = new Member();		
		member = ms.selectId(memberId);		
		model.addAttribute("member", member);	
		return "/admin/adminMain";
	}
	@RequestMapping("adminMember")
	public String adminMember(String pageNum, Member member, Model model) {
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_BLOCK = 10;
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)* ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		int total = ms.getTotal(member);
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE);
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		if (endPage > totalPage) endPage = totalPage;
		List<Member> list = ms.list(startRow, endRow);		
		model.addAttribute("list", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		model.addAttribute("member", member);
		return "/admin/adminMember";
	}
	@RequestMapping("adminFindMember")
	public String adminFindMember(String pageNum, Member member, String searchKey, String searchValue, Model model) {
		List<Member> list2 = ms.searchMember(searchKey, searchValue);
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_BLOCK = 10;
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)* ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		int total = ms.getTotal(member);
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE);
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		if (endPage > totalPage) endPage = totalPage;
		List<Member> list = ms.list(startRow, endRow);	
		member.setMemberId("admin");
		model.addAttribute("list", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		model.addAttribute("member", member);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("list2",list2);		
		return "/admin/adminFindMember";
	}
	@RequestMapping("adminNoticeList")
	public String adminNoticeList(Member member, Model model, Notice notice, HttpSession session, String pageNum) {
		// ?????? notice?????? null??? ????????????, startRow, endRow ???????????? ?????? ??????
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// ??? ????????? ???????????? ????????? ??????
		int total = ns.getNtTotal(notice);
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		notice.setStartRow(startRow);
		notice.setEndRow(endRow);
		List<Notice> noticeAllList = ns.noticeAllList(notice);	// ???????????? ??????
		int num = total - startRow + 1;		// ?????? ???????????? ??????
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"??????", "??????", "??????+??????"};	// ???????????? ????????????????????? ??????
		String memberId = (String)session.getAttribute("memberId");
		Member memberDB = ms.selectId(memberId);
		model.addAttribute("memberDB", memberDB);	// ???????????? DB??? ?????? ???????????? ??????
		model.addAttribute("title", title);	// ?????? ??????
		model.addAttribute("memberId", memberId);
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("noticeAllList", noticeAllList);		// ???????????? ?????? ??? ?????????????????? ??????
		model.addAttribute("num", num);	// ?????? ?????? ?????? ?????? num
		return "admin/adminNoticeList";
	}
	@RequestMapping("adminNoticeView")
	public String noticeView(int NT_num, String pageNum, Model model, HttpSession session) {
		Notice notice = ns.select(NT_num);
		String memberId = (String)session.getAttribute("memberId");
		Member memberDB = ms.selectId(memberId);
		model.addAttribute("memberDB", memberDB);	// ???????????? DB??? ?????? ???????????? ??????
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeView";
	}
	
	@RequestMapping("adminNoticeWriteForm")
	public String noticeWriteForm(int NT_num, String pageNum, Model model, HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		int memberNo = (Integer)session.getAttribute("memberNo");
		model.addAttribute("memberId", memberId);
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("NT_num", NT_num);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeWriteForm";
	}
	@RequestMapping("adminNoticeWriteResult")
	public String noticeWrite(Notice notice, String pageNum, Model model, HttpSession session) {
		int number = ns.getMaxNum();	// ???????????? ?????? ?????? ??????
		int memberNo = (Integer)session.getAttribute("memberNo");
		notice.setMemberNo(memberNo);
		notice.setNT_num(number);
		int result = ns.noticeWrite(notice);		
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeWriteResult";
	}
	@RequestMapping("adminNoticeUpdateForm")
	public String noticeUpdateForm(int NT_num, String pageNum, Model model, HttpSession session) {
		Notice notice = ns.select(NT_num);
		String memberId = (String)session.getAttribute("memberId");
		Member memberDB = ms.selectId(memberId);
		model.addAttribute("memberDB", memberDB);	// ???????????? DB??? ?????? ???????????? ??????
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeUpdateForm";
	}
	@RequestMapping("adminNoticeUpdateResult")
	public String noticeUpdate(Notice notice, String pageNum, Model model) {
		int result = ns.noticeUpdate(notice);
		model.addAttribute("notice", notice);	// ???????????? ?????? ??? view??? ????????? ??? ????????? ??????
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeUpdateResult";
	}
	@RequestMapping("adminNoticeDelete")
	public String noticeDelete(int NT_num, String pageNum, Model model, HttpSession session) {
		int result = ns.noticeDelete(NT_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeDelete";
	}
	@RequestMapping("adminQnaList")
	public String adminQnaList(QnA qna, String pageNum, Model model, HttpSession session) {
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;		//????????? ??????
		int total = qas.getAllTotal(qna);	// ?????? ???????????? ??????
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		qna.setStartRow(startRow);
		qna.setEndRow(endRow);
		String memberId = (String)session.getAttribute("memberId");
		List<QnA> qnaAllList = qas.qnaAllList(qna);
		int num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"??????", "?????????", "??????", "??????+??????"};
		model.addAttribute("memberId", memberId);
		model.addAttribute("title", title);	// ?????? ??????
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("qnaAllList", qnaAllList);
		return "admin/adminQnaList";
	}
	@RequestMapping("adminQnaView")
	public String adminQnaView(int QA_num, String pageNum, Model model) {
		QnA qna = qas.select(QA_num);
		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminQnaView";
	}
	@RequestMapping("adminQnaDelete")
	public String adminQnaDelete(int QA_num, String pageNum, Model model) {
		int result = qas.adminQnaDelete(QA_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminQnaDelete";
	}
	@RequestMapping("adminQnaReplyForm")
	public String adminQnaReplyForm(int QA_num, String pageNum, Model model) {
		int QA_ref = 0, QA_refLevel = 0, QA_refStep = 0;
		String QA_title ="";
		//?????????
		if(QA_num!=0) {
			QnA qna = qas.select(QA_num);
			QA_ref = qna.getQA_ref();
			QA_refStep = qna.getQA_refStep();
			QA_refLevel = qna.getQA_refLevel();
			QA_title = qna.getQA_title();
		}
		model.addAttribute("QA_num", QA_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("QA_ref", QA_ref);
		model.addAttribute("QA_refLevel", QA_refLevel);
		model.addAttribute("QA_refStep", QA_refStep);
		model.addAttribute("QA_title", QA_title);
		return "admin/adminQnaReplyForm";
	}
	@RequestMapping("adminQnaReplyResult")
	public String adminQnaReplyResult(QnA qna, String pageNum, Model model, HttpSession session) throws IOException {
		int result = 0;
		String memberId = (String)session.getAttribute("memberId");
		Member member = ms.selectId(memberId);
		int memberNo = member.getMemberNo();
		qna.setMemberNo(memberNo);
		int number = qas.getMaxNum();
		if(qna.getQA_num()!=0) {
			qas.updateStep(qna);
			qna.setQA_refLevel(qna.getQA_refLevel()+1);
			qna.setQA_refStep(qna.getQA_refStep()+1);
		} else qna.setQA_ref(number);
		qna.setQA_num(number);
		if (qna.getFile()!=null && !qna.getFile().isEmpty()){
			String fileName = qna.getFile().getOriginalFilename();		
			qna.setQA_fileName(fileName);
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(qna.getFile().getBytes());
			fos.close();		
			result = qas.insertFile(qna);
		} else {
			result = qas.insert(qna);
		}
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "admin/adminQnaReplyResult";
	}
	@RequestMapping("insertNotice")
	public String insertNotice() {
		for (int i = 0; i < 234; i ++) {
			int number = ns.getMaxNum();
			Notice notice = new Notice();
			notice.setNT_num(i);
			notice.setNT_title("???????????? "+i);
			notice.setNT_content("???????????? ??????" + i);
			notice.setMemberNo(1);
			ns.noticeWrite(notice);	
		}			
		return "admin/insertNotice";
	}	
}
