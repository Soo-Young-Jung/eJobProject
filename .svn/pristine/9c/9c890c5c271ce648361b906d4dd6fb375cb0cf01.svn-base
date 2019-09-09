package kr.or.ddit.announce.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.announce.service.IAnnounceService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.service.ILoginService;

@Controller
public class Applicant {
	
	@Inject
	IAnnounceService service;
	@Inject
	ILoginService loginService;
	
	@PostMapping(value="/announce/applicant.do")
	public String applicant(
			@RequestParam(required=true) Integer annl_no,
			HttpSession session
			){
		Map<String, String> applicant = new HashMap<String, String>();
		Map<String, Object> result = new HashMap<String, Object>();
		
		String message = null;
		
		String mem_id = (String) session.getAttribute("mem_id");
		
		applicant.put("annl_no", annl_no+"");
		applicant.put("mem_id", mem_id);
		
		if(StringUtils.isBlank(mem_id)) {
			result.put("message", "로그인을 해주세요");
			message = "로그인을 해주세요.";
		} else {
			String mem_div = loginService.divCheck(mem_id);
			if(!"G".equals(mem_div)) {
				result.put("message", "현재 로그인한 유저로는 지원이 불가합니다.");
				message = "현재 로그인한 유저로는 지원이 불가합니다.";
			} else {
				ServiceResult sr = service.createApplicant(applicant);
				switch (sr) {
				case OK:
					result.put("message", "해당 공고에 성공적으로 지원하였습니다.");
					message = "해당 공고에 성공적으로 지원하였습니다.";
					break;
				case PKDUPLICATED:
					result.put("message", "이미 공고에 지원하셨습니다.");
					message = "이미 공고에 지원하셨습니다.";
					break;
				case FAILED:
					result.put("message", "서버 오류로 인해 지원에 실패하였습니다.");
					message = "서버 오류로 인해 지원에 실패하였습니다.";
					break;
				}
			}
		}
	
		session.setAttribute("message", message);
		
		return "redirect:/announce/announceView.do?annl_no=" + annl_no;
	}
	
	
	
}
