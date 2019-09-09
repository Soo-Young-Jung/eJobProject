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
import kr.or.ddit.common.UpdateGroup;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogBoardVO;

@Controller
@RequestMapping("/bloghome/blogboardUpdate.do")
public class BlogUpdateController {
	
	@Inject
	IBlogBoardService service;
	
	@GetMapping
	private String doGet(
			@RequestParam(name="what", required=true) String what,
			Model model
			){
		BlogBoardVO blogBoard = service.retrieveBlogBoard(Integer.parseInt(what));
		
		model.addAttribute("blogBoard", blogBoard);
		
		return "blogHome/blogwriteform";
	}
	
	@PostMapping
	private String doPost(
			@Validated(UpdateGroup.class) @ModelAttribute("blogBoard") BlogBoardVO blogBoard,
			Errors errors,
			Model model
			) {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		if (valid) {
			// 수정할 정보, 지울 파일에 대한 정보(metadata, binary), 신규 업로드된 파일 정보
			ServiceResult result = service.modifyBlogBoard(blogBoard);
			if(ServiceResult.OK.equals(result)) {
				goPage = "redirect:/bloghome/blogView.do?what="+blogBoard.getBb_no();
			}else {
				message = "서버오류, 쫌따 다시.";
				goPage = "bloghome/blogwriteform";
			}
		} else {
			goPage = "bloghome/blogwriteform";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
	
}
