package kr.or.ddit.suggestion.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.InsertGroup;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.suggestion.service.ISuggestionService;
import kr.or.ddit.vo.SuggestionVO;

@Controller
@RequestMapping("/suggestion/insert")
public class SuggestionInsertController {

	@Inject
	ISuggestionService service;
	
	@PostMapping
	public String doPost(
			@Validated(InsertGroup.class) @ModelAttribute SuggestionVO suggestion, 
			Errors errors, Model model ) {
		boolean valid = !errors.hasErrors();
		String goPage = null;
		String message = null;
		
		if (valid) {
		
			ServiceResult result = service.createSuggestion(suggestion);
	
			if(ServiceResult.OK.equals(result)) {
				goPage = "/suggestion/suggestionView";
			}
		} 
		model.addAttribute("message", message);
		
		return goPage;
	}
}
