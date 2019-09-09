package kr.or.ddit.faq.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.faq.service.IFaqBoardService;
import kr.or.ddit.vo.FaqBoardVO;


@Controller
public class FaqBoardViewController{
	@Inject
	IFaqBoardService service;

	@RequestMapping("/faq/faqView.do")
	public String process(
			@RequestParam(name="what", required=true) int faq_no,
			Model model) throws Exception{
		
		FaqBoardVO faq = service.selectFaqBoard(faq_no);
		
		model.addAttribute("faq", faq);
		
		return "faq/faqView";
		
	}

}
