package kr.or.ddit.common.controller;

import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.announce.service.IAnnounceService;
import kr.or.ddit.blog.service.IBlogBoardService;
import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.MemberVO;

@Controller
public class IndexController {
	
	@Inject
	IEventService service;
	
	@Inject
	IAnnounceService announceService;
	
	@Inject
	IMemberService memberService;
	
	@Inject
	IBlogBoardService blogService;
	
	@RequestMapping({"/", "/index.do"})
	public String home(
			Model model
			) {
		List<EventVO> recentEvent = service.retrieveRecentEvent();
		List<AnnounceVO> announceList = announceService.mainAccountList();
		List<MemberVO> profileList = memberService.selectEntProfileList();
		List<BlogBoardVO> famousBoardList = blogService.famousBlogBoardList();
		
//		Collections.shuffle(profileList);
		
		model.addAttribute("recentEvent", recentEvent);
		model.addAttribute("announceList", announceList);
		model.addAttribute("profileList", profileList);
		model.addAttribute("famousBoardList", famousBoardList);
		
		return "index";
	}
}
