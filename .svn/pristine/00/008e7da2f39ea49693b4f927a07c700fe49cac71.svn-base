package kr.or.ddit.announce.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.alarm.dao.IAlarmDAO;
import kr.or.ddit.announce.dao.IRecommendDAO;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class RecommendServiceImpl implements IRecommendService {
	
	@Inject
	IRecommendDAO dao;
	@Inject
	IAlarmDAO alDao;
	
	@Override
	public long selectMyAnnounceCount(PagingVO pagingVO) {
		return dao.selectMyAnnounceCount(pagingVO);
	}

	@Override
	public List<AnnounceVO> selectMyAnnounceList(PagingVO pagingVO) {
		return dao.selectMyAnnounceList(pagingVO);
	}

	@Override
	@Transactional
	public int insertRecommend(Map<String, Object> recommend) {
		
		AlarmVO alarm = new AlarmVO();
		
		alarm.setMem_id1((String) recommend.get("mem_id"));
		alarm.setMem_id2((String) recommend.get("mem_id2"));
		alarm.setAnnl_no((Integer) recommend.get("annl_no"));
		
		alDao.recommendNotice(alarm);
		
		return dao.insertRecommend(recommend);
	}

}
