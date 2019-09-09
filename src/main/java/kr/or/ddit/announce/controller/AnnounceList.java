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
import kr.or.ddit.ent_info.service.IEnt_infoService;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.vo.AnnouncePagingVO;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.Ent_info2VO;

@Controller
public class AnnounceList {
	
	@Inject
	IAnnounceService service;
	@Inject
	ILoginService loginService;
	@Inject
	IEnt_infoService entSercvice;
	
	
	@RequestMapping("/announce/announceListView.do")
	public String list(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(required=false) String searchType,
			@RequestParam(required=false) String searchWord,
			@RequestParam(required=false) String searchST,
			@RequestParam(required=false) String searchAddr,
			@RequestParam(required=false) String searchCareer,
			@RequestParam(required=false) String searchFEB,
			@RequestHeader(name="Accept", required=false) String accept,
			Model model,
			HttpSession session
	) {
		AnnouncePagingVO<AnnounceVO> announcePagingVO = new AnnouncePagingVO<>(6, 10);
		
		announcePagingVO.setCurrentPage(currentPage);
		announcePagingVO.setSearchType(searchType);
		announcePagingVO.setSearchWord(searchWord);
		announcePagingVO.setSearchST(searchST);
		announcePagingVO.setSearchAddr(searchAddr);
		announcePagingVO.setSearchCareer(searchCareer);
		announcePagingVO.setSearchFEB(searchFEB);
		
		long totalRecord = service.retrieveAnnounceCount(announcePagingVO);
		
		announcePagingVO.setTotalRecord(totalRecord);
		
		List<AnnounceVO> announceList = service.retrieveAnnounceList(announcePagingVO);
		announcePagingVO.setDataList(announceList);
		
		String mem_id = (String) session.getAttribute("mem_id");
		if(StringUtils.isNotBlank(mem_id)) {
			String mem_div = loginService.divCheck(mem_id);
			model.addAttribute("mem_div", mem_div);
		}
		
		model.addAttribute("announcePagingVO", announcePagingVO);
		
		return "announce/announceListView";
	}
	
	@RequestMapping("/mypage/announceListView.do")
	public String listMem(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(required=false) String searchType,
			@RequestParam(required=false) String searchWord,
			@RequestParam(required=false) String searchST,
			@RequestParam(required=false) String searchAddr,
			@RequestParam(required=false) String searchCareer,
			@RequestParam(required=false) String searchFEB,
			@RequestHeader(name="Accept", required=false) String accept,
			Model model,
			HttpSession session
	) {
		AnnouncePagingVO<AnnounceVO> announcePagingVO = new AnnouncePagingVO<>(3, 10);
		
		announcePagingVO.setCurrentPage(currentPage);
		announcePagingVO.setSearchType(searchType);
		announcePagingVO.setSearchWord(searchWord);
		announcePagingVO.setSearchST(searchST);
		announcePagingVO.setSearchAddr(searchAddr);
		announcePagingVO.setSearchCareer(searchCareer);
		announcePagingVO.setSearchFEB(searchFEB);
		
		long totalRecord = service.appCount((String) session.getAttribute("mem_id"));
		
		announcePagingVO.setTotalRecord(totalRecord);
		
		String mem_id = (String) session.getAttribute("mem_id");
		announcePagingVO.setSearchApp(mem_id);
		List<AnnounceVO> announceList = service.retrieveAnnounceListForApp(announcePagingVO);
		announcePagingVO.setDataList(announceList);
		
		if(StringUtils.isNotBlank(mem_id)) {
			String mem_div = loginService.divCheck(mem_id);
			model.addAttribute("mem_div", mem_div);
		}
		
		model.addAttribute("announcePagingVO", announcePagingVO);
		
		return "mypage/announceListView";
	}

	
	@RequestMapping("/mypage/scrapList.do")
	public String listScrap(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(required=false) String searchType,
			@RequestParam(required=false) String searchWord,
			@RequestParam(required=false) String searchST,
			@RequestParam(required=false) String searchAddr,
			@RequestParam(required=false) String searchCareer,
			@RequestParam(required=false) String searchFEB,
			@RequestHeader(name="Accept", required=false) String accept,
			Model model,
			HttpSession session
	) {
		AnnouncePagingVO<AnnounceVO> announcePagingVO = new AnnouncePagingVO<>(3, 10);
		
		announcePagingVO.setCurrentPage(currentPage);
		announcePagingVO.setSearchType(searchType);
		announcePagingVO.setSearchWord(searchWord);
		announcePagingVO.setSearchST(searchST);
		announcePagingVO.setSearchAddr(searchAddr);
		announcePagingVO.setSearchCareer(searchCareer);
		announcePagingVO.setSearchFEB(searchFEB);
		
		long totalRecord = service.appCount((String) session.getAttribute("mem_id"));
		
		announcePagingVO.setTotalRecord(totalRecord);
		
		String mem_id = (String) session.getAttribute("mem_id");
		announcePagingVO.setSearchId(mem_id);
		List<AnnounceVO> announceList = service.retrieveScrapList(announcePagingVO);
		announcePagingVO.setDataList(announceList);
		
		if(StringUtils.isNotBlank(mem_id)) {
			String mem_div = loginService.divCheck(mem_id);
			model.addAttribute("mem_div", mem_div);
		}
		
		model.addAttribute("announcePagingVO", announcePagingVO);
		
		return "mypage/announceListView";
	}
	
	@GetMapping(value="/ent_info.do")
	public String doGetMy(
			@RequestParam(required=true) String mem_id,
			Model model
			) {
		
		String mem_div = loginService.divCheck(mem_id);
		
		if(!"E".equals(mem_div)) {
			return "/";
		}
		
		Ent_info2VO ent_info2VO = entSercvice.retrieveEnt_info(mem_id);
		
		
		model.addAttribute("ent_info", ent_info2VO);
		
		return "ent_info/ent_info";
	}
	
	
	
}
