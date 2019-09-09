package kr.or.ddit.announce.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.announce.service.IAnnounceService;
import kr.or.ddit.announce.service.IRecommendService;
import kr.or.ddit.ent_info.service.IEnt_infoService;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.mail.Mail;
import kr.or.ddit.member.service.MemberfoService;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.Ent_info2VO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

@RestController
@RequestMapping(value="/recommend.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
public class RecommendList {
	
	@Inject
	IRecommendService service;
	@Inject
	IAnnounceService annService;
	@Inject
	ILoginService userService;
	@Inject
	IEnt_infoService entService;
	@Inject
	MemberfoService memService;
	
	Mail mail;
	
	
	@GetMapping
	public PagingVO<AnnounceVO> list(@RequestParam(required=false, name="page", defaultValue="1") long currentPage,
			HttpSession session){
		String mem_id = (String) session.getAttribute("mem_id");
		
		PagingVO pagingVO = new PagingVO<>(10, 10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSearchWord(mem_id);
		
		long totalRecord = service.selectMyAnnounceCount(pagingVO);
		
		List<AnnounceVO> announceList = service.selectMyAnnounceList(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setDataList(announceList);
		
		return pagingVO;
	}
	
	@PostMapping
	@Transactional
	public Map<String, Boolean> post(
			@RequestParam(required=true) String blog_mem_id
			,@RequestParam(value="annl_no[]", required=true) Integer[] annl_no
			, HttpSession session
			){
		
		
		
		Map<String, Boolean> resp = new HashMap<>();
		String mem_id2 = (String) session.getAttribute("mem_id");
		
		resp.put("succ", false);
		
		for(Integer annl : annl_no) {
			Map<String, Object> recommend = new HashMap<String, Object>();
			recommend.put("annl_no", annl);
			recommend.put("mem_id", blog_mem_id);
			recommend.put("mem_id2", mem_id2);
			service.insertRecommend(recommend);
			resp.put("succ", true);
			
			
			AnnounceVO announceVO = annService.retrieveAnnounce(annl);
			Ent_info2VO ent_info2VO = entService.retrieveEnt_info(announceVO.getMem_id());
			MemberVO memberVO = memService.retrieveMember(blog_mem_id);
			
			mail = new Mail();
			
			mail.rec(memberVO, announceVO, ent_info2VO);
		}
		
		return resp;
	}
	
	
	
	
	
}
