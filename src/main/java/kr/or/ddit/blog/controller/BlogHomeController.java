package kr.or.ddit.blog.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.blog.service.IBCategoryService;
import kr.or.ddit.blog.service.IBlogService;
import kr.or.ddit.blog.service.IHashtagService;
import kr.or.ddit.mypage.service.IMypageService;
import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.BlogCategoryVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.HashtagVO;

@Controller
@RequestMapping("/bloghome")
public class BlogHomeController {
	
	@Inject
	IMypageService memservice;
	
	@Inject
	IBlogService service;
	
	@Inject
	IBCategoryService categoryService;
	
	@Inject
	IHashtagService hashService;
	
	@RequestMapping("blogHome.do")
	public String process(
			@RequestParam(name="what", required=true) String what,
			Model model, HttpSession session
			) {
		String mem_id = "";
		if(session.getAttribute("mem_id")==StringUtils.EMPTY) {
			mem_id = "";
		}else {
			mem_id = (String) session.getAttribute("mem_id");
		}
		
		BlogVO blog = service.retrieveBlog(what);
		
		List<BlogBoardVO> boardList = service.retrieveRecentBoard(what);
		
		if(boardList.size()>0) {
			for(int i = 0; i < boardList.size(); i++) {
				List<HashtagVO> hashList = hashService.retrieveBlogHashList(boardList.get(i).getBb_no());
				boardList.get(i).setHashtagList(hashList);
			}
		}
		blog.setBoardList(boardList);
		
		List<BlogCategoryVO> categoryList = categoryService.retrieveCategoryList(what);
		model.addAttribute("categoryList", categoryList);
		blog.setCategoryList(categoryList);
		
		List<HashtagVO> hashList = hashService.famousHashtag();
		model.addAttribute("hashList", hashList);
		blog.setHashList(hashList);
		
		model.addAttribute("blog", blog);
		session.setAttribute("blog", blog);
		
		return "blogHome/blogcontent";
	}
}
