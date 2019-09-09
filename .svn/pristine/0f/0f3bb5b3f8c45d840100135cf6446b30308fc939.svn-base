package kr.or.ddit.ent_info.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ent_info.service.IEnt_infoService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.MemberVO;

@Controller
public class MemberInsertController {

	@Inject
	IEnt_infoService service;
	
	@PostMapping("/insert")
	public String doPost(@ModelAttribute MemberVO member, Errors errors, Model model) {
//		boolean valid = !errors.hasErrors();
		String goPage = null;
//		String message = null;
		ServiceResult result = service.insert(member);
		if(result.equals(ServiceResult.OK)) {
			goPage = "122";
		}
		return goPage;
	}
	
	@RequestMapping(value="/iii", method=RequestMethod.GET)
	public String guestBookView(){
		return "ent_info/ent_infoInsert";
	}
	
}
