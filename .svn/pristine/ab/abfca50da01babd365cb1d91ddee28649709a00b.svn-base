package kr.or.ddit.blog.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogBoardAttatchVO;
import kr.or.ddit.vo.BlogBoardPagingVO;
import kr.or.ddit.vo.BlogBoardVO;

public interface IBlogBoardService {
	public ServiceResult createBlogBoard(BlogBoardVO blogBoard);

	public ServiceResult modifyBlogBoard(BlogBoardVO blogBoard);

	public ServiceResult removeBlogBoard(BlogBoardVO blogBoard);

	public BlogBoardVO retrieveBlogBoard(long bb_no);

	public List<BlogBoardVO> retrieveBlogBoardList(BlogBoardPagingVO<BlogBoardVO> blogBoard, long bc_no);

	public long retrieveBoardCount(BlogBoardPagingVO<BlogBoardVO> blogBoard, long bc_no);

	public BlogBoardAttatchVO download(long att_no);

	// 인기 블로그 글 조회
	public List<BlogBoardVO> famousBlogBoardList();
}
