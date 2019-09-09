package kr.or.ddit.announce.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.announce.service.IAnnounceService;
import kr.or.ddit.ent_info.service.IEnt_infoService;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.mail.Mail;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberfoService;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.ApplicantMemberVO;
import kr.or.ddit.vo.Ent_info2VO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

@Controller
public class ApplicantList {
	
	@Inject
	IAnnounceService service;
	@Inject
	ILoginService userService;
	@Inject
	IEnt_infoService entService;
	@Inject
	MemberfoService memService;
	
	Mail mail;
	
	@GetMapping(value="/announce/applicantList.do")
	@Transactional
	public String doGet(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestHeader(name="Accept", required=false) String accept,
			@RequestParam(required=true) Integer annl_no,
			HttpSession session,
			Model model
			) {
		
		PagingVO pagingVO = new PagingVO<>(20, 10);
		pagingVO.setCurrentPage(currentPage);
		
		String view = "redirect:/";
		String message = "해당 페이지에 접근할 권한이 없습니다.";
		
		String mem_id = (String) session.getAttribute("mem_id");
		
		AnnounceVO announceVO = service.retrieveAnnounce(annl_no);
		
		
		if(!announceVO.getMem_id().equals(mem_id)) {
			session.setAttribute("message", message);
			return view;
		}
		List<String> recList = service.selectRecList(annl_no);
		
		pagingVO.setSearchWord(annl_no+"");
		
		long totalRecord = service.selectApplicantCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<ApplicantMemberVO> applicantMembarList = service.selectApplicantMemberList(pagingVO);
		
		pagingVO.setDataList(applicantMembarList);
		
		model.addAttribute("recList", recList);
		model.addAttribute("succ", false);
		model.addAttribute("announceVO", announceVO);
		model.addAttribute("pagingVO", pagingVO);
		
		view = "announce/applicantList";
		
		return view;
	}
	
	@PostMapping(value="/announce/applicantList.do")
	public String doPost(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestHeader(name="Accept", required=false) String accept,
			@RequestParam(required=true) Integer annl_no,
			@RequestParam String[] mem_id,
			HttpSession session,
			Model model
			) {
		
		PagingVO pagingVO = new PagingVO<>(20, 10);
		pagingVO.setCurrentPage(currentPage);
		
		
		List<Map<Integer, String>> succList = new ArrayList<>();
		AnnounceVO announceVO = service.retrieveAnnounce(annl_no);
		Ent_info2VO ent_info2VO = entService.retrieveEnt_info(announceVO.getMem_id());
		
		for(int i = 0; i < mem_id.length; i++) {
			if(StringUtils.isNotBlank(mem_id[i])) {
				Map<String, String> succ = new HashMap<>();
				
				succ.put("annl_no" , annl_no+"");
				succ.put("mem_id", mem_id[i]);
				
				service.insertSucc(succ);
				
				MemberVO memberVO = memService.retrieveMember(mem_id[i]);
				
				mail = new Mail();
				
				mail.succ(memberVO, announceVO, ent_info2VO);
			}
		}
		
		pagingVO.setSearchWord(annl_no+"");
		
		
		long totalRecord = service.selectSuccCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<ApplicantMemberVO> applicantMembarList = service.selectSuccMemebrtList(pagingVO);
		
		pagingVO.setDataList(applicantMembarList);
		
		model.addAttribute("announceVO", announceVO);
		model.addAttribute("succ", true);
		model.addAttribute("pagingVO", pagingVO);
		
		
		return "announce/applicantList";
	}
	
	@GetMapping(value="/announce/successList.do")
	public String doSuccGet(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestHeader(name="Accept", required=false) String accept,
			@RequestParam(required=true) Integer annl_no,
			HttpSession session,
			Model model
			) {

		PagingVO pagingVO = new PagingVO<>(20, 10);
		pagingVO.setCurrentPage(currentPage);
		
		
		List<Map<Integer, String>> succList = new ArrayList<>();
		
		pagingVO.setSearchWord(annl_no+"");
		
		AnnounceVO announceVO = service.retrieveAnnounce(annl_no);
		
		long totalRecord = service.selectSuccCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<ApplicantMemberVO> applicantMembarList = service.selectSuccMemebrtList(pagingVO);
		
		pagingVO.setDataList(applicantMembarList);
		
		model.addAttribute("announceVO", announceVO);
		model.addAttribute("succ", true);
		model.addAttribute("pagingVO", pagingVO);
		
		
		return "announce/applicantList";
	}
	
	
	
}
