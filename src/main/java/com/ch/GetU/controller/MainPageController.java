package com.ch.GetU.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.GetU.model.House;
import com.ch.GetU.service.MainPageService;

@Controller
public class MainPageController {
	@Autowired
	private MainPageService mps;
	
	@RequestMapping("mainPage")
	public String list(String pageNum, Model model) {
		final int ROW_PER_PAGE = 5; // 한 페이지에 6개씩
		final int PAGE_PER_BLOCK = 4; // 한 블럭에 5페이지		
			if (pageNum == null || pageNum.equals("")) 	{
				pageNum = "1";
			}		
		List<House> houseList = mps.getAllHouseList();		
		int currentPage = Integer.parseInt(pageNum);
		int houseTotal = houseList.size();
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;		
		List<House> HousePageList = mps.getHousePageList(startRow, endRow);		
		int totalPage = (int)Math.ceil((double)houseTotal/ROW_PER_PAGE);
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int endPage = startPage + PAGE_PER_BLOCK - 1;		
		if (endPage > totalPage) 	{
			endPage = totalPage;
		}		
		model.addAttribute("HousePageList", HousePageList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);		
		return "/mainPage/mainPage";
	}
	
	@RequestMapping("searchResult")
	public String searchResult(String searchKey, String searchValue, String pageNum, Model model){
		List<House> resultHouseList = mps.resultHouseList(searchKey, searchValue);		
		final int ROW_PER_PAGE = 4; // 한 페이지에 게시글 6개 씩
		final int PAGE_PER_BLOCK = 4; // 한 블럭에 5페이지 씩		
			if (pageNum == null || pageNum.equals("")) { // 페이지 초기값 1로 설정	
				pageNum = "1";
			}		
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)			
		int total = resultHouseList.size(); // 총 추천 영화 수
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수		
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지
		if (endPage > totalPage)	{
			endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
		}		
		String startRow2 = String.valueOf(startRow);
		String endRow2 = String.valueOf(endRow);		
		List<House> resultHousePageList = mps.resultHousePageList(searchKey, searchValue, startRow2, endRow2);		
		model.addAttribute("resultHousePageList", resultHousePageList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("total", total);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);		
		return "/mainPage/searchResult";
	}
}
