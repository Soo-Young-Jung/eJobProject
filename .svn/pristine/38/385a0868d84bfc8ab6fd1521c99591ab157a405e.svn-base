package kr.or.ddit.event.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.EventAttatchVO;
import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.PagingVO;

public interface IEventService {
	public ServiceResult createEvent(EventVO event); // 삽입
	public long retrieveEventCount(PagingVO<EventVO> pagingVO); // 패이지 카운트
	public List<EventVO> retrieveEventList(PagingVO<EventVO> pagingVO); // 전체 리스트
	public List<EventVO> selectEventList1();
	public List<EventVO> selectEventList2(String evt_organizer); // 주최기관 리스트
	public List<EventVO> selectEventList3(String evt_qualification); // 참가자격 리스트
	public EventVO retrieveEvent(long event_no); 
	public ServiceResult modifyEvent(EventVO event);
	public ServiceResult removeEvent(EventVO event);
	
	public EventAttatchVO download(long att_no);
	
	//이벤트 메인 화면에 최신 3개만 띄우기
	public List<EventVO> retrieveRecentEvent();
}
