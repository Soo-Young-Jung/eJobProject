package kr.or.ddit.login.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import kr.or.ddit.blog.service.IBlogService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.mypage.service.IMypageService;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.MemberVO;

@Controller
public class JoinController {
	
	@Inject
	ILoginService service;
	
	@Inject
	IBlogService blogService;
	
	@Inject
	IMypageService mypageService;
	
	@RequestMapping(value="/join/join.do", method=RequestMethod.GET)
	public String join() {
		return "login/joinchose";
	}
	
	@RequestMapping(value="/join/genJoin.do", method=RequestMethod.GET)
	public String genJoin() {
		return "login/join";
	}
	
	@RequestMapping(value="/join/entJoin.do", method=RequestMethod.GET)
	public String entJoin() {
		return "login/entjoin";
	}
	
	
	@RequestMapping(value="/join/join.do", method=RequestMethod.POST)
	public String join(Model model,@Valid @ModelAttribute("member") MemberVO member, Errors errors, HttpSession session) {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		boolean success = false;
		BlogVO blog = new BlogVO();
		blog.setMem_id(member.getMem_id());
		blog.setMem_name(member.getMem_name());
		
		if(valid) {
			ServiceResult result = service.idCheck(member.getMem_id());
			
			if(ServiceResult.OK.equals(result)) {
				result = service.insertGen(member);
				
				if(ServiceResult.OK.equals(result)) {
					blogService.createBlog(blog);
					success = true;
					goPage = "login/welcome";
				}else {
					message = "회원가입에 실패했습니다";
					goPage = "/login/join";
				}
				
			}else {
				message = "아이디 중복체크를 해주세요";
				goPage = "login/join";
			}
			
		}else {
			goPage = "login/join";
		}
		
		model.addAttribute("success", success);
		model.addAttribute("message", message);
		session.setAttribute("message", message);
		model.addAttribute("member", member);
		return goPage;
	}
	
	@RequestMapping(value="/join/entjoin.do", method=RequestMethod.POST)
	public String joinEnt(@Valid @ModelAttribute("member") MemberVO member, Errors errors, Model model, HttpSession session) {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		boolean success = false;
		
		BlogVO blog = new BlogVO();
		blog.setMem_id(member.getMem_id());
		blog.setMem_name(member.getMem_name());
		
		if(valid) {
			ServiceResult result = service.insertEnt(member);
			
			if(ServiceResult.OK.equals(result)) {
				blogService.createBlog(blog);
				success = true;
				message = "성공";
				session.setAttribute("mem_id", member.getMem_id());
				goPage = "login/entinfo";
			}else {
				message = "회원가입에 실패했습니다";
				goPage = "login/entjoin";
			}
			
			model.addAttribute("success", success);
			model.addAttribute("message", message);
		}else {
			goPage = "login/entjoin";
		}
		
		return goPage;
	}
	
	@RequestMapping(value="/join/entinfo.do", method=RequestMethod.POST)
	public String joinEnt(@Valid @ModelAttribute("ent") Ent_infoVO ent, Errors errors, @ModelAttribute String mem_id, Model model, HttpSession session) {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		boolean success = false;
		
		if(valid) {
			ServiceResult result = service.insertEntInfo(ent);
			
			if(ServiceResult.OK.equals(result)) {
				success = true;
				message = "성공";
				goPage = "login/welcome";
			}else {
//				MemberVO member = (MemberVO) session.getAttribute("member");
//				session.setAttribute("member", member);
				message = "회원가입에 실패했습니다";
				goPage = "login/entinfo";
			}
			
			model.addAttribute("success", success);
			model.addAttribute("message", message);
		}else {
			goPage = "login/entinfo";
		}
		
		return goPage;
	}
}
