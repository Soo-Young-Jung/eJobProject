package kr.or.ddit.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.mypage.service.IMypageService;

@Controller
public class AuthController {
	
	@Inject
	IMypageService service;
	
	String dive;
	
	
}
