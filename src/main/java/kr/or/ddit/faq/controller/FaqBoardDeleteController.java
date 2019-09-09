package kr.or.ddit.faq.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.faq.service.IFaqBoardService;
import kr.or.ddit.vo.FaqBoardVO;


@Controller
public class FaqBoardDeleteController{
	@Inject
	IFaqBoardService service;

	
	@RequestMapping("/faq/faqDelete.do")
	public String process(
			@RequestParam(name="what", required=true) int faq_no, 
//			@RequestParam(required=true) String not_pass,
			RedirectAttributes redirectAttributes
			) throws Exception{
		FaqBoardVO notice = new FaqBoardVO();
		//notice.
		//notice.setBo_pass(bo_pass);
		
		ServiceResult result = service.deleteFaqBoard(faq_no);
		String goPage = null;
		String message = null;
		switch (result) {
		case INVALIDPASSWORD:
			goPage = "redirect:/faq/faqView.do?what="+faq_no;
			message = "비번 오류";
			break;
		case FAILED:
			goPage = "redirect:/faq/faqView.do?what="+faq_no;
			message = "서버 오류";
			break;
		default:
//			post-REDIRECT-get : PRG 패턴
			goPage = "redirect:/faq/faqList.do";
			message = faq_no+"번 글 삭제 성공";
			break;
		}
		redirectAttributes.addFlashAttribute("message", message);
		return goPage;
	}

}









