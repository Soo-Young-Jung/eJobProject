package kr.or.ddit.blog.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.blog.dao.IFollowDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.FollowVO;

@Service
public class FollowServiceImpl implements IFollowService {
	
	@Inject
	IFollowDAO dao;
	
	@Override
	public ServiceResult addFollow(FollowVO follow) {
		int cnt = dao.addFollow(follow);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult delFollow(FollowVO follow) {
		int cnt = dao.delFollow(follow);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

}
