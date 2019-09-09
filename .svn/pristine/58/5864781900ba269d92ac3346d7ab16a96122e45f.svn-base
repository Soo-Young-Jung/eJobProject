package kr.or.ddit.blog.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.blog.service.IBCategoryService;
import kr.or.ddit.blog.service.IBlogService;
import kr.or.ddit.blog.service.IHashtagService;
import kr.or.ddit.common.UpdateGroup;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogCategoryVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.HashtagVO;

@Controller
@RequestMapping("/bloghome")
public class BlogOptionController {
	
	@Inject
	IBlogService service;
	
	@Inject
	IBCategoryService categoryService;
	
	@Inject
	IHashtagService hashService;
	
	@RequestMapping(value="blogOption.do")
	public String option(
			@RequestParam(name="what", required=false) String what,
			Model model, HttpSession session
			) {
//		String what = (String) session.getAttribute("mem_id");
		BlogVO blog = service.retrieveBlog(what);
		
		List<BlogCategoryVO> blogCategory = categoryService.retrieveCategoryList(what);
		blog.setCategoryList(blogCategory);
		
		List<HashtagVO> hashList = hashService.famousHashtag();
		blog.setHashList(hashList);
		
		model.addAttribute("blog", blog);
		session.setAttribute("blog", blog);
		
		return "blogHome/blogoption";
	}
	
	@GetMapping
	private String doGet(
			@RequestParam(name="mem_id", required=true) String mem_id,
			Model model, HttpSession session
			){
		BlogVO blog = service.retrieveBlog(mem_id);
		
		List<BlogCategoryVO> categoryList = categoryService.retrieveCategoryList(mem_id);
		model.addAttribute("categoryList", categoryList);
		blog.setCategoryList(categoryList);
		
		List<HashtagVO> hashList = hashService.famousHashtag();
		model.addAttribute("hashList", hashList);
		blog.setHashList(hashList);
		
		model.addAttribute("blog", blog);
		session.setAttribute("blog", blog);
		
		return "blogHome/blogoption";
	}
	
	@RequestMapping(value="blogUpdate.do")
	public String doPost(
			@Validated(UpdateGroup.class) @ModelAttribute("blog") BlogVO blog,
			Errors errors, Model model
			) {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		
		if (valid) {
			ServiceResult result = service.modifyBlog(blog);
			if(ServiceResult.OK.equals(result)) {
				goPage = "redirect:/bloghome/blogOption.do?what="+blog.getMem_id();
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
	
}
