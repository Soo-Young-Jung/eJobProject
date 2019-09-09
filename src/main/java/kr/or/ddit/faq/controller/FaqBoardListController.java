package kr.or.ddit.faq.controller;

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

import kr.or.ddit.faq.service.IFaqBoardService;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.vo.FaqBoardVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

@Controller
public class FaqBoardListController{
	
	@Inject
	IFaqBoardService service;
	@Inject
	ILoginService logingService;

	@RequestMapping(value="/faq/faqList.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<FaqBoardVO> ajaxList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
//			@RequestParam(required=false) String searchType,
			@RequestParam(required=false) String searchWord,
 			@RequestHeader(name="Accept", required=false) String accept,
 			@CookieValue(name="JSESSIONID", required=false) String sessionId,
 			HttpSession session,
 			Model model
			) throws Exception {
		list(currentPage, searchWord, accept, sessionId, session, model);
		return  (PagingVO<FaqBoardVO>) model.asMap().get("pagingVO");
	}
	
	@RequestMapping("/faq/faqList.do")
	public String list(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
//			@RequestParam(required=false) String searchType,
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
		PagingVO<FaqBoardVO> pagingVO = new PagingVO<>();
//		pagingVO.setSearchType(searchType);
		pagingVO.setSearchWord(searchWord);
		pagingVO.setNot_div(mem_id!=null ? logingService.divCheck(mem_id): null);
		pagingVO.setCurrentPage(currentPage);
		
		long totalRecord = service.retrieveFaqBoardCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		
		List<FaqBoardVO> faqList = service.selectFaqBoardListAll(pagingVO);
		pagingVO.setDataList(faqList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "faq/faqList";
		
		
	}

}














