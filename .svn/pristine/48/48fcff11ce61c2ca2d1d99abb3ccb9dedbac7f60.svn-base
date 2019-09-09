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
@RequestMapping("/announce/scrap.do")
public class Scrap {
	
	@Inject
	IAnnounceService service;
	@Inject
	ILoginService loginService;
	
	@PostMapping
	public String doPost(
				@RequestParam(required=true) Integer annl_no,
				HttpSession session
			) {
		Map<String, String> scrap = new HashMap<String, String>();
		
		String message = null;
		
		String mem_id = (String) session.getAttribute("mem_id");
		
		scrap.put("annl_no", annl_no+"");
		scrap.put("mem_id", mem_id);
		
		if(StringUtils.isBlank(mem_id)) {
			message = "로그인을 해주세요.";
		} else {
			int cnt = service.selectScrap(scrap);
			if(cnt == 0) {
				service.inserteScrap(scrap);
				message = "스크랩 하셨습니다.";
			} else {
				service.deleteScrap(scrap);
				message = "스크랩을 취소하셨습니다.";
			}
		}
		
	
		session.setAttribute("message", message);
		
		return "redirect:/announce/announceView.do?annl_no=" + annl_no;
	}
	
	
	
}
