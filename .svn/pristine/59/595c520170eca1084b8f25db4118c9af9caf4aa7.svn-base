package kr.or.ddit.member.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.MemberVO;

@Controller
public class MemberInformation {
	@Inject
	IMemberDAO service;
	
	@RequestMapping("/member/memberInformation")
	public String infomation(@RequestParam(name="mem_id", required=true) String id, Model model) {
		
		MemberVO vo = service.selectMember(id);

		model.addAttribute("member", vo);
		
		return "adminmypage/memberInformation";
	}
}
