package kr.or.ddit.blog.dao;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BlogBoardAttatchVO;

@Repository
public interface IAttatchDAO {
	// Spring 프레임웤에서 사용.
	public int insertAttatch(BlogBoardAttatchVO attatchVO);
	// Spring 이전에 트랜잭션 관리를 직접 하기 위한 메소드.
	public BlogBoardAttatchVO selectAttatch(long ba_no);
	public void incrementDownCount(long ba_no);
	public int deleteAttatch(long ba_no);
}
