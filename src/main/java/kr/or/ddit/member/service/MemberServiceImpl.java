package kr.or.ddit.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class MemberServiceImpl implements IMemberService, MemberfoService {
	
	@Inject
	IMemberDAO dao;
	
	@Override
	public List<MemberVO> selectEntProfileList() {
		return dao.selectEntProfileList();
	}
	
	@Override
	public long retrieveMemberCount(PagingVO<MemberVO> pagingVO) {
		return dao.selectMemberCount(pagingVO);
	}

	@Override
	public List<MemberVO> retrieveMemberList(PagingVO<MemberVO> pagingVO) {
		return dao.selectMemberList(pagingVO);
	}

	@Override
	public MemberVO retrieveMember(String id) {
		return dao.selectMember(id);
	}
	
}
