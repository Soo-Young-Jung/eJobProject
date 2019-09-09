package kr.or.ddit.announce.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.announce.service.IAnnounceService;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.vo.AnnouncePagingVO;
import kr.or.ddit.vo.AnnounceVO;

@Controller

public class MyAnnounceList {
	
	@Inject
	IAnnounceService service;
	@Inject
	ILoginService userService;
	
	@RequestMapping("/announce/myAnnounce.do")
	public String doGet(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestHeader(name="Accept", required=false) String accept,
			HttpSession session,
			Model model
			) {
		String mem_id = (String) session.getAttribute("mem_id");
		
		String view = "redirect:/";
		String message = "해당 페이지에 접근할 권한이 없습니다.";
		
		if(StringUtils.isBlank(mem_id)) {
			session.setAttribute("message", message);
			return view;
		}
		if(!"E".equals(userService.divCheck(mem_id))) {
			session.setAttribute("message", message);
			return view;
		}
		
		AnnouncePagingVO<AnnounceVO> announcePagingVO = new AnnouncePagingVO<>(20, 10);
		
		announcePagingVO.setMem_id(mem_id);
		announcePagingVO.setCurrentPage(currentPage);
		
		long totalRecord = service.selectAnnounceCountForMy(announcePagingVO);
		
		announcePagingVO.setTotalRecord(totalRecord);
		
		List<AnnounceVO> announceList = service.selectAnnounceListForMy(announcePagingVO);
		announcePagingVO.setDataList(announceList);
		
		model.addAttribute("announcePagingVO", announcePagingVO);
		
		
		view = "announce/myAnnounceList";
		
		return view;
	}
	
	
	@RequestMapping("/entmypage/myAnnounce.do")
	public String entmypage(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestHeader(name="Accept", required=false) String accept,
			HttpSession session,
			Model model
			) {
		String mem_id = (String) session.getAttribute("mem_id");
		
		String view = "redirect:/";
		String message = "해당 페이지에 접근할 권한이 없습니다.";
		
		if(StringUtils.isBlank(mem_id)) {
			session.setAttribute("message", message);
			return view;
		}
		if(!"E".equals(userService.divCheck(mem_id))) {
			session.setAttribute("message", message);
			return view;
		}
		
		AnnouncePagingVO<AnnounceVO> announcePagingVO = new AnnouncePagingVO<>(20, 10);
		
		announcePagingVO.setMem_id(mem_id);
		announcePagingVO.setCurrentPage(currentPage);
		
		long totalRecord = service.selectAnnounceCountForMy(announcePagingVO);
		
		announcePagingVO.setTotalRecord(totalRecord);
		
		List<AnnounceVO> announceList = service.selectAnnounceListForMy(announcePagingVO);
		announcePagingVO.setDataList(announceList);
		
		model.addAttribute("announcePagingVO", announcePagingVO);
		
		
		view = "entmypage/myAnnounceList";
		
		return view;
	}
	
	

}
