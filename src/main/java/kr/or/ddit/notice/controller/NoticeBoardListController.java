package kr.or.ddit.notice.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.notice.service.INoticeBoardService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.PagingVO;

@Controller
public class NoticeBoardListController{
	
	@Inject
	INoticeBoardService service;
	@Inject
	ILoginService logingService;

	@RequestMapping(value="/notice/noticeList.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<NoticeBoardVO> ajaxList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(required=false) String searchType,
			@RequestParam(required=false) String searchWord,
 			@RequestHeader(name="Accept", required=false) String accept,
 			@CookieValue(name="JSESSIONID", required=false) String sessionId,
 			HttpSession session,
 			Model model
			) throws Exception {
		list(currentPage, searchType, searchWord, accept, sessionId, session, model);
		return  (PagingVO<NoticeBoardVO>) model.asMap().get("pagingVO");
	}
	
	@RequestMapping("/notice/noticeList.do")
	public String list(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(required=false) String searchType,
			@RequestParam(required=false) String searchWord,
 			@RequestHeader(name="Accept", required=false) String accept,
 			@CookieValue(name="JSESSIONID", required=false) String sessionId,
 			HttpSession session,
 			Model model
	) throws Exception{
		String mem_id = null;
		if(session!=null && !session.isNew()) {
			mem_id = (String) session.getAttribute("mem_id");
		}
		PagingVO<NoticeBoardVO> pagingVO = new PagingVO<>();
		pagingVO.setSearchType(searchType);
		pagingVO.setSearchWord(searchWord);
		pagingVO.setNot_div(mem_id!=null ? logingService.divCheck(mem_id): null);
		pagingVO.setCurrentPage(currentPage);
		
		long totalRecord = service.retrieveNoticeCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		
		List<NoticeBoardVO> boardList = service.selectNoticeListAll(pagingVO);
		pagingVO.setDataList(boardList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "notice/noticeList";
		
		
	}

}














