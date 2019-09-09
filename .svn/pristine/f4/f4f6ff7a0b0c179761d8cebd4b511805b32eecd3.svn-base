package kr.or.ddit.naver;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.service.ILoginService;
 
/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverHomeController {
    
	@Inject
	ILoginService service;
	    
	 @RequestMapping(value="/login/naverlogin.do", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	    public String naverLogin(@RequestParam("code") String code, Model model, HttpSession session) {
		 	System.out.println(code);
	        String goPage = null;
	        boolean success = false;
	        //카카오 rest api 객체 선언
	        naver_restapi kr = new naver_restapi();
	        //결과값을 node에 담아줌
	        JsonNode node = kr.getAccessToken(code);
	        //결과값 출력
	        String token = node.get("access_token").toString();
	        //세션에 담아준다.
	        session.setAttribute("token", token);
	        
	        JsonNode userInfo = kr.getKakaoUserInfo(token);
	        String id = "n" + userInfo.path("response").path("id").asText();
	        System.out.println(id);
//	        session.setAttribute("naverId", id);
	        model.addAttribute("naverId", id);
	        
//	        MemberVO member = new MemberVO();
//	        member.setMem_id(id);
	        ServiceResult result = service.idCheck(id);
	        
	        if(ServiceResult.FAILED.equals(result)) {
	        	service.loginRecord(id);
	        	goPage = "redirect:/";
	        }else {
	        	success = true;
	        	goPage = "login/join";
	        }
	        
	        session.setAttribute("success", success);
	        session.setAttribute("mem_id", id);
	        model.addAttribute("success", success);
	        model.addAttribute("mem_id", id);
	        
	        return goPage;
	    }
	 
}


