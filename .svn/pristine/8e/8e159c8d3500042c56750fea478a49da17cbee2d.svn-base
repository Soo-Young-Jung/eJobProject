package kr.or.ddit.announce.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.announce.service.IAnnounceService;
import kr.or.ddit.common.InsertGroup;
import kr.or.ddit.common.UpdateGroup;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.vo.AnnounceVO;


//@RestController
@Controller
@RequestMapping(value="/announce/announceForm.do")
public class AnnounceFrom {
	
	@Inject
	IAnnounceService service;
	@Inject
	ILoginService loginService;
	
	@GetMapping
	public String doGet(
			@RequestParam(required=false) Integer annl_no,
			HttpSession session,
			Model model
			) {
		String goPage = null;
		String mem_id = (String) session.getAttribute("mem_id");
		if(StringUtils.isNotBlank(mem_id)){
			if(annl_no != null) { 
				AnnounceVO announce = service.retrieveAnnounce(annl_no);
				model.addAttribute("announce", announce);
				goPage = "announce/announceForm";
			}
		} else {
			goPage = "redirect:/announce/announceListView.do";
			session.setAttribute("message", "로그인한 유저만 사용할 수 있습니다.");
		}
		
		return goPage;
	}
	
	@PostMapping
	public String doPost(
			@Validated(InsertGroup.class) @ModelAttribute("announce") AnnounceVO announceVO,
			HttpSession session,
			Errors errors, Model model
			) {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		announceVO.setMem_id((String)session.getAttribute("mem_id"));
		if (valid) {
			System.out.println(announceVO.getAnnl_no());
			ServiceResult result = service.createAnnounce(announceVO);
			System.out.println(announceVO.getAnnl_no());
			if(ServiceResult.OK.equals(result)) {
				goPage = "redirect:/announce/announceView.do?annl_no="+announceVO.getAnnl_no();
			}else {
				message = "서버에 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요.";
				goPage = "announce/announceForm";
			}
		} else {
			goPage = "announce/announceForm";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
	
	@PutMapping
	public String doPut(
			@ModelAttribute("announce") AnnounceVO announceVO,
			HttpSession session,
			Errors errors, Model model
			) {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		announceVO.setMem_id((String)session.getAttribute("mem_id"));
		if (valid) {
			System.out.println(announceVO.getAnnl_no());
			ServiceResult result = service.modifyAnnounce(announceVO);
			System.out.println(announceVO.getAnnl_no());
			if(ServiceResult.OK.equals(result)) {
				goPage = "redirect:/announce/announceView.do?annl_no="+announceVO.getAnnl_no();
			}else {
				message = "서버에 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요.";
				goPage = "announce/announceForm";
			}
		} else {
			goPage = "announce/announceForm";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
	
	@DeleteMapping
	public String doDelete(
			@RequestParam(required=true) Integer annl_no,
			HttpSession session
			) {
		
		String view = "redirect:/announce/announceView.do?annl_no=" + annl_no;
		
		ServiceResult sr = service.romoveAnnounce(annl_no);
		
		if(sr == ServiceResult.OK) {
			view = "redirect:/";
			session.setAttribute("message", "해당 글이 삭제 되었습니다.");
		} else {
			session.setAttribute("message", "해당 글을 삭제하는데 실패하였습니다.");
		}
		
		return view;
	}
	
	
}