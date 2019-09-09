package kr.or.ddit.mypage.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CareerVO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.LoginRecordVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MypageAttatchVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ResumeVO;

public interface IMypageService {
//	이메일 보내기
	public String SendMail(String mail);
	
	
//	로그인 기록 관련
	public List<LoginRecordVO> loginrecord(String mem_id);
	public int recordCount(String mem_id);
	public List<LoginRecordVO> recordList(PagingVO paging);
	
	
//	회원 관련
	public MemberVO searchMember(String mem_id);
	public ServiceResult editMember(MemberVO member);
	
	
//	기업회원 관련
	public ServiceResult editEntMember(MemberVO member);
	public ServiceResult editEntInfo(Ent_infoVO ent);
	public Ent_infoVO searchEntInfo(String mem_id);
	
	
//	이력서 관련
	public ServiceResult editResume(ResumeVO resume);
	public ServiceResult insertResume(ResumeVO resume);
	public int countResume(String mem_id);
	public List<ResumeVO> selectResume(String mem_id);
	public int resumeCount(String mem_id);
	public ResumeVO searchResume(int er_no);
	public ServiceResult deleteResume(ResumeVO resume);
	public long openResume(String mem_id);
	
	
//	비밀번호/아이디 찾기
	public String searchId(MemberVO member);
	public String searchPass(MemberVO member);
	
	
//	커리어 관련
	public ServiceResult insertCareer(CareerVO career);
	public ServiceResult editCareer(CareerVO career);
	public CareerVO searchCareer(CareerVO career);
	public ServiceResult deleteCareer(CareerVO career);
	
	
//	이력서 첨부파일 관련
	public ServiceResult insertMypageAttatch(ResumeVO resume);
	public MypageAttatchVO selectAttatch(long er_no);
	public ServiceResult deleteAttatch(long er_no);
	
	
	public int selectOpen(String mem_id);
	public int checkTitle(String er_title);
	
	
	
	
}
