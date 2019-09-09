package kr.or.ddit.blog.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.FollowVO;
import kr.or.ddit.vo.MemberLicVO;
import kr.or.ddit.vo.ResumeVO;

@Repository
public interface IBlogDAO {
	//블로그 생성
	public int insertBlog(BlogVO blog);
	//블로그 이름 변경
	public int updateBlog(BlogVO blog);
	//블로그 출력
	public BlogVO selectBlog(String mem_id);
	//팔로우 수 별 블로그 리스트 출력
	public List<BlogVO> selectBlogList();
	//회원별 팔로우 목록
	public List<FollowVO> selectFollowList(String mem_id);
	//회원별 자격증 목록
	public List<MemberLicVO> selectLicList(String mem_id);
	//회원별 구직 여부 확인
	public ResumeVO selectJobStatus(String mem_id);
	//블로그 홈 출력 최근 게시글 3개
	public List<BlogBoardVO> selectBoardList(String mem_id);
	
	//이메일 보내기
	public String sendtoUser(HashMap<String, Object> email);
}