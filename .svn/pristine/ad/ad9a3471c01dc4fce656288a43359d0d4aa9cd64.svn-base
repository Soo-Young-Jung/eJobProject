package kr.or.ddit.ent_info.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.Ent_info2VO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface IEnt_infoDAO {
	
	public int insertEnt_info(Ent_infoVO ent_infoVO);
	
	public Ent_info2VO selectEnt_info(String id);
	
	public long selectEnt_infoCount(PagingVO<Ent_info2VO> pagingVO);
	
	public List<Ent_info2VO> selectEnt_infoList(PagingVO<Ent_info2VO> pagingVO);
	// 공고 목록
	public List<Ent_infoVO> announcevo(String id);
	
	
	
	
	
	
	
	public int updateEnt_info(Ent_infoVO ent_infoVO);
	
	public int deleteEnt_info(Ent_infoVO ent_infoVO);
	
	//////////////////////////////////////////////////////////멤버삽입
	public int insert(MemberVO vo);
}
