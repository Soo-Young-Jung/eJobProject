package kr.or.ddit.notice.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.notice.service.INoticeBoardService;
import kr.or.ddit.vo.NoticeBoardVO;

@Controller
public class NoticeBoardViewController{
	@Inject
	INoticeBoardService service;

	@RequestMapping("/notice/noticeView.do")
	public String process(
			@RequestParam(name="what", required=true) int not_no,
			Model model) throws Exception{
		
		NoticeBoardVO notice = service.selectNotice(not_no);
		
		model.addAttribute("notice", notice);
		
		return "notice/noticeView";
		
	}

}
