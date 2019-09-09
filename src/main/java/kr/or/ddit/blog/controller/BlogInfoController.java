package kr.or.ddit.blog.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.blog.dao.IBlogDAO;
import kr.or.ddit.blog.dao.IFollowDAO;
import kr.or.ddit.blog.service.IBCategoryService;
import kr.or.ddit.blog.service.IFollowService;
import kr.or.ddit.blog.service.IHashtagService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mypage.service.IMypageService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.BlogCategoryVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.FollowVO;
import kr.or.ddit.vo.HashtagVO;
import kr.or.ddit.vo.MemberLicVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ResumeVO;

@Controller
public class BlogInfoController {
	
	@Inject
	IBlogDAO dao;
	
	@Inject
	IMypageService service;
	
	@Inject
	IBCategoryService categoryService;
	
	@Inject
	IHashtagService hashService;
	
	@RequestMapping("bloghome/blogInfo.do")
	public String goPage(
			@RequestParam(name="what", required=true) String what,
			Model model, HttpSession session
			) {
		String mem_id = "";
		List<FollowVO> memFolList = new ArrayList<>();
		MemberVO member = new MemberVO();
		
		if(session.getAttribute("mem_id")==null) {
			mem_id = "";
		}else {
			mem_id = (String) session.getAttribute("mem_id");
			
			member = service.searchMember(mem_id);
			
			memFolList = dao.selectFollowList(mem_id);
			member.setFollowList(memFolList);
		}
		
		BlogVO blog = dao.selectBlog(what);
		
		List<MemberLicVO> memberLicList = dao.selectLicList(what);
		blog.setMemberLicList(memberLicList);
		
		List<FollowVO> followList = dao.selectFollowList(what);
		blog.setFollowList(followList);
		
		List<BlogCategoryVO> categoryList = categoryService.retrieveCategoryList(what);
		model.addAttribute("categoryList", categoryList);
		blog.setCategoryList(categoryList);
		
		List<HashtagVO> hashList = hashService.famousHashtag();
		model.addAttribute("hashList", hashList);
		blog.setHashList(hashList);
		
		ResumeVO jobsearch = dao.selectJobStatus(what);
		
		if(jobsearch==null || jobsearch.equals("")) {
			blog.setJobsearch("이력서를작성해주세요.");
		}else {
			blog.setJobsearch(jobsearch.getJobsearch());
		}
		model.addAttribute("blog", blog);
		model.addAttribute("member", member);
		session.setAttribute("blog", blog);
		
		return "blogHome/blogInfo";
	}
	
	@Inject
	IFollowDAO followDao;
	
	@Inject
	IFollowService followService;
	
	@Inject
	IAlarmService alarmService;
	
	@RequestMapping("bloghome/insertFollow.do")
	public String follow(
		@RequestParam(name="follow_mem", required=true) String follow_mem,
		@RequestParam(name="mem_id", required=true) String mem_id,
		Model model
			) {
		String goPage = null;
		String message = null;
		
		FollowVO follow = new FollowVO();
		follow.setFollow_mem(follow_mem);
		follow.setMem_id(mem_id);

		ServiceResult result = followService.addFollow(follow);
		if(ServiceResult.OK.equals(result)) {
			AlarmVO alarm = new AlarmVO();
			alarm.setMem_id1(follow.getFollow_mem());
			alarm.setMem_id2(follow.getMem_id());
			alarmService.followNotice(alarm);
			
			goPage = "redirect:/bloghome/blogInfo.do?what="+follow.getFollow_mem();
		}else {
			message = "서버오류, 쫌따 다시.";
			goPage = "blogHome/blogInfo";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
	
	@RequestMapping("bloghome/deleteFollow.do")
	public String delFollow(
		@RequestParam(name="follow_mem", required=true) String follow_mem,
		@RequestParam(name="mem_id", required=true) String mem_id,
		Model model
			){
		String goPage = null;
		String message = null;
		
		FollowVO follow = new FollowVO();
		follow.setFollow_mem(follow_mem);
		follow.setMem_id(mem_id);

		ServiceResult result = followService.delFollow(follow);
		if(ServiceResult.OK.equals(result)) {
			goPage = "redirect:/bloghome/blogInfo.do?what="+follow.getFollow_mem();
		}else {
			message = "서버오류, 쫌따 다시.";
			goPage = "blogHome/blogInfo";
		}
		model.addAttribute("message", message);
		
		return goPage;
	}
	
}
