package kr.or.ddit.blog.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogBoardPagingVO;
import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.HashtagVO;

public interface IHashtagService {
	//해쉬태그 생성
	public ServiceResult createHashtag(HashtagVO hashtag);
	//해쉬태그 생성
	public ServiceResult removeHashtag(HashtagVO hashtag);
	//해쉬태그 갯수 조회
	public List<HashtagVO> famousHashtag();
	//해쉬태그별 갯수
	public int retrieveHashCount(BlogBoardPagingVO<BlogBoardVO> pagingVO);
	//해쉬태그 조회
	public List<BlogBoardVO> retrieveHashList(BlogBoardPagingVO<BlogBoardVO> pagingVO);
	//게시글 별 해쉬태그 조회
	public List<HashtagVO> retrieveBlogHashList(long bb_no);
}
