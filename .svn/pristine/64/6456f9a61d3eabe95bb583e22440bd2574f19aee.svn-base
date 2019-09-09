package kr.or.ddit.event.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ent_info.service.IEnt_infoService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.MemberVO;

@Controller
public class EventInsertController {

	@Inject
	IEventService service;
	
	@PostMapping("/event/eventInsert")
	public String doPost(HttpServletRequest req, @ModelAttribute EventVO event,  Errors errors, Model model) {
		
		HttpSession session = req.getSession();
		System.out.println(session.getAttribute("mem_id"));
		System.out.println(session.getAttribute("mem_id"));
		System.out.println(session.getAttribute("mem_id"));
		System.out.println(session.getAttribute("mem_id"));
		System.out.println(session.getAttribute("mem_id"));
		System.out.println(session.getAttribute("mem_id"));
		System.out.println(session.getAttribute("mem_id"));
		
		System.out.println("1111111111111111111111111111111111111111");
	
		if("admin".equals((String)session.getAttribute("mem_id"))) {
			event.setMem_id((String)session.getAttribute("mem_id"));

			
		} else {
			// 관리자가 아니다 관리자로 로그인해라 메시지
		}
	
		
//		boolean valid = !errors.hasErrors();
		String goPage = null;
//		String message = null;
		ServiceResult result = service.createEvent(event);
		
		if(ServiceResult.OK.equals(result)) {
			goPage = "redirect:/event";
		}
		
		return goPage;
	}
	
	@RequestMapping("event/eventInsert1")
	public String aa() {
		return "event/eventInsert";
	}
	

	
}
