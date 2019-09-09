package kr.or.ddit.faq.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.faq.dao.IFaqBoardDAO;
import kr.or.ddit.vo.FaqBoardVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class FaqBoardServiceImpl implements IFaqBoardService {

	private FaqBoardServiceImpl(){}
	private static FaqBoardServiceImpl faqBoardService;
	public static FaqBoardServiceImpl getInstance() {
		if(faqBoardService==null) faqBoardService = new FaqBoardServiceImpl();
		return faqBoardService;
	}
	
	@Inject
	IFaqBoardDAO faqDAO;
	

	
	
	@Override
	public FaqBoardVO selectFaqBoard(int nno) throws Exception {
		return faqDAO.selectFaqBoard(nno);
	}

	@Override
	public ServiceResult updateFaqBoard(FaqBoardVO vo) throws Exception {
		int cnt = faqDAO.updateFaqBoard(vo);
		ServiceResult result = null;
		if(cnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult deleteFaqBoard(int nno) throws Exception {
		int cnt = faqDAO.deleteFaqBoard(nno);
		ServiceResult result = null;
		if(cnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<FaqBoardVO> selectFaqBoardListAll(PagingVO<FaqBoardVO> pagingVO) throws Exception {
		return faqDAO.selectFaqBoardListAll(pagingVO);
	}

//	@Override
//	public int increaseViewcnt(int nno) throws Exception {
//		return 0;
//	}

	@Override
	public ServiceResult insertFaqBoard(FaqBoardVO vo) throws Exception {
		
		String title = vo.getFaq_title();
		String content = vo.getFaq_content();
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
		vo.setFaq_title(title);
		vo.setFaq_content(content);
		
		int cnt = faqDAO.insertFaqBoard(vo);
		ServiceResult result = null;
		if(cnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public int retrieveFaqBoardCount(PagingVO<FaqBoardVO> pagingVO) throws Exception {
		return faqDAO.selectFaqBoardCount(pagingVO);
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
