package kr.or.ddit.blog.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.blog.service.IBlogBoardService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogBoardVO;

@Controller
public class BlogDeleteController {
	
	@Inject
	IBlogBoardService service;
	
	@RequestMapping("/bloghome/blogBoardDelete.do")
	public String process(
			@RequestParam(name="what", required=true) int bb_no,
			RedirectAttributes redirectAttributes
			) {
		BlogBoardVO board = new BlogBoardVO();
		board = service.retrieveBlogBoard(bb_no);
		int bbno = board.getBb_no();
		long bc_no = board.getBc_no();
		
		ServiceResult result = service.removeBlogBoard(board);
		String goPage="";
		String message="";
		
		switch (result) {
		case FAILED:
			goPage = "redirect:/bloghome/blogView.do?bb_no="+bbno;
			message = "서버 오류";
			break;
		default:
			goPage = "redirect:/bloghome/blogboardlist.do?bc_no="+bc_no;
			message = board.getBb_no()+"번 글 삭제 성공";
			break;
		}
		redirectAttributes.addFlashAttribute("message", message);
		return goPage;
	}
	
	
}
