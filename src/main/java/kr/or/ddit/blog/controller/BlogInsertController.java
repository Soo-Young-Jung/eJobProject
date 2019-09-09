package kr.or.ddit.blog.controller;

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

import kr.or.ddit.blog.service.IBlogBoardService;
import kr.or.ddit.blog.service.IHashtagService;
import kr.or.ddit.common.InsertGroup;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.HashtagVO;

@Controller
@RequestMapping("bloghome/blogWriteForm.do")
public class BlogInsertController {
	
	@Inject
	IBlogBoardService service;
	
	@Inject
	IHashtagService hashservice;
	
	@GetMapping
	public String doGet(
			@RequestParam(name="bc_no", required=true ) String bc_no,
			Model model
			) {
		long bc_num = Long.parseLong(bc_no);
		model.addAttribute("bc_no", bc_num);
		
		return "blogHome/blogwriteform";
	}
	
	@PostMapping
	public String doPost(
			@Validated(InsertGroup.class) @ModelAttribute("blogBoard") BlogBoardVO blogBoard,
			@Validated(InsertGroup.class) @ModelAttribute("hashtag") HashtagVO hashtag,
			Errors errors, Model model
			) {
		Boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		
//		if (valid) {
			blogBoard.getBb_no();
			ServiceResult result = service.createBlogBoard(blogBoard);
			hashtag.setBb_no(blogBoard.getBb_no());
			ServiceResult result2 = hashservice.createHashtag(hashtag);
			if(ServiceResult.OK.equals(result) && ServiceResult.OK.equals(result2)) {
				goPage = "redirect:/bloghome/blogView.do?what="+blogBoard.getBb_no();
			}else {
				message = "서버오류, 쫌따 다시.";
				goPage = "blogHome/blogwriteform";
			}
//		} else {
//			goPage = "bloghome/blogwriteform";
//		}
		model.addAttribute("message", message);
		
		return goPage;
	}
	
}
