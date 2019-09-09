package kr.or.ddit.event.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.vo.EventVO;


// 이벤트 업데이트
@Controller
public class EventUpdateController {
	
	@Inject
	IEventService service;
	
	@RequestMapping("/update")
	public String update(HttpServletRequest req, @ModelAttribute EventVO event, Errors errors, Model model) {
		HttpSession session = req.getSession();
		
		String goPage = null;
		String message = null;

	
		
		
		
		if("admin".equals((String)session.getAttribute("mem_id"))) {
			event.setMem_id((String)session.getAttribute("mem_id"));


	
			EventVO vo =  service.retrieveEvent(event.getEvt_no());
			model.addAttribute("event", vo);
			goPage = "event/eventUpdate";	
			
		} else {
			// 관리자가 아니다 관리자로 로그인해라 메시지
			message = "권한이 없는 영역입니다.";
			goPage = "redirect:/event/eventInformation?evt_no="+event.getEvt_no();
			
		}
		model.addAttribute("message", message);
	
	
	return goPage;	
	}
	

	
	
	@RequestMapping("/event/update")
	public String infomation(HttpServletRequest req, @ModelAttribute EventVO event, Errors errors, Model model) {
		

		service.modifyEvent(event);

		EventVO vo = service.retrieveEvent(event.getEvt_no());


		
		
		model.addAttribute("event", vo);
		return "event/eventInformation";
	}
	
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req, @ModelAttribute EventVO event, Errors errors, Model model) {
		HttpSession session = req.getSession();
		String goPage = null;
		String message = null;
		

		
		
		if("admin".equals((String)session.getAttribute("mem_id"))) {
			event.setMem_id((String)session.getAttribute("mem_id"));

			ServiceResult result = service.removeEvent(event);
			if(ServiceResult.OK.equals(result)) {
				goPage = "redirect:/event";
			}
			
		} else {
			// 관리자가 아니다 관리자로 로그인해라 메시지
			message = "권한이 없는 영역입니다.";
			goPage = "redirect:/event/eventInformation?evt_no="+event.getEvt_no();
			
		}
		model.addAttribute("message", message);
		
	
		
	return goPage;	
	}
	
	
}