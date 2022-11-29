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
import com.ch.GetU.model.QnA;
import com.ch.GetU.service.MemberService;
import com.ch.GetU.service.PagingBean;
import com.ch.GetU.service.QnAService;


@Controller
public class QnAController {
	@Autowired
	private QnAService qas;
	@Autowired
	private MemberService ms;
	
	@RequestMapping("qnaList")
	public String qnaList(QnA qna, String pageNum, Model model, HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		int memberNo = (Integer)session.getAttribute("memberNo");
		if(pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total  = qas.getTotal(qna);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		qna.setStartRow(startRow);
		qna.setEndRow(endRow);
		qna.setMemberNo(memberNo);
		List<QnA> list = qas.list(qna);
		for (QnA qa : list) { // 아이디 입력
			Member member = ms.selectNo(qa.getMemberNo());
			int memberId1 = member.getMemberNo(); 
			qa.setMemberNo(memberId1);
		}
		int num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"제목", "내용", "제목+내용"};
		model.addAttribute("memberId", memberId);
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("qna", qna);
		model.addAttribute("title", title);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("list", list);
		return "qna/qnaList";
	}
	
	@RequestMapping("qnaWriteForm")
	public String qnaWriteForm(int QA_num, String pageNum, Model model, String memberId) {
		int QA_ref=0, QA_refLevel=0, QA_refStep=0;
		//답변글
		if(QA_num!=0) {
			QnA qna = qas.select(QA_num);
			QA_ref = qna.getQA_ref();
			QA_refStep = qna.getQA_refStep();
			QA_refLevel = qna.getQA_refLevel();
		}	
		Member member = ms.selectId(memberId);
		model.addAttribute("member", member);
		model.addAttribute("memberId", memberId);
		model.addAttribute("QA_num", QA_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("QA_ref", QA_ref);
		model.addAttribute("QA_refLevel", QA_refLevel);
		model.addAttribute("QA_refStep", QA_refStep);
		return "qna/qnaWriteForm";
	}

	
	@RequestMapping("qnaWriteResult")
	public String qnaWriteResult(QnA qna, String pageNum, Model model, HttpSession session) throws IOException {
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
		}else qna.setQA_ref(number);
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
		model.addAttribute("memberNo", memberNo);
		return "qna/qnaWriteResult";
	}
	
	@RequestMapping("qnaView")
	public String qnaView(int QA_num, String pageNum, Model model, HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		Member member = ms.selectId(memberId);
		int memberNo = member.getMemberNo();
		QnA qna = qas.select(QA_num);
		model.addAttribute("qna",qna);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("memberId", memberId);
		return "qna/qnaView";
	}
	
	@RequestMapping("qnaDelete")
	public String delete(int QA_num, String pageNum, Model model, HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");		
		Member member = ms.selectId(memberId);
		int memberNo = member.getMemberNo();
		int result = qas.delete(QA_num);
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("memberId", memberId);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "qna/qnaDelete";
	}
	
}
