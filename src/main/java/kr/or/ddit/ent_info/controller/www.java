package kr.or.ddit.ent_info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 채용 공고 페이지로 이동(연습)
@Controller
public class www {
	@RequestMapping(value="/www", method=RequestMethod.GET)
	public String guestBookView(){
		return "ent_info/www";
	}
}
