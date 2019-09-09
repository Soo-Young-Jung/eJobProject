package kr.or.ddit.suggestion.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.UpdateGroup;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.suggestion.service.ISuggestionService;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SuggestionVO;

@Controller
@RequestMapping(value="/suggestion")
public class SuggestionListController {
	@Inject
	ISuggestionService service;
	
	@GetMapping( produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<SuggestionVO> selectList(@RequestParam(required=false, name="page", defaultValue="1" ) long currentPage,
			@RequestParam(required=false) String searchType,
			@RequestParam(required=false) String searchWord,
			 Model model){
		PagingVO<SuggestionVO> pagingVO = new PagingVO<>(10, 4);
		pagingVO.setSearchType(searchType);
		pagingVO.setSearchWord(searchWord);
		pagingVO.setFuncName("paging");
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setTotalRecord(service.retrieveSuggestionCount(pagingVO));
		pagingVO.setDataList(service.retrieveSuggestionList(pagingVO));
		int cnt = service.cnt();

		
		model.addAttribute("cnt", cnt);
		model.addAttribute("pagingVO", pagingVO);

		return pagingVO;
		
	}
	
	
	
//	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public PagingVO<SuggestionVO> selectList(Model model,@RequestParam(name="page",defaultValue="1",required=false) long currentPage){
//		// 페이징 처리 필요
//		PagingVO<SuggestionVO> paging = new PagingVO<SuggestionVO>(5,4);
//		
//		paging.setCurrentPage(currentPage);
//		
//		long totalRecode = service.retrieveSuggestionCount(paging);
//		paging.setTotalRecord(totalRecode);
//		
//		List<SuggestionVO> list = service.retrieveSuggestionList(paging);
//		paging.setDataList(list);
//		
//		model.addAttribute("pagingVO", paging);
//		
//		return (PagingVO<SuggestionVO>) model.asMap().get("pagingVO");
//	}
	
	

	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Object> insert(SuggestionVO suggestion, Errors errors, Model model
			){
		ServiceResult result = service.createSuggestion(suggestion);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(ServiceResult.OK.equals(result)) {
			resultMap.put("success", true);
			resultMap.put("license", suggestion);
		}else {
			resultMap.put("success", false);
			resultMap.put("message", "실패");
		}
		
		return resultMap;
	}
	
	// 새글쓰기
	@PostMapping("comment")
	public String insert(HttpServletRequest req, @ModelAttribute SuggestionVO suggestion, Errors errors, Model model
			){
		
		HttpSession session = req.getSession();
		String goPage = null;
		String message = null;
		
		if(session.getAttribute("mem_id")==null) {
			message = "로그인을 하세요.";
			goPage = "suggestion/suggestionView";
		}else if(session.getAttribute("mem_id")!=null && session.getAttribute("mem_id").equals(suggestion.getMem_id())) {
			
			ServiceResult result = service.createSuggestion(suggestion);
			suggestion = service.retrieveSuggestion(suggestion.getSug_no());
			model.addAttribute("suggestion", suggestion);
//			List<SuggestionVO> list =  service.reply(suggestion.getSug_no());
//			model.addAttribute("reply", list);
			
			goPage = "suggestion/suggestionView";
			
		}else {
			message = "권한이 없는 영역입니다.";
		}
		model.addAttribute("message", message);	
		

		return goPage;
	}
	// 댓글쓰기
	@PostMapping("comment2")
	public String insert2(HttpServletRequest req, @ModelAttribute SuggestionVO suggestion, Errors errors, Model model
			){
		
		HttpSession session = req.getSession();
		String goPage = null;
		String message = null;				
		
		if(session.getAttribute("mem_id")==null) {
			message = "로그인을 하세요.";
			goPage = "suggestion/suggestionView";
		}else if(session.getAttribute("mem_id")!=null && session.getAttribute("mem_id").equals("admin")) {
			ServiceResult result = service.createSuggestion(suggestion);
			suggestion = service.retrieveSuggestion(suggestion.getSug_no());
			model.addAttribute("suggestion", suggestion);
			message = "작성 완료!!!";
			goPage = "suggestion/suggestionView";
		}else {
			message = "권한이 없는 영역입니다.";
		}
		
		model.addAttribute("message", message);	
		
		return goPage;
	
	}
	
	
	@PostMapping("update")
	public String update(HttpServletRequest req, @ModelAttribute SuggestionVO suggestion, Errors errors, Model model){

		if(!errors.hasErrors()){
			ServiceResult result = service.modifySuggestion(suggestion);
			if(ServiceResult.OK.equals(result)){
				
			}else{
				model.addAttribute("message", "비밀번호 오류, 수정 실패");
			}
		}else{
			model.addAttribute("message", "누락 데이터 발생, 수정 실패");
		}
		return "suggestion/suggestionView";
	}
	
	
	
	@RequestMapping("update2")
	public String update2(HttpServletRequest req, @ModelAttribute SuggestionVO suggestion, 
			@RequestParam(name="sug_content1", defaultValue="1" ) String sug_content,
			@RequestParam(name="sug_content2", defaultValue="1" ) String sug_content2,
			Errors errors, Model model){
		HttpSession session = req.getSession();
		session.getAttribute("mem_id");
	
		String goPage = null;
		String message = null;
		
		
		
		
		suggestion.setSug_content(sug_content);
		suggestion.setSug_content(sug_content2);
		if(session.getAttribute("mem_id")==null) {
			message = "로그인을 하세요.";
			goPage = "suggestion/suggestionView";
			
		}
		else if(session.getAttribute("mem_id")!=null && session.getAttribute("mem_id").equals(suggestion.getMem_id())) {
	
			
			ServiceResult result = service.modifySuggestion(suggestion);

			
			goPage = "suggestion/suggestionView";
		}else {
			goPage = "suggestion/suggestionView";
			message = "권한이 없는 영역입니다.";
		}
		model.addAttribute("message", message);	
		
		return goPage;
	}
	
	@PostMapping("delete")
	public String delete(HttpServletRequest req, @ModelAttribute SuggestionVO suggestionVO, Errors errors, Model model) {
		HttpSession session = req.getSession();
		session.getAttribute("mem_id");
		String goPage = null;
		String message = null;
		
//		
//		
//		if(session.getAttribute("mem_id").equals("admin") || ) {
//			
//		}
		
		
		
		
		
		if(session.getAttribute("mem_id")==null) {
			message = "로그인을 하세요.";
			goPage = "suggestion/suggestionView";
			
		}else if(session.getAttribute("mem_id")!=null && session.getAttribute("mem_id").equals(suggestionVO.getMem_id())) {
			ServiceResult result = service.removeSuggestion(suggestionVO);
			message = "삭제를 완료했습니다.!!!";
			
		}else {
			message = "권한이 없는 영역입니다.";
		}
		
		model.addAttribute("message", message);
	
		
		return "suggestion/suggestionView";
	}
	

	@RequestMapping("information")
	public String process(
			@RequestParam(name="sug_no", required=true) int sug_no,
			Model model){
		
		SuggestionVO vo = service.retrieveSuggestion(sug_no);
				
		model.addAttribute("suggestion", vo);
		List<SuggestionVO> list =  service.reply(sug_no);
		model.addAttribute("reply", list);
	
		
		return "suggestion/suggestionInformation";
	}
	

	
}
