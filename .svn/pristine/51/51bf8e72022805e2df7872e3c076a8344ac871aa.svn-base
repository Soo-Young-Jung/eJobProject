package kr.or.ddit.blog.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.blog.service.IBCategoryService;
import kr.or.ddit.blog.service.IBlogBoardService;
import kr.or.ddit.vo.BlogBoardPagingVO;
import kr.or.ddit.vo.BlogBoardVO;

@Controller
public class BlogListController {
	
	@Inject
	IBlogBoardService service;
	
	@Inject
	IBCategoryService categoryService;
	
	@RequestMapping(value="/bloghome/blogboardlist.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public BlogBoardPagingVO<BlogBoardVO> ajaxList(
			@RequestParam(name="bc_no", required=true) long bc_no,
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="searchWord", required=false) String searchWord,
			@CookieValue(name="JSESSIONID", required=false) String sessionId,
			Model model
			){
		list(bc_no, currentPage, searchType, searchWord, sessionId, model);
		return ((BlogBoardPagingVO<BlogBoardVO>) model.asMap().get("blogBoardPagingVO"));
	}
	
	@RequestMapping("/bloghome/blogboardlist.do")
	public String list(
			@RequestParam(name="bc_no", required=true) long bc_no,
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(name="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(name="searchWord", required=false, defaultValue="") String searchWord,
			@CookieValue(name="JSESSIONID", required=false) String sessionId,
			Model model
			){
		BlogBoardPagingVO<BlogBoardVO> blogBoardPagingVO = new BlogBoardPagingVO<>();
		List<BlogBoardVO> blogBoardList;
		blogBoardPagingVO.setSearchType(searchType);
		blogBoardPagingVO.setSearchWord(searchWord);
		blogBoardPagingVO.setCurrentPage(currentPage);
		
		String bc_name = (categoryService.retrieveCategory(bc_no)).getBc_name();
		
		long totalRecord = service.retrieveBoardCount(blogBoardPagingVO, bc_no);
		
		blogBoardPagingVO.setTotalRecord(totalRecord);
		
		blogBoardList = service.retrieveBlogBoardList(blogBoardPagingVO, bc_no);
		blogBoardPagingVO.setDataList(blogBoardList);
		
		model.addAttribute("bc_no", bc_no);
		model.addAttribute("bc_name", bc_name);
		model.addAttribute("blogBoardPagingVO", blogBoardPagingVO);
		
		return "blogHome/bloglist";
	}
}
