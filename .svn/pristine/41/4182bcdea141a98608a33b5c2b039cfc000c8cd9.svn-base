package kr.or.ddit.member.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface IMemberDAO {

	public List<MemberVO> selectEntProfileList();
	
	public MemberVO selectMember(String id);
	
	public long selectMemberCount(PagingVO<MemberVO> pagingVO);
	
	public List<MemberVO> selectMemberList(PagingVO<MemberVO> pagingVO);
}
