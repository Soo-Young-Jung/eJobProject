package kr.or.ddit.notice.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.PagingVO;

public interface INoticeBoardService {
	// 게시글 작성
	public ServiceResult insertNotice(NoticeBoardVO vo) throws Exception;
	// 게시글 상세히 보기
	public NoticeBoardVO selectNotice(int nno) throws Exception;
	// 게시글 수정
	public ServiceResult updateNotice(NoticeBoardVO vo) throws Exception;
	// 게시글 삭제
	public ServiceResult deleteNotice(int nno) throws Exception;
	// 게시글 전체 목록
	public List<NoticeBoardVO>  selectNoticeListAll(PagingVO<NoticeBoardVO> pagingVO) throws Exception;
	// 게시글 조회
//	public void increaseViewcnt(int nno) throws Exception;
	// 게시글 검색 갯수
	public int retrieveNoticeCount(PagingVO<NoticeBoardVO> pagingVO) throws Exception ;
	
}
