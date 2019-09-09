package kr.or.ddit.blog.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.alarm.service.IAlarmService;
import kr.or.ddit.blog.service.IBCategoryService;
import kr.or.ddit.blog.service.IBlogBoardService;
import kr.or.ddit.blog.service.IBlogReplyService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.BlogReplyVO;
import kr.or.ddit.vo.PagingVO;

@Controller
@RequestMapping("/reply")
public class BlogReplyController {
	
	@Inject
	IBlogReplyService service;
	
	@Inject
	IAlarmService alarmService;
	
	@Inject
	IBlogBoardService boardService;
	
	@Inject
	IBCategoryService categoryService;
	
	@RequestMapping(value="replyList.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<BlogReplyVO> process(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(required=true) Integer bb_no){
		PagingVO<BlogReplyVO> pagingVO = new PagingVO<>(5,5);
		pagingVO.setSearchVO(new BlogReplyVO(bb_no));
		pagingVO.setCurrentPage(currentPage);
		long totalRecord = service.retrieveReplyCount(pagingVO);
		// 2. 
		pagingVO.setTotalRecord(totalRecord);
		
		List<BlogReplyVO> replyList = service.retrieveReplyList(pagingVO);
		
		pagingVO.setDataList(replyList);
		
		return pagingVO;
	}
	
	@RequestMapping("replyInsert.do")
	@ResponseBody
	public Map<String, Object> process(BlogReplyVO reply){
		Map<String, Object> resultMap = new LinkedHashMap<>();
		BlogBoardVO blogboard = new BlogBoardVO();
		ServiceResult result = ServiceResult.FAILED;
		if(reply.getBr_writer().isEmpty() || reply.getBr_writer().trim().length()==0) {
			resultMap.put("success", false);
			resultMap.put("message", "로그인이 필요한 서비스 입니다.");
		}else {
			result = service.createReply(reply);
			
			if(ServiceResult.OK.equals(result)) {
				blogboard = boardService.retrieveBlogBoard(reply.getBb_no());
				String member = (categoryService.retrieveCategory(blogboard.getBc_no())).getMem_id();
				
				AlarmVO alarm = new AlarmVO();
				alarm.setMem_id1(member);
				alarm.setMem_id2(reply.getBr_writer());
				alarm.setBb_no(blogboard.getBb_no());
				
				alarmService.replyNotice(alarm);
				
				resultMap.put("success", true);
			}else {
				resultMap.put("success", false);
				resultMap.put("message", "서버 오류");
			}
		}
		return resultMap;
	}
	
	@RequestMapping("replyDelete.do")
	public Map<String, Object> delete(BlogReplyVO reply){
		Map<String, Object> resultMap = new LinkedHashMap<>();
		ServiceResult result = service.removeReply(reply);
		switch (result) {
		case FAILED:
			resultMap.put("success", false);
			resultMap.put("message", "권한이 없는 아이디 입니다.");
			break;
		default:
			resultMap.put("success", true);
			break;
		}
		return resultMap;
	}
	
}
