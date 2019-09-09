package kr.or.ddit.event.dao;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BlogBoardAttatchVO;
import kr.or.ddit.vo.EventAttatchVO;
import kr.or.ddit.vo.EventVO;

@Repository
public interface IEventAttatchDAO {
	// Spring 프레임웤에서 사용.
	public int insertAttatch(EventAttatchVO attatchVO);
	// Spring 이전에 트랜잭션 관리를 직접 하기 위한 메소드.
	public EventAttatchVO selectAttatch(long evt_no);
	public void incrementDownCount(long evt_no);
	public int deleteAttatch(long evt_no);
}
