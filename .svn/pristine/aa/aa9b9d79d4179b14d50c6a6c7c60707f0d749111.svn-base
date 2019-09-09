package kr.or.ddit.announce.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface IRecommendDAO {
	
	public long selectMyAnnounceCount(PagingVO pagingVO);
	
	public List<AnnounceVO> selectMyAnnounceList(PagingVO pagingVO);
	
	public int insertRecommend(Map<String, Object> recommend);
	
	
}
