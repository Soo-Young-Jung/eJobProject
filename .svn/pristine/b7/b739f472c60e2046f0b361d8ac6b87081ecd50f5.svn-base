package kr.or.ddit.event.controller;

import java.io.File;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.vo.EventAttatchVO;

@Controller
public class DownloadController{
	
	@Inject
	IEventService service;
	
	@RequestMapping("/board/download.do")
	public String process(@RequestParam(name="what", required=true) long att_no, 
			Model model ) throws IOException{
		EventAttatchVO attatch = service.download(att_no);
		
		model.addAttribute("attatch", attatch);
	
		return "downloadView";
	}

}









