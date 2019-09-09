package kr.or.ddit.member.controller;

import java.util.List;



import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

@Controller
public class MemberListController {

	@Inject
	IMemberDAO service;
	
	
	
	@RequestMapping(value="/member")
	public String list(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(required=false) String searchType,
			@RequestParam(required=false) String searchWord,	
 			Model model
	){
		PagingVO<MemberVO> paging = new PagingVO<>(9,5);
		paging.setSearchType(searchType);
		paging.setSearchWord(searchWord);
		// 1. 
		paging.setCurrentPage(currentPage);
		
		long totalRecode = service.selectMemberCount(paging);
		paging.setTotalRecord(totalRecode);
		
		List<MemberVO> list = service.selectMemberList(paging);
		paging.setDataList(list);
		

		
		model.addAttribute("pagingVO", paging);
	
		
		return "adminmypage/memberList";
		
	}
	
	
	@RequestMapping(value="/member/memberinformation")
	public String process(
			@RequestParam(name="id", required=true) String id,
			Model model){
		

		
		MemberVO vo = service.selectMember(id);
	
		
		model.addAttribute("member", vo);
		
	
		return "adminmypage/memberinformation";
	}
	
}
