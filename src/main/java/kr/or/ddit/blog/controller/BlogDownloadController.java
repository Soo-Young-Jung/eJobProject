package kr.or.ddit.blog.controller;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.blog.service.IBlogBoardService;
import kr.or.ddit.mypage.service.IMypageService;
import kr.or.ddit.vo.BlogBoardAttatchVO;
import kr.or.ddit.vo.MypageAttatchVO;

@Controller
public class BlogDownloadController{
	
	@Inject
	IBlogBoardService service;
	
	@Inject
	IMypageService mypageService;
	
	@RequestMapping("/bloghome/download.do")
	public String process(@RequestParam(name="what", required=true) long ba_no,
			@RequestParam(name="div", required=true) String div,
			Model model ) throws IOException{
		if(div.equals("BL")) {
			BlogBoardAttatchVO attatch = service.download(ba_no);
			model.addAttribute("blAttatch", attatch);
		}else {
			MypageAttatchVO attatch = mypageService.selectAttatch(ba_no);
			model.addAttribute("myAttatch", attatch);
		}
		
		model.addAttribute("div", div);
		
		return "BlogDownloadView";
	}

}