package kr.or.ddit.ent_info.controller;

import java.util.List;


import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.ent_info.service.IEnt_infoService;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.Ent_info2VO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.PagingVO;

@Controller
public class Ent_infoListController {

	@Inject
	IEnt_infoService service;
	
	
	
	@RequestMapping(value="/ent_info")
	public String list(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(required=false) String searchType,
			@RequestParam(required=false) String searchWord,	
 			Model model
	){
		PagingVO<Ent_info2VO> paging = new PagingVO<>(9,5);
		paging.setSearchType(searchType);
		paging.setSearchWord(searchWord);
		// 1. 
		paging.setCurrentPage(currentPage);
		
		long totalRecode = service.retrieveEnt_infoCount(paging);
		paging.setTotalRecord(totalRecode);
		
		List<Ent_info2VO> list = service.retrieveEnt_infoList(paging);
		paging.setDataList(list);
		

		
		model.addAttribute("pagingVO", paging);
	
		
		return "adminmypage/ent_infoList";
		
	}
	
	
	@RequestMapping(value="/ent_info/ent_infoinformation.do")
	public String process(
			@RequestParam(name="id", required=true) String id,
			Model model){
		
//		Ent_infoVO vo = service.retrieveEnt_info(id);
//		model.addAttribute("ent_info", vo);
		
		
		Ent_info2VO vo = service.retrieveEnt_info(id);
	
		
		model.addAttribute("ent_info", vo);
		
		List<Ent_infoVO> list = service.announcevo(id);
		model.addAttribute("aaa", list);
		
		
		
		return "adminmypage/ent_infoinformation";
	}
	
}
