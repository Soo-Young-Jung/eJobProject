package kr.or.ddit.notice.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.notice.dao.INoticeBoardDAO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class NoticeBoardServiceImpl implements INoticeBoardService {

	private NoticeBoardServiceImpl(){}
	private static NoticeBoardServiceImpl noticeBoardService;
	public static NoticeBoardServiceImpl getInstance() {
		if(noticeBoardService==null) noticeBoardService = new NoticeBoardServiceImpl();
		return noticeBoardService;
	}
	
	@Inject
	INoticeBoardDAO noticeDAO;
	

	
	
	@Override
	public NoticeBoardVO selectNotice(int nno) throws Exception {
		return noticeDAO.selectNotice(nno);
	}

	@Override
	public ServiceResult updateNotice(NoticeBoardVO vo) throws Exception {
		int cnt = noticeDAO.updateNotice(vo);
		ServiceResult result = null;
		if(cnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult deleteNotice(int nno) throws Exception {
		int cnt = noticeDAO.deleteNotice(nno);
		ServiceResult result = null;
		if(cnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<NoticeBoardVO> selectNoticeListAll(PagingVO<NoticeBoardVO> pagingVO) throws Exception {
		return noticeDAO.selectNoticeListAll(pagingVO);
	}

//	@Override
//	public int increaseViewcnt(int nno) throws Exception {
//		return 0;
//	}

	@Override
	public ServiceResult insertNotice(NoticeBoardVO vo) throws Exception {
		
		String title = vo.getNot_title();
		String content = vo.getNot_content();
		String not_div = vo.getNot_div();
		String adm_id = vo.getAdm_id();
		
		
		
		// repalce(a,b) a를 b로 바꾸기
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
//		adm = writer.replace("<", "&lt;");
//		writer = writer.replace("<", "&gt;");
		// 공백문자 처리
		title = title.replace(" ", "&nbsp;&nbsp");
//		writer = writer.replace(" ", "&nbsp;&nbsp");
		//줄 바꿈 문자 처리
		content = content.replace("\n", "<br>");
		vo.setNot_title(title);
		vo.setNot_content(content);
		vo.setNot_div(not_div);
		
		int cnt = noticeDAO.insertNotice(vo);
		ServiceResult result = null;
		if(cnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public int retrieveNoticeCount(PagingVO<NoticeBoardVO> pagingVO) throws Exception {
		return noticeDAO.selectNoticeCount(pagingVO);
	}
	
	
//	@Override
//	public AttatchVO download(long att_no) {
//		AttatchVO attatch = attatchDAO.selectAttach(att_no);
//		if(attatch==null) throw new CommonException(att_no+" 파일 없음.");
//		attatchDAO.incrementDownCount(att_no);
//		return attatch;
//	}
	
	
//	// 
//	@Resource(name="INoticeBoardDAO")
//	
//	@Override
//	public List<Map<String, Object>> selectNoticeBoardList(Map<String, Object> map) throws Exception{
//		
//		return sampleDAO.selectBoardList(map);
//	}
//	
//	// 상세보기
//	@Override
//	public Map<String, Object> viewNoticeBoardDetail(Map<String, Object> map){
//		noticeBoardDAO.updateHitBoard(map);
//		Map<String, Object> detail = noticeBoardDAO.detailNoticeBoard(map);
//		returb detail;
//	}
//	
//	// 게시글  
//	@Override
//	public List<NoticeBoardVO> listAll(String searchOption, String keyword) throws Exception {
//		return noticeBoardDao.listAll(searchOption, keyword);
//	}
//	
//	// 게시글 레코드 갯수 noticeBoardDAO.countArticle메서드
//	@Override
//	public int countArticle(String searchOption, String keyword) throws Exception {
//		return noticeBoardDAO.countArticle(searchOption, keyword);
//	}
	//------------------------------
	
	
	
	
	
}
