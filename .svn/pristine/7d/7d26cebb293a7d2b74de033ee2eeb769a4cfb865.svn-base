package kr.or.ddit.blog.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.blog.service.IHashtagService;
import kr.or.ddit.vo.BlogBoardPagingVO;
import kr.or.ddit.vo.BlogBoardVO;

@Controller
public class BlogHashtagController {

	@Inject
	IHashtagService hashService;
	
	@RequestMapping("/bloghome/blogtaglist.do")
	public String list(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="searchWord", required=false) String searchWord,
			@CookieValue(name="JSESSIONID", required=false) String sessionId,
			Model model
			){
		BlogBoardPagingVO<BlogBoardVO> blogBoardPagingVO = new BlogBoardPagingVO<>();
		List<BlogBoardVO> blogBoardList;
		blogBoardPagingVO.setSearchType(searchType);
		blogBoardPagingVO.setSearchWord(searchWord);
		
		blogBoardPagingVO.setCurrentPage(currentPage);
		
		long totalRecord = hashService.retrieveHashCount(blogBoardPagingVO);
		
		blogBoardPagingVO.setTotalRecord(totalRecord);
		
		blogBoardList = hashService.retrieveHashList(blogBoardPagingVO);
		blogBoardPagingVO.setDataList(blogBoardList);
		
		model.addAttribute("blogBoardPagingVO", blogBoardPagingVO);
		return "blogHome/bloglist";
	}
	
}
