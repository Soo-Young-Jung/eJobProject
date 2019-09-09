package kr.or.ddit.blog.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.blog.dao.IAttatchDAO;
import kr.or.ddit.blog.dao.IBlogBoardDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.CommonException;
import kr.or.ddit.vo.BlogBoardAttatchVO;
import kr.or.ddit.vo.BlogBoardPagingVO;
import kr.or.ddit.vo.BlogBoardVO;

@Service
public class BlogBoardServiceImpl implements IBlogBoardService {
	
	private BlogBoardServiceImpl(){}
	private static BlogBoardServiceImpl service;
	public static BlogBoardServiceImpl getInstance() {
		if(service==null) service = new BlogBoardServiceImpl();
		return service;
	}
	
	@Inject
	IBlogBoardDAO blogBoardDAO;
	@Inject
	IAttatchDAO attatchDAO;

	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	private void processFiles(BlogBoardVO blogboard) {
		// 트랜잭션 처리 주의!
		// 2. 삭제할 파일 처리
		Long[] delFiles = blogboard.getDelFiles();
		if(delFiles!=null && delFiles.length>0) {
			for(Long delFileNo : delFiles) {
				BlogBoardAttatchVO saved = attatchDAO.selectAttatch(delFileNo);
				attatchDAO.deleteAttatch(delFileNo);
				FileUtils.deleteQuietly(new File(saveFolder, saved.getBa_savename()));
			}
		}
		
		//3.  업로드된 파일 처리
		List<BlogBoardAttatchVO> attatchList= blogboard.getAttatchList();
		if(attatchList==null || attatchList.size()==0) return;
		
//		if(1==1) throw new RuntimeException("트랜잭션 관리 여부 확인을 위한 예외");
		
		for(BlogBoardAttatchVO attatch : attatchList) {
			attatch.setBb_no(blogboard.getBb_no());
			attatchDAO.insertAttatch(attatch);
			File saveFile = new File(saveFolder, attatch.getBa_savename());
			try(
				InputStream is = attatch.getItem().getInputStream();
			){
				FileUtils.copyInputStreamToFile(is, saveFile);
			}catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	@Transactional
	@Override
	public ServiceResult createBlogBoard(BlogBoardVO blogBoard) {
		int cnt = blogBoardDAO.insertBlogBoard(blogBoard);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			processFiles(blogBoard);
			result = ServiceResult.OK;
		}
		return result;
	}
	
	@Transactional
	@Override
	public ServiceResult modifyBlogBoard(BlogBoardVO blogBoard) {
		BlogBoardVO savedBoard = blogBoardDAO.selectBoard(blogBoard.getBb_no());
		if(savedBoard==null) throw new CommonException(blogBoard.getBb_no()+" 파일 없음.");
		ServiceResult result = ServiceResult.FAILED;
			// 1. 수정 데이터 처리
			int cnt = blogBoardDAO.updateBlogBoard(blogBoard);
			if(cnt>0) {
				// 첨부파일들에 대한 처리
				processFiles(blogBoard);
				result = ServiceResult.OK;
			}
		return result;
	}
	
	@Transactional
	@Override
	public ServiceResult removeBlogBoard(BlogBoardVO blogBoard) {
		BlogBoardVO savedBoard = blogBoardDAO.selectBoard(blogBoard.getBb_no());
		if(savedBoard==null) throw new CommonException(blogBoard.getBb_no()+" 파일 없음.");
		blogBoardDAO.deleteBlogBoard(blogBoard);
		ServiceResult result = ServiceResult.FAILED;
		if(blogBoard.getRowcnt()==4) {
			// 3 이진 데이터 삭제
			List<BlogBoardAttatchVO> attatchList = savedBoard.getAttatchList();
			if(attatchList!=null) {
				for(BlogBoardAttatchVO attatch : attatchList) {
					FileUtils.deleteQuietly(new File(saveFolder, attatch.getBa_savename()));
				}
			}
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public BlogBoardVO retrieveBlogBoard(long bb_no) {
		BlogBoardVO blogBoard = blogBoardDAO.selectBoard(bb_no);
		if(blogBoard==null)
			throw new CommonException(bb_no +"글이 없습니다.");
		
		blogBoardDAO.increamentHit(bb_no);
		
		return blogBoard;
	}
	
	@Override
	public List<BlogBoardVO> retrieveBlogBoardList(BlogBoardPagingVO<BlogBoardVO> blogBoard, long bc_no) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("pagingVO", blogBoard);
		map.put("bc_no", bc_no);
		
		return blogBoardDAO.selectBoardList(map);
	}
	
	@Override
	public long retrieveBoardCount(BlogBoardPagingVO<BlogBoardVO> blogBoard, long bc_no) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("pagingVO", blogBoard);
		map.put("bc_no", bc_no);
		
		return blogBoardDAO.selectBoardCount(map);
	}
	
	@Override
	public BlogBoardAttatchVO download(long ba_no) {
		BlogBoardAttatchVO attatch = attatchDAO.selectAttatch(ba_no);
		if(attatch==null) throw new CommonException(ba_no+" 파일이 없음.");
		attatchDAO.incrementDownCount(ba_no);
		return attatch;
	}

	@Override
	public List<BlogBoardVO> famousBlogBoardList() {
		return blogBoardDAO.famousBlogBoardList();
	}
	
}
