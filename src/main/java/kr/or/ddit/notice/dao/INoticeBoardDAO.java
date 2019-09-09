package kr.or.ddit.notice.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface INoticeBoardDAO {

	// 게시글 작성
	public int insertNotice(NoticeBoardVO vo) throws Exception;
	
	// 게시글 상세보기
	public NoticeBoardVO selectNotice(int nno) throws Exception;
	
	// 게시글 수정
	public int updateNotice(NoticeBoardVO vo) throws Exception;
	
	// 게시글 삭제
	public int deleteNotice(int nno) throws Exception;
	
	// 게시글 전체 목록
	public List<NoticeBoardVO> selectNoticeListAll(PagingVO<NoticeBoardVO>pagingVO) throws Exception;
	
	public int selectNoticeCount(PagingVO<NoticeBoardVO>pagingVO);
	
	
}
