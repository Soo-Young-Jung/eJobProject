package kr.or.ddit.blog.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogBoardPagingVO;
import kr.or.ddit.vo.BlogReplyVO;
import kr.or.ddit.vo.PagingVO;

public interface IBlogReplyService {
	public ServiceResult createReply(BlogReplyVO reply);
	public long retrieveReplyCount(PagingVO<BlogReplyVO> pagingVO);
	public List<BlogReplyVO> retrieveReplyList(PagingVO<BlogReplyVO> pagingVO);
	public ServiceResult modifyReply(BlogReplyVO reply);
	public ServiceResult removeReply(BlogReplyVO reply);
	public BlogReplyVO retrieveReply(long br_no);
}
