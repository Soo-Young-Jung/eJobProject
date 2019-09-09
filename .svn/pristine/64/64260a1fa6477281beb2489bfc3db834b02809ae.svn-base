package kr.or.ddit.alarm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.alarm.dao.IAlarmDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AlarmVO;

@Service
public class AlarmServiceImpl implements IAlarmService {
	
	@Inject
	IAlarmDAO dao;
	
	@Override
	public ServiceResult replyNotice(AlarmVO alarm) {
		int cnt = dao.replyNotice(alarm);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			result = ServiceResult.OK; 
		}
		return result;
	}

	@Override
	public ServiceResult followNotice(AlarmVO alarm) {
		int cnt = dao.followNotice(alarm);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			result = ServiceResult.OK; 
		}
		return result;
	}

	@Override
	public List<AlarmVO> retrieveNoticeList(String mem_id) {
		return dao.selectNoticeList(mem_id);
	}

}
