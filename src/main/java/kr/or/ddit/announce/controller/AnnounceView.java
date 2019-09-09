package kr.or.ddit.announce.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.announce.dao.IAnnounceDAO;
import kr.or.ddit.announce.service.IAnnounceService;
import kr.or.ddit.ent_info.service.IEnt_infoService;
import kr.or.ddit.exception.CommonException;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.Ent_info2VO;

@Controller
@RequestMapping("/announce/announceView.do")
public class AnnounceView {
	
	@Inject
	IAnnounceService service;
	@Inject
	IEnt_infoService ieService;
	@Inject
	IAnnounceDAO dao;
	
	@GetMapping
	@Transactional
	public String doGet(
			@RequestParam(required=true) Integer annl_no,
			HttpSession session,
			Model model
			) {
		Map<String, Integer> chartData = new HashMap<>(); 
		
		AnnounceVO announceVO = service.retrieveAnnounce(annl_no);
		
		if(announceVO.getAnnl_no() == null) {
			throw new CommonException();
		}
		
		chartData = dao.selectChartData(annl_no);
		
		Map<String, String> scrap = new HashMap<String, String>();
		scrap.put("annl_no", annl_no+"");
		String mem_id = (String) session.getAttribute("mem_id");
		scrap.put("mem_id", (String) session.getAttribute("mem_id"));
		
		if(StringUtils.isNoneBlank(mem_id)) {
			if(service.selectScrap(scrap) == 0) {
				model.addAttribute("scrap", true);      
 			} else {
				model.addAttribute("scrap", false);   
			}
		}
		
		String colseing = announceVO.getAnnl_closeing();
		
		String year = colseing.split("-")[0];
		String month = colseing.split("-")[1];
		String day = colseing.split("-")[2];
		
		Map<String, String> date = new HashMap<>();
		
		date.put("year", year);
		date.put("month", month);
		date.put("day", day);
		
		Ent_info2VO ent_info = ieService.retrieveEnt_info(announceVO.getMem_id());
		
		model.addAttribute("ent_info", ent_info);
		model.addAttribute("date", date);
		model.addAttribute("announceVO", announceVO);
		model.addAttribute("chartData", chartData);
		
  		return "announce/announceView";
	}
	
}
