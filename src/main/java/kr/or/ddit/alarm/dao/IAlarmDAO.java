package kr.or.ddit.alarm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.AlarmVO;

@Repository
public interface IAlarmDAO {
	//1.댓글 알림
	public int replyNotice(AlarmVO alarm);
	//2.합격 알림
	public int succNotice(AlarmVO alarm);
	//3.권유 알림
	public int recommendNotice(AlarmVO alarm);
	//4.팔로우 알림
	public int followNotice(AlarmVO alarm);
	
	
	//알림 표출
	public List<AlarmVO> selectNoticeList(String mem_id);
}
