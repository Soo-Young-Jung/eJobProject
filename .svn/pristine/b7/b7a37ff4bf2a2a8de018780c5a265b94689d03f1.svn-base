package kr.or.ddit.faq.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.FaqBoardVO;
import kr.or.ddit.vo.PagingVO;

public interface IFaqBoardService {
	// 게시글 작성
	public ServiceResult insertFaqBoard(FaqBoardVO vo) throws Exception;
	// 게시글 상세히 보기
	public FaqBoardVO selectFaqBoard(int nno) throws Exception;
	// 게시글 수정
	public ServiceResult updateFaqBoard(FaqBoardVO vo) throws Exception;
	// 게시글 삭제
	public ServiceResult deleteFaqBoard(int nno) throws Exception;
	// 게시글 전체 목록
	public List<FaqBoardVO> selectFaqBoardListAll(PagingVO<FaqBoardVO> pagingVO) throws Exception;
	// 게시글 조회
//	public void increaseViewcnt(int nno) throws Exception;
	// 게시글 검색 갯수
	public int retrieveFaqBoardCount(PagingVO<FaqBoardVO> pagingVO) throws Exception ;
	
}
