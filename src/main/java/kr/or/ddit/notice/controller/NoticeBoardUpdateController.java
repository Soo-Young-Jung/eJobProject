package kr.or.ddit.notice.controller;

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

import kr.or.ddit.notice.service.INoticeBoardService;
import kr.or.ddit.common.UpdateGroup;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.NoticeBoardVO;

@Controller
@RequestMapping("/notice/noticeUpdate.do")
public class NoticeBoardUpdateController{

	@Inject
	INoticeBoardService service;

	//retrieve -> 검색
	@GetMapping
	public String doGet(@RequestParam(name="what", required=true) int not_no,
			Model model) throws Exception{
		NoticeBoardVO notice = service.selectNotice(not_no);
		
		model.addAttribute("notice", notice);
		
		return "notice/noticeForm";
	}
	
	@PostMapping
	public String doPost(
			@Validated(UpdateGroup.class) @ModelAttribute("notice") NoticeBoardVO notice, 
			Errors errors, Model model ) throws Exception {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		if (valid) {
			System.out.println(notice.getNot_no());
			// 수정할 정보, 지울 파일에 대한 정보(metadata, binary), 신규 업로드된 파일 정보
			ServiceResult result = service.updateNotice(notice);
			System.out.println(notice.getNot_no());
			if(ServiceResult.OK.equals(result)) {
				goPage = "redirect:/notice/noticeView.do?what="+notice.getNot_no();
			}else if(ServiceResult.INVALIDPASSWORD.equals(result)) {
				message = "비밀번호 오류";
				goPage = "notice/noticeForm";
			}else {
				message = "서버 오류, 나중에 다시 시도.";
				goPage = "notice/noticeForm";
			}
		} else {
			goPage = "notice/noticeForm";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
}
