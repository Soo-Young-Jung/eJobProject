package kr.or.ddit.blog.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogCategoryVO;

public interface IBCategoryService {
	//블로그 메뉴 추가
	public ServiceResult createCategory(BlogCategoryVO category);
	//블로그 메뉴 수정
	public ServiceResult modifyCategory(BlogCategoryVO category);
	//블로그 메뉴 삭제
	public ServiceResult removeCategory(BlogCategoryVO category);
	//블로그 메뉴 불러오기(회원별)
	public List<BlogCategoryVO> retrieveCategoryList(String mem_id);
	//선택한 메뉴 이름 불러오기
	public BlogCategoryVO retrieveCategory(long bc_no);
}
