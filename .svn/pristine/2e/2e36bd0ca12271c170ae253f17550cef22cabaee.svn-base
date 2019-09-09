package kr.or.ddit.mypage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.CareerVO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.LoginRecordVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MypageAttatchVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ResumeVO;

@Repository
public interface IMypageDAO {
//	메일 보내기
	public String SendMail(String mail);
	
	
//	로그인기록 관련
	public List<LoginRecordVO> loginrecord(String mem_id);
	public int recordCount(String mem_id);
	public List<LoginRecordVO> recordList(PagingVO paging);
	
	
//	일반회원 관련
	public MemberVO searchMember(String mem_id);
	public int editMember(MemberVO member);
	
//	기업회원 관련
	public int editEntMember(MemberVO member);
	public int editEntInfo(Ent_infoVO ent);
	public Ent_infoVO searchEntInfo(String mem_id);
	
	
//	이력서관련
	public int insertResume(ResumeVO resume);
	public int countResume(String mem_id);
	public List<ResumeVO> selectResume(String mem_id);
	public ResumeVO searchResume(int er_no);
	public int editResume(ResumeVO resume);
	public int deleteResume(ResumeVO resume);
	public int resumeCount(String mem_id);
	public long selectErno(ResumeVO resume);
	public long openResume(String mem_id);
	
	
//	커리어 관련
	public int insertCareer(CareerVO career);
	public int editCareer(CareerVO career);
	public CareerVO searchCareer(CareerVO career);
	public int deleteCareer(CareerVO career);
	
	
//	아이디/비밀번호 찾기
	public String searchId(MemberVO member);
	public String searchPass(MemberVO member);
	
	
//	이력서 첨부파일 관련
	public int insertMypageAttatch(MypageAttatchVO attatch);
	public MypageAttatchVO selectAttatch(long er_no);
	public int deleteAttatch(long er_no);
	
	
	public int selectOpen(String mem_id);
	public int checkTitle(String er_title);
	
	
	
	
}

	
