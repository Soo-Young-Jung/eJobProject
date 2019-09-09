package kr.or.ddit.blog.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.FollowVO;
import kr.or.ddit.vo.MemberLicVO;
import kr.or.ddit.vo.ResumeVO;

public interface IBlogService {
	//블로그 생성
	public ServiceResult createBlog(BlogVO blog);
	//블로그 이름, 소개 변경
	public ServiceResult modifyBlog(BlogVO blog);
	//블로그 출력
	public BlogVO retrieveBlog(String mem_id);
	//팔로우 수 별 블로그 리스트 출력
	public List<BlogVO> retrieveBlogList();
	//회원별 팔로우 목록
	public List<FollowVO> retrieveFollowList(String mem_id);
	//회원별 자격증 목록
	public List<MemberLicVO> retrieveLicList(String mem_id);
	//회원별 구직 여부 확인
	public ResumeVO retrieveJobStatus(String mem_id);
	//블로그 홈 출력할 최근 게시물 3개
	public List<BlogBoardVO> retrieveRecentBoard(String mem_id);
	
	
	//이메일 보내기
	public ServiceResult sendtoUser(String mem_id, String mail, String subject, String content);
}
