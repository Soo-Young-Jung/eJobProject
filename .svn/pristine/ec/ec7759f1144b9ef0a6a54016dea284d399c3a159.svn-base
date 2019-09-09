package kr.or.ddit.error.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class error {
	
	

		@GetMapping(value="/error.do")
	public String doGet(HttpServletRequest request, Model model) {
		
		int error = (int) request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		
		model.addAttribute("error", error);
		
		
		return "errors/error";
	}

}
