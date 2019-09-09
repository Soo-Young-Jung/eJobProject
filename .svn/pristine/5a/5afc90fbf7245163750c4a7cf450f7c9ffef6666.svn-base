package kr.or.ddit.login.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.MemberVO;

public interface ILoginService {
	
	/**
	 * 로그인을 하기위해 아이디와 비밀번호를 체크하는 메서드
	 * @param member 로그인할 아이디와 비밀번호를 가지고 있는 객체
	 * @return OK 로그인에 성공했을시
	 * 		   INVALIDPASSWORD 비밀번호 틀렸을시
	 */
	public ServiceResult loginCheck(MemberVO member);
	
	/**
	 * 일반회원가입을 위한 메서드
	 * @param member 회원가입할 정보를 가지고 있는 객체
	 * @return OK 가입에 성공했을시
	 * 		   FAILED 가입에 실패했을시
	 */
	public ServiceResult insertGen(MemberVO member);
	
	/**
	 * 기업 회원가입을 위한 메서드
	 * @param ent 기업정보를 가진 객체
	 * @return OK 가입에 성공했을시
	 * 		   FAILED 가입에 실패했을시
	 */
	public ServiceResult insertEnt(MemberVO member);
	
	public ServiceResult insertEntInfo(Ent_infoVO ent);
	
	/**
	 * 아이디 중복체크를 위한 메서드
	 * @param mem_id
	 * @return OK 아이디 없음
	 * 		   FAILED 아이디 중복 
	 */
	public ServiceResult idCheck(String mem_id);
	
	public String divCheck(String mem_id);
	
	public ServiceResult loginRecord(String mem_id);
}
