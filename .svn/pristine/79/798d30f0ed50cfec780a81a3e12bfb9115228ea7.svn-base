package kr.or.ddit.event.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SuggestionVO;

@Repository
public interface IEventDAO {
	
	public int insertEvent(EventVO board);
	public long selectEventCount(PagingVO<EventVO> pagingVO);
	public List<EventVO> selectEventList(PagingVO<EventVO> pagingVO);
	public List<EventVO> selectEventList1();
	public List<EventVO> selectEventList2(String evt_organizer);
	public List<EventVO> selectEventList3(String evt_qualification);

	public EventVO selectEvent(long bo_no);

	public int updateEvent(EventVO event);
	public int deleteEvent(EventVO event );
	
	//이벤트 메인 화면에 최신 3개만 띄우기
	public List<EventVO> selectRecentEvent();
	
}
