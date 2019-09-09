package kr.or.ddit.blog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.blog.dao.IBlogReplyDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogReplyVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class BlogReplyServiceImpl implements IBlogReplyService {
	private BlogReplyServiceImpl(){}
	private static BlogReplyServiceImpl service;
	public static BlogReplyServiceImpl getInstance() {
		if(service==null) service = new BlogReplyServiceImpl();
		return service;
	}
	
	@Inject
	IBlogReplyDAO replyDAO;
	
	@Override
	public ServiceResult createReply(BlogReplyVO reply) {
		int cnt = replyDAO.insertReply(reply);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt>0) result = ServiceResult.OK;
		return result;
	}

	@Override
	public long retrieveReplyCount(PagingVO<BlogReplyVO> pagingVO) {
		return replyDAO.selectReplyCount(pagingVO);
	}

	@Override
	public List<BlogReplyVO> retrieveReplyList(PagingVO<BlogReplyVO> pagingVO) {
		return replyDAO.selectReplyList(pagingVO);
	}

	@Override
	public ServiceResult modifyReply(BlogReplyVO reply) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult removeReply(BlogReplyVO reply) {
		int cnt = replyDAO.deleteReply(reply);
		ServiceResult result = ServiceResult.INVALIDPASSWORD;
		if(cnt > 0) result = ServiceResult.OK;
		return result;
	}
	
	@Override
	public BlogReplyVO retrieveReply(long br_no) {
		return replyDAO.selectReply(br_no);
	}
}
