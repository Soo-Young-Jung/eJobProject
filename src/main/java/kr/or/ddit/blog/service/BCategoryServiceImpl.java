package kr.or.ddit.blog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.blog.dao.IBCategoryDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogCategoryVO;

@Service
public class BCategoryServiceImpl implements IBCategoryService {
	
	private BCategoryServiceImpl() {}
	private static BCategoryServiceImpl service;
	public static BCategoryServiceImpl getInstance() {
		if(service==null) service = new BCategoryServiceImpl();
		return service;
	}
	
	@Inject
	IBCategoryDAO dao;
	
	@Override
	public ServiceResult createCategory(BlogCategoryVO category) {
		int cnt = dao.insertCategory(category);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	public ServiceResult modifyCategory(BlogCategoryVO category) {
		int cnt = dao.updateCategory(category);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public ServiceResult removeCategory(BlogCategoryVO category) {
		int cnt = dao.deleteCategory(category);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<BlogCategoryVO> retrieveCategoryList(String mem_id) {
		return dao.selectBlogList(mem_id);
	}

	@Override
	public BlogCategoryVO retrieveCategory(long bc_no) {
		return dao.selectCategory(bc_no);
	}

}
