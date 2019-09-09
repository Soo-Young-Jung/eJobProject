package kr.or.ddit.mypage.controller;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mypage.service.IMypageService;
import kr.or.ddit.vo.CareerVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MypageAttatchVO;
import kr.or.ddit.vo.ResumeVO;

@Controller
public class ResumeController {

	@Inject
	IMypageService service;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
	    binder.registerCustomEditor(MultipartFile.class, new PropertyEditorSupport() {
	        @Override
	        public void setAsText(String text) {
	            setValue(null);
	        }
	    });
	}
	
	@RequestMapping(value="mypage/resumeView.do")
	public String resumeView(@RequestParam("what") int er_no, Model model) {
		ResumeVO resume = service.searchResume(er_no);
		MemberVO member = service.searchMember(resume.getMem_id());
		MypageAttatchVO att = service.selectAttatch(er_no);
		CareerVO career = new CareerVO();
		career.setEr_career(resume.getEr_career());
		career.setEr_no(er_no);
		CareerVO resultCareer = service.searchCareer(career);
		model.addAttribute("resume", resume);
		model.addAttribute("member", member);
		model.addAttribute("att", att);
		model.addAttribute("career", resultCareer);
		
		return "mypage/resumeview";
	}
	
	@RequestMapping(value="mypage/addResume.do")
	public String addResume(@ModelAttribute ResumeVO resume, @ModelAttribute CareerVO career, Model model) {
		ServiceResult result = service.insertResume(resume);
		career.setEr_no(resume.getEr_no());
		ServiceResult result2 = service.insertCareer(career);
		
		if(result.equals(ServiceResult.OK) && result2.equals(ServiceResult.OK)) {
			return "redirect:main.do?mem_id=" + resume.getMem_id();
		}else {
			return "redirect:addresume.do";
		}
	}
	
	@RequestMapping(value="mypage/resumeStatus.do")
	public String resumeStatus(@RequestParam String mem_id, Model model) {
		List<ResumeVO> list = service.selectResume(mem_id);
		List<MypageAttatchVO> attList = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			long er_no = (long)list.get(i).getEr_no();
			MypageAttatchVO att = service.selectAttatch(er_no);
			attList.add(att);
		}
		model.addAttribute("list", list);
		model.addAttribute("attList", attList);
		return "mypage/resumestatus";
	}
	
	@RequestMapping(value="mypage/editResume.do")
	public String editResume(@RequestParam("what") int er_no, Model model) {
		ResumeVO resume = new ResumeVO();
		resume = service.searchResume(er_no);
		CareerVO career = new CareerVO();
		career.setEr_no(resume.getEr_no());
		career.setEr_career(resume.getEr_career());
		CareerVO careerResult = service.searchCareer(career);
		MypageAttatchVO att = service.selectAttatch(er_no);
		model.addAttribute("att", att);
		model.addAttribute("resume", resume);
		model.addAttribute("career", careerResult);
		model.addAttribute("edit", true);
		return "mypage/addresume";
	}
	
	@RequestMapping(value="mypage/editResume")
	public String editResume(ResumeVO resume, CareerVO career) {
		ServiceResult resultResume = service.editResume(resume);
		ServiceResult resultCareer = service.editCareer(career);
		
		if(resultResume.equals(ServiceResult.OK) && resultCareer.equals(ServiceResult.OK)) {
			return "redirect:resumeStatus.do?mem_id="+resume.getMem_id();
		}
		return "mypage/addresume";
	}
	
	@RequestMapping(value="mypage/addAttatch")
	public String addAttatch(ResumeVO resume, Model model) {
		ServiceResult result = service.insertMypageAttatch(resume);
		String message = null;
		
		if(result.equals(ServiceResult.OK)) {
			return "redirect:resumeStatus.do?mem_id="+ resume.getMem_id();
		}else {
			message = "등록에 실패하였습니다";
			model.addAttribute("success", false);
		}
		
		model.addAttribute("message", message);
		return "redirect:resumeStatus.do?mem_id="+ resume.getMem_id();
	}
	
	@RequestMapping(value="mypage/deleteResume.do")
	public String deleteResume(ResumeVO resume, CareerVO career, Model model) {
		ServiceResult resultResume = service.deleteResume(resume);
		ServiceResult resultCareer = service.deleteCareer(career);
		String message = null;
		
		if(resultResume.equals(ServiceResult.OK) && resultCareer.equals(ServiceResult.OK)) {
			return "redirect:resumeStatus.do?mem_id="+ resume.getMem_id();
		}else {
			message = "등록에 실패하였습니다";
			model.addAttribute("success", false);
		}
		
		model.addAttribute("message", message);
		return "redirect:resumeStatus.do?mem_id="+ resume.getMem_id();
	}
}
