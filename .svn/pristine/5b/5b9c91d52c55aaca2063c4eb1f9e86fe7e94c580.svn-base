package kr.or.ddit.alarm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.vo.AlarmVO;

@Controller
public class AlarmController {
	
	@Inject
	IAlarmService service;
	
	@RequestMapping(value="alarm/alarmList.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<AlarmVO> list(
			HttpSession session,
			Model model
			) {
		List<AlarmVO> alarmList= new ArrayList<>();
		String mem_id = (String) session.getAttribute("mem_id");
		if(StringUtils.isBlank(mem_id)) {
			return alarmList;
		}else {
			alarmList = service.retrieveNoticeList(mem_id);
			
			return alarmList;
		}
	}
	
}
