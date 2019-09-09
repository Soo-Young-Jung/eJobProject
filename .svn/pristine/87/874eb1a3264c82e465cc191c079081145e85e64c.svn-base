package kr.or.ddit.ent_info.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.Ent_info2VO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

public interface IEnt_infoService {
	public ServiceResult createEnt_info(Ent_infoVO ent_infoVO);
	public long retrieveEnt_infoCount(PagingVO<Ent_info2VO> pagingVO);
	public List<Ent_info2VO> retrieveEnt_infoList(PagingVO<Ent_info2VO> pagingVO);
	public Ent_info2VO retrieveEnt_info(String id);
	
	public List<Ent_infoVO> announcevo(String id);
	
	
	public ServiceResult modifyEnt_info(Ent_infoVO ent_infoVO);
	public ServiceResult removeEnt_info(Ent_infoVO ent_infoVO);
	
	
	//////////////////////////////////////////////////////////멤버삽입
	public ServiceResult insert(MemberVO vo);
}
