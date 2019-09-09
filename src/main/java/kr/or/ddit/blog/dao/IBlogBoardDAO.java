package kr.or.ddit.blog.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BlogBoardPagingVO;
import kr.or.ddit.vo.BlogBoardVO;

@Repository
public interface IBlogBoardDAO {
	//새글쓰기
	public int insertBlogBoard(BlogBoardVO blogBoard);
	//글수정
	public int updateBlogBoard(BlogBoardVO blogBoard);
	//글삭제
	public int deleteBlogBoard(BlogBoardVO blogBoard);
	//글 조회수 증가
	public int increamentHit(long cb_no);
	//글 조회
	public BlogBoardVO selectBoard(long cb_no);
	//글 목록 조회
	public List<BlogBoardVO> selectBoardList(HashMap<String, Object> map);
	//블로그 글 갯수 조회
	public long selectBoardCount(HashMap<String, Object> map);
	//인기 블로그 글 조회
	public List<BlogBoardVO> famousBlogBoardList();
}
