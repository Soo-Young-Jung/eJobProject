package kr.or.ddit.mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.announce.service.IAnnounceService;
import kr.or.ddit.ent_info.service.IEnt_infoService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.mypage.service.IMypageService;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.LoginRecordVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MypageAttatchVO;
import kr.or.ddit.vo.PagingVO;

@Controller
public class MypageController {

	@Inject
	IMypageService service;
	
	@Inject
	IAnnounceService annService;
	
	@Inject
	IEnt_infoService entService;
	
	@Autowired
	ILoginService loginService;
	
	String dive;
	
	@RequestMapping(value="mypage/main.do")
	public String myPage(@RequestParam String mem_id, Model model) {
		String div = loginService.divCheck(mem_id);
		if(div.equals("G")) {
			int count = service.countResume(mem_id);
			int annCnt = annService.appCount(mem_id);
			int scrapCnt = annService.countScrap(mem_id);
			
			List<AnnounceVO> announceList = annService.mainAccountList();
			
			model.addAttribute("announceList", announceList);
			
			model.addAttribute("count", count);
			model.addAttribute("annCnt", annCnt);
			model.addAttribute("scrapCnt", scrapCnt);
			return "mypage/mypage";
		}else if(div.equals("E")){
			int count = annService.selectAnnounceCountForMyOnGoing(mem_id);
			int annCnt = annService.selectAnnounceCountForEnd(mem_id);
			model.addAttribute("count", count);
			model.addAttribute("annCnt", annCnt);
			return "entmypage/entmypage";
		}else {
			return "adminmypage/adminmypage";
		}
	}
	
	@RequestMapping(value="mypage/authPath.do")
	public String authPath(@RequestParam("div") String menuDiv) {
		String goPage = null; 
		if(menuDiv.equals("login")) {
			dive = "login";
			goPage = "mypage/auth";
		}else if(menuDiv.equals("info")){
			dive = "info";
			goPage = "mypage/auth";
		}else if(menuDiv.equals("ent_info")){
			dive = "ent_info";
			goPage = "entmypage/auth";
		}else if(menuDiv.equals("ent_edit")) {
			dive = "ent_edit";
			goPage = "entmypage/auth";
		}else {
			dive = "ent_login";
			goPage = "entmypage/auth";
		}
		
		return goPage;
	}
	
	@RequestMapping(value="mypage/addresume.do")
	public String resumeAdd() {
		return "mypage/addresume";
	}
	
	@RequestMapping(value="mypage/loginrecord.do")
	public String loginRecord(@RequestParam(value="mem_id", required=false) String mem_id, Model model, HttpSession session,
							  @RequestParam(name="page", required=false, defaultValue="1") long currentPage) {
		if(dive.equals("login")) {
			PagingVO paging = new PagingVO(20, 5);
			paging.setCurrentPage(currentPage);
			paging.setTotalRecord(service.recordCount(mem_id));
			paging.setMem_id(mem_id);
			List<LoginRecordVO> list = service.recordList(paging);
			paging.setDataList(list);
			model.addAttribute("pagingVO", paging);
			
			return "mypage/loginrecord";
		}else if(dive.equals("ent_login")) {
			PagingVO paging = new PagingVO(20, 5);
			paging.setCurrentPage(currentPage);
			paging.setTotalRecord(service.recordCount(mem_id));
			paging.setMem_id(mem_id);
			List<LoginRecordVO> list = service.recordList(paging);
			paging.setDataList(list);
			model.addAttribute("pagingVO", paging);
			
			return "entmypage/loginrecord";
		}else if(dive.equals("info")){
			MemberVO member = service.searchMember(mem_id);
			model.addAttribute("member", member);
			return "mypage/infopage";
		}else if(dive.equals("ent_edit")){
			Ent_infoVO ent = service.searchEntInfo(mem_id);
			model.addAttribute("ent", ent);
			return "entmypage/entinfo";
		}else {
			MemberVO member = service.searchMember(mem_id);
			model.addAttribute("member", member);
			return "entmypage/entjoin";
		}
	}
	
	
	
