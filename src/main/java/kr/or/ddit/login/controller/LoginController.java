package kr.or.ddit.login.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.vo.MemberVO;

@Controller
public class LoginController {

	@Inject
	ILoginService service;

	@RequestMapping(value = "/login/genlogin.do", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginform";
	}
	
	

	@RequestMapping(value = "/login/genlogin.do", method = RequestMethod.POST)
	public String loginPost(@RequestParam(required=false) String saveId, MemberVO member, Model model, HttpSession session, HttpServletResponse resp) {

		String goPage = null;
		String message = null;
		boolean success = false;

		ServiceResult result = service.loginCheck(member);
		if (ServiceResult.OK.equals(result)) {
			ServiceResult loginRecord = service.loginRecord(member.getMem_id());
			int maxAge = 0;
			if("idSave".equals(saveId)) {
				maxAge = 60*60*24*7;
			}
			Cookie cookie = new Cookie("loginId", member.getMem_id());
			cookie.setMaxAge(maxAge);
			cookie.setPath("/");
			resp.addCookie(cookie);
			goPage = "redirect:/";
		} else if(ServiceResult.INVALIDPASSWORD.equals(result)){
			success = true;
			message = "아이디 또는 비밀번호가 잘못되었습니다";
			goPage = "login/loginform";
		}

		session.setAttribute("success", success);
		session.setAttribute("member", member);
		session.setAttribute("mem_id", member.getMem_id());
		model.addAttribute("message", message);
		model.addAttribute("success", success);
		return goPage;
	}
	
	@RequestMapping("/login/logout.do")
	public String process(HttpSession session){
		String goPage = null;
		if(session==null || session.isNew()) {
			session.setAttribute("message", "로그이부터 하지!!");
			goPage = "redirect:/login/loginform.do";
		}else {
			session.invalidate();
			goPage = "redirect:/";			
		}
		return goPage;
		
	}
	
	
}
