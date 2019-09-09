package kr.or.ddit.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BlogBoardPagingVO;
import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.HashtagVO;

@Repository
public interface IHashtagDAO {
	//해쉬태그 생성
	public int insertHashtag(HashtagVO hashtag);
	//해쉬태그 생성
	public int deleteHashtag(HashtagVO hashtag);
	//해쉬태그 갯수 조회->인기있는 해시태그 조회 시 사용
	public List<HashtagVO> popularHashCount();
	//해쉬태그별 갯수
	public int selectHashCount(BlogBoardPagingVO<BlogBoardVO> pagingVO);
	//해쉬태그 조회
	public List<BlogBoardVO> selectHashList(BlogBoardPagingVO<BlogBoardVO> pagingVO);
	//게시글 별 해쉬태그 조회
	public List<HashtagVO> selectBoardHashList(long bb_no);
}
