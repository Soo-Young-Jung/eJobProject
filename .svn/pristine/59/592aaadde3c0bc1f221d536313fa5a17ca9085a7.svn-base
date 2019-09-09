package kr.or.ddit.announce.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AnnouncePagingVO;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.ApplicantMemberVO;
import kr.or.ddit.vo.LicenseVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface IAnnounceDAO {
	
//	공고 관련 기능
	
	public long selectAnnounceCount(AnnouncePagingVO announcePagingVO);
	
	public List<AnnounceVO> selectAnnounceList(AnnouncePagingVO announcePagingVO);
	
	public AnnounceVO selectAnnounce(Integer annl_no);
	
	public int insertAnnounce(AnnounceVO announceVO);
	
	public int updateAnnounce(AnnounceVO announceVO);
	
	public int deleteAnnounce(Integer annl_no);
	
//	특정 기업이 자신의 공고 리스트를 확인하는 기능
	
	public long selectAnnounceCountForMy(AnnouncePagingVO announcePagingVO);
	
	public List<AnnounceVO> selectAnnounceListForMy(AnnouncePagingVO announcePagingVO);
	
//	일반 유저가 자신의 지원한 공고 목록을 확인하는 기능
	
	public List<AnnounceVO> selectAnnounceListForApp(AnnouncePagingVO announcePagingVO);
	
	public int appCount(String mem_id);
	
//	공고 차트용 데이터
	
	public Map<String, Integer> selectChartData(Integer annl_no);
	
//	공고 지원 기능
	
	public long selectApplicantCount(PagingVO pagingVO);
	
	public List<ApplicantMemberVO> selectApplicantMemberList(PagingVO pagingVO);
	
	public int selectApplicant(Map<String, String> applicant);
	
	public int insertApplicant(Map<String, String> applicant);
	
//	합격자 삽입 조회 기능
	
	public long selectSuccCount(PagingVO pagingVO);
	
	public List<ApplicantMemberVO> selectSuccMemebrtList(PagingVO pagingVO);
	
	public int insertSucc(Map<String, String> succ);
	
	public int updateSuccAnnounce(Integer annl_no);
	
//	스크랩 관련 기능
	
	public long selectScrapCount(AnnouncePagingVO announcePagingVO);
	
	public List<AnnounceVO> selectScrapList(AnnouncePagingVO announcePagingVO);
	
	public int selectScrap(Map<String, String> scrap);
	
	public int inserteScrap(Map<String, String> scrap);
	
	public int deleteScrap(Map<String, String> scrap);
	
	public int countScrap(String mem_id);
	
//	자격증 관련 기능
	
	public int insertLicense(LicenseVO licenseVO);
	
	public int deleteLicense(LicenseVO licenseVO);
	
//	메인화면 내 마감 임박 공고 출력
	
	public List<AnnounceVO> mainAccountList();
	

	public int selectAnnounceCountForMyOnGoing1(String mem_id);
	public int selectAnnounceCountForMyOnGoing2(String mem_id);
	public int selectAnnounceCountForEnd1(String mem_id);
	public int selectAnnounceCountForEnd2(String mem_id);
	
	public List<String> selectRecList(Integer annl_no);
		
}