	@RequestMapping(value="mypage/auth.do", produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> auth(@RequestParam String mail) {
		Map<String, Object> result = new HashMap<>();
		
		String mailcode = service.SendMail(mail);
		result.put("mailcode1", mailcode);
		return result;
	}
	
//	@ResponseBody
//	@RequestMapping(value="mypage/edit.do", method=RequestMethod.POST)
//	public String edit(@RequestParam String mem_id,
//					   @RequestParam String mem_pass,
//					   @RequestParam String mem_name,
//					   @RequestParam String mem_mail,
//					   @RequestParam String mem_tel,
//					   @RequestParam String mem_add1,
//					   @RequestParam String mem_add2,
//					   @RequestParam byte[] mem_image,
//					   Model model) {
//		MemberVO member = new MemberVO();
//		member.setMem_id(mem_id);
//		member.setMem_mail(mem_mail);
//		member.setMem_tel(mem_tel);
//		member.setMem_add1(mem_add1);
//		member.setMem_add2(mem_add2);
//		member.setMem_name(mem_name);
//		member.setMem_profile(mem_image);

//		
//		
//		
//		String message = null;
//		boolean success = false;
//		
//		ServiceResult result = service.editMember(member);
//		if(result.equals(ServiceResult.OK)) {
//			member = service.searchMember(mem_id);
//			success = true;
//			model.addAttribute("member", member);
//		}else {
//			message = "수정에 실패하였습니다";
//			model.addAttribute("message", message);
//		}
//		model.addAttribute("success", success);
//		return "mypage/infopage";
//	}
	
	@RequestMapping(value="mypage/edit.do", method=RequestMethod.POST)
	public String edit(@Validated MemberVO member, Errors errors, Model model
					   ) {
		String message = null;
		boolean success = false;
		String view = "jsonView";
		
		ServiceResult result = service.editMember(member);
		if(result.equals(ServiceResult.OK)) {
			member = service.searchMember(member.getMem_id());
			model.addAttribute("member", member);
			 view = "mypage/infopage";
		}else {
			message = "수정에 실패하였습니다";
			model.addAttribute("message", message);
		}
		model.addAttribute("success", success);
		return view;
	}
	
	@RequestMapping(value="mypage/editEntInfo", method=RequestMethod.POST)
	public String entEdit(Ent_infoVO ent) {
		ServiceResult result = service.editEntInfo(ent);
		if(result.equals(ServiceResult.OK)) {
			return "redirect:main.do?mem_id=" + ent.getMem_id();
		}
		return null;
	}

	
	@RequestMapping(value="mypage/findId.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchId(MemberVO member, Model model, HttpSession session) {
		boolean success = true;
		Map<String, Object> result = new HashMap<>();
		String id = service.searchId(member);
		result.put("id", id);
		model.addAttribute("success", success);
		return result;
	}
	
	@RequestMapping(value="mypage/findPass.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchPass(MemberVO member, Model model){
		boolean success = false;
		Map<String, Object> result = new HashMap<>();
		String pass = service.searchPass(member);
		model.addAttribute("success", success);
		result.put("pass", pass);
		return result;
	}
	
	@RequestMapping(value="mypage/editEntInfo.do")
	public String editEntInfo() {
		return "entmypage/entinfo";
	}
	
	@RequestMapping(value="mypage/editEnt.do")
	public String editEnt(@ModelAttribute MemberVO member, Model model) {
		ServiceResult result = service.editMember(member);
		
		if(result.equals(ServiceResult.OK)) {
			return "redirect:main.do?mem_id=" + member.getMem_id();
		}else {
			MemberVO mem = service.searchMember(member.getMem_id());
			model.addAttribute("member", mem);
			return "entmypage/entjoin";
		}
		
	}
	
	@RequestMapping(value="mypage/download.do")
	public String process(@RequestParam(name="what", required=true) long er_no, 
			Model model ) throws IOException{
		MypageAttatchVO attatch = service.selectAttatch(er_no);
		
		model.addAttribute("attatch", attatch);
		
		return "MypageDownloadView";
	}
}
