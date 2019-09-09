package kr.or.ddit.blog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.blog.dao.IHashtagDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogBoardPagingVO;
import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.HashtagVO;

@Service
public class HashtagServiceImpl implements IHashtagService {
	
	private HashtagServiceImpl() {}
	private static HashtagServiceImpl service;
	public static HashtagServiceImpl getInstance() {
		if(service==null) service = new HashtagServiceImpl();
		return service;
	}
	
	@Inject
	IHashtagDAO dao;
	
	@Override
	public ServiceResult createHashtag(HashtagVO hashtag) {
		int cnt = dao.insertHashtag(hashtag); 
		ServiceResult result = ServiceResult.FAILED;
		if(cnt>0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<HashtagVO> famousHashtag() {
		return dao.popularHashCount();
	}

	@Override
	public List<BlogBoardVO> retrieveHashList(BlogBoardPagingVO<BlogBoardVO> pagingVO) {
		return dao.selectHashList(pagingVO);
	}

	@Override
	public ServiceResult removeHashtag(HashtagVO hashtag) {
		int cnt = dao.deleteHashtag(hashtag); 
		ServiceResult result = ServiceResult.FAILED;
		if(cnt>0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<HashtagVO> retrieveBlogHashList(long bb_no) {
		return dao.selectBoardHashList(bb_no);
	}

	@Override
	public int retrieveHashCount(BlogBoardPagingVO<BlogBoardVO> pagingVO) {
		return dao.selectHashCount(pagingVO);
	}

}
