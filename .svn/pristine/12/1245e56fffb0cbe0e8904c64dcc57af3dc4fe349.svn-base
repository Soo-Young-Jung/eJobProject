package kr.or.ddit.faq.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.UpdateGroup;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.faq.service.IFaqBoardService;
import kr.or.ddit.vo.FaqBoardVO;

@Controller
@RequestMapping("/faq/faqUpdate.do")
public class FaqBoardUpdateController{

	@Inject
	IFaqBoardService service;

	//retrieve -> 검색
	@GetMapping
	public String doGet(@RequestParam(name="what", required=true) int faq_no,
			Model model) throws Exception{
		FaqBoardVO faq = service.selectFaqBoard(faq_no);
		
		model.addAttribute("faq", faq);
		
		return "faq/faqForm";
	}
	
	@PostMapping
	public String doPost(
			@Validated(UpdateGroup.class) @ModelAttribute("faq") FaqBoardVO faq, 
			Errors errors, Model model ) throws Exception {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		if (valid) {
//			System.out.println(faq.getFaq_no());
			// 수정할 정보, 지울 파일에 대한 정보(metadata, binary), 신규 업로드된 파일 정보
			ServiceResult result = service.updateFaqBoard(faq);
//			System.out.println(faq.getFaq_no());
			if(ServiceResult.OK.equals(result)) {
				goPage = "redirect:/faq/faqList.do?";
			}else {
				message = "서버 오류, 나중에 다시 시도.";
				goPage = "faq/faqForm";
			}
		} else {
			goPage = "faq/faqForm";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
}
