package kr.or.ddit.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BlogCategoryVO;

@Repository
public interface IBCategoryDAO {
	//블로그 메뉴 추가
	public int insertCategory(BlogCategoryVO category);
	//블로그 메뉴 수정
	public int updateCategory(BlogCategoryVO category);
	//블로그 메뉴 삭제
	public int deleteCategory(BlogCategoryVO category);
	//블로그 메뉴 불러오기(회원 별)
	public List<BlogCategoryVO> selectBlogList(String mem_id);
	//선택한 메뉴 이름 불러오기
	public BlogCategoryVO selectCategory(long bc_no);
}
