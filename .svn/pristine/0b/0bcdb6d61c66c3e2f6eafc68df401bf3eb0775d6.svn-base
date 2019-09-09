package kr.or.ddit.blog.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.blog.service.IBCategoryService;
import kr.or.ddit.common.InsertGroup;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogCategoryVO;

@Controller
public class BlogCategoryController {
	
	@Inject
	IBCategoryService categoryService;
	
	@RequestMapping("/bloghome/insertCategory.do")
	public String doPost(
			@Validated(InsertGroup.class) @ModelAttribute("blogCategory") BlogCategoryVO blogCategory,
			Errors errors, Model model
			) {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		
		String mem_id = blogCategory.getMem_id();
		
		if (valid) {
			ServiceResult result = categoryService.createCategory(blogCategory);
			if(ServiceResult.OK.equals(result)) {
				goPage = "redirect:/bloghome/blogOption.do?what="+mem_id;
			}else {
				message = "서버오류, 쫌따 다시.";
				goPage = "blogHome/blogoption";
			}
		} else {
			goPage = "blogHome/blogoption";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
	
	@RequestMapping("/bloghome/deleteCategory.do")
	public String process(
			@RequestParam(name="bc_no", required=true) long bc_no,
			@RequestParam(name="mem_id", required=true) String mem_id,
			RedirectAttributes redirectAttributes, Model model
			){
		BlogCategoryVO blogCategory = new BlogCategoryVO();
		blogCategory.setBc_no(bc_no);
		blogCategory.setMem_id(mem_id);
		
		ServiceResult result = categoryService.removeCategory(blogCategory);
		String goPage = null;
		String message = null;
		switch (result) {
		case FAILED:
			goPage = "redirect:/bloghome/blogOption.do?what="+mem_id;
			message = "서버 오류";
			break;
		default:
			goPage = "redirect:/bloghome/blogOption.do?what="+mem_id;
			message = blogCategory.getBc_no()+"삭제가 완료되었습니다.";
			break;
		}
		redirectAttributes.addFlashAttribute("message", message);
		return goPage;
	}
	
}
