package kr.or.ddit.event.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.ent_info.service.IEnt_infoService;
import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.vo.Ent_info2VO;
import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.PagingVO;

@Controller
public class EventListController {
	
	@Inject
	IEventService service;
	
	@RequestMapping(value="/event")
	public String list(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(required=false) String searchType,
			@RequestParam(required=false) String searchWord,	
 			Model model
	){
		PagingVO<EventVO> paging = new PagingVO<>(9,5);
		paging.setSearchType(searchType);
		paging.setSearchWord(searchWord);
		// 1. 
		paging.setCurrentPage(currentPage);
		
		long totalRecode = service.retrieveEventCount(paging);
		paging.setTotalRecord(totalRecode);
		
		List<EventVO> list = service.retrieveEventList(paging);

		
		paging.setDataList(list);
		
		model.addAttribute("pagingVO", paging);
		
		
		
		
		return "event/eventList";
		
	}
	
	@RequestMapping(value="/event1")
	public String list1(Model model) {
		List<EventVO> list = service.selectEventList1();
	
		model.addAttribute("event", list);
		return "event/eventList1";
	}
	
	@RequestMapping(value="/event2")
	public String list2(@RequestParam String evt_organizer, Model model ) {
		
		List<EventVO> list = service.selectEventList2(evt_organizer);
		
		model.addAttribute("event", list);
		return "event/eventList1";
	}

	
	
	
	
	
	
	@RequestMapping(value="/event3")
	public String list3( Model model ) {
		List<EventVO> list = service.selectEventList1();
		System.out.println(list.get(0).getEvt_title());
		System.out.println(list.get(0).getEvt_title());
		System.out.println(list.get(0).getEvt_title());
		System.out.println(list.get(0).getEvt_title());
		
		model.addAttribute("event", list);
		
	
		return "event/eventList2";
	}
	@RequestMapping(value="/event4")
	public String list4(@RequestParam String evt_qualification, Model model) {
		
		List<EventVO> list = service.selectEventList3(evt_qualification);
		model.addAttribute("event", list);
		return "event/eventList2";
	}
	
	
}
