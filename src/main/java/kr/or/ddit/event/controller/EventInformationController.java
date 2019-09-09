package kr.or.ddit.event.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.vo.EventVO;

@Controller
public class EventInformationController {

	@Inject
	IEventService service;
	
	@RequestMapping("/event/eventInformation")
	public String infomation(HttpServletRequest req, @RequestParam(name="evt_no", required=true) long evt_no, Model model) {
		HttpSession session = req.getSession();
		
		
		EventVO vo = service.retrieveEvent(evt_no);

		model.addAttribute("event", vo);
		model.addAttribute("mem", session.getAttribute("mem_id"));
		
		return "event/eventInformation";
	}
}
