package kr.or.ddit.login.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.dao.ILoginDAO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.MemberVO;

@Service
public class LoginServiceImpl implements ILoginService {

	@Inject
	ILoginDAO dao;
	
	@Override
	public ServiceResult loginCheck(MemberVO member) {
		ServiceResult result = ServiceResult.INVALIDPASSWORD;
		
		int loginChk = dao.loginCheck(member);
		if(loginChk > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult insertGen(MemberVO member) {
		ServiceResult result = ServiceResult.FAILED;
		
		int cnt = dao.insertGen(member);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult idCheck(String mem_id) {
		ServiceResult result = ServiceResult.FAILED;
		
		int cnt = dao.idCheck(mem_id);
		if(cnt == 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult insertEnt(MemberVO member) {
		ServiceResult result = ServiceResult.FAILED;
		
		int cnt = dao.insertEnt(member);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult insertEntInfo(Ent_infoVO ent) {
		ServiceResult result = ServiceResult.FAILED;

		int cnt = dao.insertEntInfo(ent);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public String divCheck(String mem_id) {
		return dao.divCheck(mem_id);
	}

	@Override
	public ServiceResult loginRecord(String mem_id) {
		ServiceResult result = ServiceResult.FAILED;
		
		int cnt = dao.loginRecord(mem_id);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}
}
