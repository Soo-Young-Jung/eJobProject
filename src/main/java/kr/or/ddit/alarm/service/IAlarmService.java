package kr.or.ddit.alarm.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AlarmVO;

public interface IAlarmService {
	
	//댓글 알림
	public ServiceResult replyNotice(AlarmVO alarm);
	//팔로우 알림
	public ServiceResult followNotice(AlarmVO alarm);
	
	//알림 표출
	public List<AlarmVO> retrieveNoticeList(String mem_id);
}
