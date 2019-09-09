package kr.or.ddit.announce.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AnnouncePagingVO;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.ApplicantMemberVO;
import kr.or.ddit.vo.PagingVO;

public interface IAnnounceService {
	
//	공고 관련 기능
	
	public long retrieveAnnounceCount(AnnouncePagingVO announcePagingVO);
	
	public List<AnnounceVO> retrieveAnnounceList(AnnouncePagingVO announcePagingVO);
	
	public AnnounceVO retrieveAnnounce(Integer annl_no);
	
	public ServiceResult createAnnounce(AnnounceVO announceVO);
	
	public ServiceResult modifyAnnounce(AnnounceVO announceVO);
	
	public ServiceResult romoveAnnounce(Integer annl_no);

//	특정 기업이 자신의 공고 리스트를 확인하는 기능
	
	public long selectAnnounceCountForMy(AnnouncePagingVO announcePagingVO);
	
	public List<AnnounceVO> selectAnnounceListForMy(AnnouncePagingVO announcePagingVO);
	
//	일반 유저가 자신의 지원한 공고 목록을 확인하는 창
	
	public List<AnnounceVO> retrieveAnnounceListForApp(AnnouncePagingVO announcePagingVO);
	
	public int appCount(String mem_id);
	
//	공고 지원 기능
	
	public long selectApplicantCount(PagingVO pagingVO);
	
	public List<ApplicantMemberVO> selectApplicantMemberList(PagingVO pagingVO);
	
	public ServiceResult createApplicant(Map<String, String> applicant);
	
//	합격자 삽입 조회 기능
	
	public long selectSuccCount(PagingVO pagingVO);
	
	public List<ApplicantMemberVO> selectSuccMemebrtList(PagingVO pagingVO);
	
	public void insertSucc(Map<String, String> succ);
	
//	스크랩 관련 기능
	
	public long retrieveScrapCount(AnnouncePagingVO announcePagingVO);
	
	public List<AnnounceVO> retrieveScrapList(AnnouncePagingVO announcePagingVO);
	
	public int selectScrap(Map<String, String> scrap);
	
	public int inserteScrap(Map<String, String> scrap);
	
	public int deleteScrap(Map<String, String> scrap);
	
	public int countScrap(String mem_id);
	
//	진행중인 공고 수
	public int selectAnnounceCountForMyOnGoing(String mem_id);
//	마감한 공고 수
	public int selectAnnounceCountForEnd(String mem_id);
	
//	메인화면 내 마감 임박 공고 출력
	
	public List<AnnounceVO> mainAccountList();
	
	public List<String> selectRecList(Integer annl_no);
	
}
