package kr.or.ddit.notice.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.notice.service.INoticeBoardService;
import kr.or.ddit.vo.NoticeBoardVO;


@Controller
public class NoticeBoardDeleteController{
	@Inject
	INoticeBoardService service;

	
	@RequestMapping("/notice/noticeDelete.do")
	public String process(
			@RequestParam(name="what", required=true) int not_no, 
//			@RequestParam(required=true) String not_pass,
			RedirectAttributes redirectAttributes
			) throws Exception{
		NoticeBoardVO notice = new NoticeBoardVO();
		//notice.
		//notice.setBo_pass(bo_pass);
		
		ServiceResult result = service.deleteNotice(not_no);
		String goPage = null;
		String message = null;
		switch (result) {
		case INVALIDPASSWORD:
			goPage = "redirect:/notice/noticeView.do?what="+not_no;
			message = "비번 오류";
			break;
		case FAILED:
			goPage = "redirect:/notice/noticeView.do?what="+not_no;
			message = "서버 오류";
			break;
		default:
//			post-REDIRECT-get : PRG 패턴
			goPage = "redirect:/notice/noticeList.do";
			message = not_no+"번 글 삭제 성공";
			break;
		}
		redirectAttributes.addFlashAttribute("message", message);
		return goPage;
	}

}









