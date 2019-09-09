package kr.or.ddit.faq.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.InsertGroup;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.faq.service.IFaqBoardService;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.vo.FaqBoardVO;

@Controller
@RequestMapping("/faq/faqInsert.do")
public class FaqBoardInsertController{

	@Inject
	IFaqBoardService service;
	@Inject
	ILoginService loginservice;

	@GetMapping
	public String doGet(HttpSession session) {
		String goPage = "faq/faqForm";
//		if(session==null || session.isNew()) {
//			session.setAttribute("message", "로그인부터 하지!!");
//			goPage = "redirect:/login/loginform.do";
//		}else {
//			String mem_id = (String) session.getAttribute("mem_id");
//			if(!loginservice.divCheck(mem_id).equals("A")) {
//				goPage = "redirect:/notice/noticeList.do";
//			}
//		}
		return goPage;
	}
	
	@PostMapping
	public String doPost(
			@Validated(InsertGroup.class) @ModelAttribute("faq") FaqBoardVO faq, 
			Errors errors, Model model ) throws Exception {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		
		if (valid) {
//			System.out.println(board.getBo_no());
			ServiceResult result = service.insertFaqBoard(faq);
//			System.out.println(board.getBo_no());
			if(ServiceResult.OK.equals(result)) {
				goPage = "redirect:/faq/faqList.do";
			}else {
				message = "서버오류 발생, 다시 실행.";
				goPage = "faq/faqForm";
			}
		} else {
			goPage = "faq/faqForm";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
}
