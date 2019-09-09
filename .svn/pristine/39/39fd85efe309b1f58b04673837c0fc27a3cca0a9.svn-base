package kr.or.ddit.ent_info.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.ent_info.dao.IEnt_infoDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.Ent_info2VO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class Ent_infoServiceImpl implements IEnt_infoService{

	@Inject
	IEnt_infoDAO iEnt_infoDAO;

	@Override
	public ServiceResult createEnt_info(Ent_infoVO ent_infoVO) {
		int rowCnt = iEnt_infoDAO.insertEnt_info(ent_infoVO);
		ServiceResult result = ServiceResult.FAILED;
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public long retrieveEnt_infoCount(PagingVO<Ent_info2VO> pagingVO) {
		return iEnt_infoDAO.selectEnt_infoCount(pagingVO);
	}

	@Override
	public List<Ent_info2VO> retrieveEnt_infoList(PagingVO<Ent_info2VO> pagingVO) {
		return iEnt_infoDAO.selectEnt_infoList(pagingVO);
	}

	@Override
	public Ent_info2VO retrieveEnt_info(String id) {
		return iEnt_infoDAO.selectEnt_info(id);
	}

	@Override
	public ServiceResult modifyEnt_info(Ent_infoVO ent_infoVO) {
		int rowCnt = iEnt_infoDAO.updateEnt_info(ent_infoVO);
		ServiceResult result = ServiceResult.INVALIDPASSWORD;
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}
	
	@Override
	public ServiceResult removeEnt_info(Ent_infoVO ent_infoVO) {
		int rowCnt = iEnt_infoDAO.deleteEnt_info(ent_infoVO);
		ServiceResult result = ServiceResult.INVALIDPASSWORD;
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<Ent_infoVO> announcevo(String id) {
		
		return iEnt_infoDAO.announcevo(id);
	}

	
	
	////////////////////////////////////////////////////////////맴버삽입	
	@Override
	public ServiceResult insert(MemberVO vo) {
		
		int rowCnt = iEnt_infoDAO.insert(vo);
		ServiceResult result = ServiceResult.INVALIDPASSWORD;
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	

}
