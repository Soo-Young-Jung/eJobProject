package kr.or.ddit.notice.controller;

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
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.notice.service.INoticeBoardService;
import kr.or.ddit.vo.NoticeBoardVO;

@Controller
@RequestMapping("/notice/noticeInsert.do")
public class NoticeBoardInsertController{

	@Inject
	INoticeBoardService service;
	@Inject
	ILoginService loginservice;

	@GetMapping
	public String doGet(HttpSession session) {
		String goPage = "notice/noticeForm";
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
			@Validated(InsertGroup.class) @ModelAttribute("notice") NoticeBoardVO notice, 
			Errors errors, Model model ) throws Exception {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		
		if (valid) {
//			System.out.println(board.getBo_no());
			ServiceResult result = service.insertNotice(notice);
//			System.out.println(board.getBo_no());
			if(ServiceResult.OK.equals(result)) {
				goPage = "redirect:/notice/noticeView.do?what="+notice.getNot_no();
			}else {
				message = "서버오류 발생, 다시 실행.";
				goPage = "notice/noticeForm";
			}
		} else {
			goPage = "notice/noticeForm";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
}
