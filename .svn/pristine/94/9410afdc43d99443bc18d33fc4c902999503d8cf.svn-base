package kr.or.ddit.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.service.ILoginService;

@RestController
public class idCheckController {
	
	@Inject
	ILoginService service;
	
	@RequestMapping(value = "/login/genCheck.do", method= RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Object> checkId(@RequestParam(name="mem_id", required=true) String mem_id) {
		Map<String, Object> result = new HashMap<String, Object>();
		String message = null;
		boolean success = false;
		
		ServiceResult Serviceresult = service.idCheck(mem_id);
		
		if(ServiceResult.OK.equals(Serviceresult)) {
			message = "사용가능한 아이디 입니다";
			success = true;
		}else {
			message = "사용이 불가능한 아이디 입니다";
		}
		
		result.put("success", success);
		result.put("message", message);
		return result;
	}
	

}
