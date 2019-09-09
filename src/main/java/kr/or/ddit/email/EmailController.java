package kr.or.ddit.email;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.blog.service.IBlogService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mypage.service.IMypageService;
import kr.or.ddit.vo.MemberVO;

@Controller
public class EmailController {
	
	@Inject
	IMypageService service;
	
	@Inject
	IBlogService blogService;
	
	@RequestMapping("bloghome/emailForm.do")
	public String emailForm(
			@RequestParam(name="mem_id", required=true) String mem_id,
			Model model
			) {
		MemberVO member = service.searchMember(mem_id);
		model.addAttribute("member", member);
		
		return "email/emailForm";
	}
	
	@RequestMapping(value="bloghome/sendEmail.do", produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	public String auth(@RequestParam HashMap<String, Object> map,
			Model model
			) {
		ServiceResult result = ServiceResult.FAILED;
		String goPage = "";
		String message = "";
		
		String mem_id = (String) map.get("mem_id");
		String mail = (String) map.get("mail");
		String subject = (String) map.get("subject");
		String content = (String) map.get("content");
		
		result = blogService.sendtoUser(mem_id, mail, subject, content);
		
		if(ServiceResult.OK.equals(result)) {
			goPage = "redirect:/bloghome/blogInfo.do?what="+mem_id;
		}else {
			message = "서버오류, 쫌따 다시.";
			goPage = "bloghome/blogInfo";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
	
}
