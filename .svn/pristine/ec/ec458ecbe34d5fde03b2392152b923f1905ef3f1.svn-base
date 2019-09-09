package kr.or.ddit.blog.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.blog.service.IBCategoryService;
import kr.or.ddit.blog.service.IBlogBoardService;
import kr.or.ddit.blog.service.IBlogReplyService;
import kr.or.ddit.blog.service.IHashtagService;
import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.BlogReplyVO;
import kr.or.ddit.vo.HashtagVO;
import kr.or.ddit.vo.PagingVO;

@Controller
public class BlogViewController {
	
	@Inject
	IBlogBoardService service;
	
	@Inject
	IBCategoryService categoryService;
	
	@Inject
	IBlogReplyService replyservice;
	
	@Inject
	IHashtagService hashservice;
	
	@RequestMapping("/bloghome/blogView.do")
	public String process(
			@RequestParam(name="what", required=true) String what,
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			Model model
			) {
		BlogBoardVO blogboard = service.retrieveBlogBoard(Integer.parseInt(what));
		String member = (categoryService.retrieveCategory(blogboard.getBc_no())).getMem_id();
		blogboard.setBc_writer(member);
		List<HashtagVO> hashList = hashservice.retrieveBlogHashList(Integer.parseInt(what));
		blogboard.setHashtagList(hashList);
		
		model.addAttribute("blogboard", blogboard);
		
		return "blogHome/blogboardView";
	}
	
}
