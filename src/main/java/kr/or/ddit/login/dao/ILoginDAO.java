package kr.or.ddit.login.dao;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.MemberVO;

@Repository
public interface ILoginDAO {
	/**
	 * 로그인을 하기 위한 메서드
	 * @param member 아이디와 비밀번호를 가지고 있는 객체
	 * @return 0 로그인할 아이디가 없는경우
	 * 		   1 로그인할 아이디가 있는경우
	 */
	public int loginCheck(MemberVO member);
	
	/**
	 * 일반회원가입을 하기위한 메서드
	 * @param member
	 * @return 0 회원가입 실패
	 * 		   1 회원가입 성공
	 */
	public int insertGen(MemberVO member);
	
	/**
	 * 기업 회원가입을 위한 메서드
	 * @param ent 기업정보를 가진 객체
	 * @return 0 회원가입 실패
	 * 		   1 회원가입 성공
	 */
	public int insertEnt(MemberVO member);
	
	public int insertEntInfo(Ent_infoVO ent);
	
	/**
	 * 아이디 중복체크를 위한 메서드
	 * @param mem_id
	 * @return 0 없는 아이디
	 * 		   1 있는 아이디
	 */
	public int idCheck(String mem_id);
	
	public String divCheck(String mem_id);
	
	public int loginRecord(String mem_id);
}
