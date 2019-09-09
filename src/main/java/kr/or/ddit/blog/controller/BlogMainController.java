package kr.or.ddit.blog.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.blog.service.IBlogService;

@Controller
public class BlogMainController {
	
	@Inject
	IBlogService service;
	
	@RequestMapping("blogmain/blogMain.do")
	public String home() {
		return "blogMain/blogmain";
	}
}
