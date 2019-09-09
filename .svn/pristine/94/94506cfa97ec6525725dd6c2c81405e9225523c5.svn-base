package kr.or.ddit.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BlogReplyVO;
import kr.or.ddit.vo.PagingVO;

@Repository
public interface IBlogReplyDAO {
	public int insertReply(BlogReplyVO reply);
	public long selectReplyCount(PagingVO<BlogReplyVO> pagingVO);
	public List<BlogReplyVO> selectReplyList(PagingVO<BlogReplyVO> pagingVO);
	public BlogReplyVO selectReply(long br_no);
	public int updateReply(BlogReplyVO reply);
	public int deleteReply(BlogReplyVO reply);
}