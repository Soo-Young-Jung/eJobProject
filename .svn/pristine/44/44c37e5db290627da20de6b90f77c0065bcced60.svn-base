
package kr.or.ddit.suggestion.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.suggestion.service.ISuggestionService;

@Controller
public class SuggetionViewController {
	@Inject
	ISuggestionService service;
	
	@RequestMapping(value="/suggestion1", method=RequestMethod.GET)
	public String guestBookView(HttpServletRequest req, Model model){
	
	
		return "suggestion/suggestionView";
	}
}
