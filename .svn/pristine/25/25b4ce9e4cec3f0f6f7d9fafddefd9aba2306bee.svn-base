package kr.or.ddit.faq.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.FaqBoardVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface IFaqBoardDAO {

	// 게시글 작성
	public int insertFaqBoard(FaqBoardVO vo) throws Exception;
	
	// 게시글 상세보기
	public FaqBoardVO selectFaqBoard(int nno) throws Exception;
	
	// 게시글 수정
	public int updateFaqBoard(FaqBoardVO vo) throws Exception;
	
	// 게시글 삭제
	public int deleteFaqBoard(int nno) throws Exception;
	
	// 게시글 전체 목록
	public List<FaqBoardVO> selectFaqBoardListAll(PagingVO<FaqBoardVO>pagingVO) throws Exception;
	
	public int selectFaqBoardCount(PagingVO<FaqBoardVO>pagingVO);
	
	
}
