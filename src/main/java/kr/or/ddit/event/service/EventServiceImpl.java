package kr.or.ddit.event.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kr.or.ddit.ent_info.dao.IEnt_infoDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.event.dao.IEventAttatchDAO;
import kr.or.ddit.event.dao.IEventDAO;
import kr.or.ddit.exception.CommonException;
import kr.or.ddit.vo.EventAttatchVO;
import kr.or.ddit.vo.EventVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class EventServiceImpl implements IEventService{

	@Inject
	IEventDAO dao;
	@Inject
	IEventAttatchDAO attatchDAO;
	
	@Override
	public ServiceResult createEvent(EventVO event) {
		
		int cnt = dao.insertEvent(event);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			processFiles(event);
			result = ServiceResult.OK;
		}
		return result;
	}

	
	@Value("#{appInfo.attatchPath}")
	private File saveFolder;
	
	private void processFiles(EventVO event) {
		// 트랜잭션 처리 주의!
		// 2. 삭제할 파일 처리
		Long[] delFiles = event.getDelFiles();
		if(delFiles!=null && delFiles.length>0) {
			for(Long delFileNo : delFiles) {
				EventAttatchVO saved = attatchDAO.selectAttatch(delFileNo);
				attatchDAO.deleteAttatch(delFileNo);
				FileUtils.deleteQuietly(new File(saveFolder, saved.getEvt_savename()));
			}
		}
		
		//3.  업로드된 파일 처리
		List<EventAttatchVO> attatchList= event.getAttatchList();
		if(attatchList==null || attatchList.size()==0) return;
		
//		if(1==1) throw new RuntimeException("트랜잭션 관리 여부 확인을 위한 예외");
		
		for(EventAttatchVO attatch : attatchList) {
			attatch.setEvt_no(event.getEvt_no());
			attatchDAO.insertAttatch(attatch);
			File saveFile = new File(saveFolder, attatch.getEvt_savename());
			try(
				InputStream is = attatch.getItem().getInputStream();
			){
				FileUtils.copyInputStreamToFile(is, saveFile);
			}catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	
	@Override
	public long retrieveEventCount(PagingVO<EventVO> pagingVO) {
		
		return dao.selectEventCount(pagingVO);
	}

	@Override
	public List<EventVO> retrieveEventList(PagingVO<EventVO> pagingVO) {
		
		return dao.selectEventList(pagingVO);
	}

	@Override
	public EventVO retrieveEvent(long event_no) {
		EventVO event = dao.selectEvent(event_no);
	
	
		return event;
	}
	
	
	
//	@Transactional
//	@Override
//	public ServiceResult modifyEvent(EventVO event) {		
//		EventVO saveEvent = dao.selectEvent(event.getEvt_no());
//		if(saveEvent==null) throw new CommonException(event.getEvt_no()+" 파일 없음.");
//		ServiceResult result = ServiceResult.FAILED;
//			// 1. 수정 데이터 처리
//			int cnt = dao.updateEvent(event);
//			if(cnt>0) {
//				// 첨부파일들에 대한 처리
//				processFiles(event);
//				result = ServiceResult.OK;
//			}
//		return result;
//	}
	@Override
	public ServiceResult modifyEvent(EventVO event) {		
	
		
		ServiceResult result = ServiceResult.FAILED;
			// 1. 수정 데이터 처리
			int cnt = dao.updateEvent(event);
			if(cnt>0) {
				// 첨부파일들에 대한 처리
			
				result = ServiceResult.OK;
			}
		return result;
	}
	
	
//	@Override
//	public ServiceResult removeEvent(EventVO event) {
//		
//		EventVO savedBoard = dao.selectEvent(event.getEvt_no());
//		if(savedBoard==null) throw new CommonException(event.getEvt_no()+" 파일 없음.");
//		ServiceResult result = ServiceResult.FAILED;
//	
//			dao.deleteEvent(event); // 파일의 metadata 만 삭제
//			if(event.getRowcnt()==3) {
//				// 3 이진 데이터 삭제
//				List<EventAttatchVO> attatchList = savedBoard.getAttatchList();
//				if(attatchList!=null) {
//					for(EventAttatchVO attatch : attatchList) {
//						FileUtils.deleteQuietly(new File(saveFolder, attatch.getEvt_savename()));
//					}
//				}
//				result = ServiceResult.OK;
//			}
//	
//	
//		return result;
//	}
	@Override
	public ServiceResult removeEvent(EventVO event) {
		
		int rowCnt = dao.deleteEvent(event);
		ServiceResult result = ServiceResult.INVALIDPASSWORD;
		if(rowCnt > 0 ) result = ServiceResult.OK;
		return result;
		

	}

	@Override
	public EventAttatchVO download(long att_no) {
		
		EventAttatchVO attatch = attatchDAO.selectAttatch(att_no);
		if(attatch==null) throw new CommonException(att_no+" 파일이 없음.");
		attatchDAO.incrementDownCount(att_no);
		return attatch;
	}


	@Override
	public List<EventVO> selectEventList2(String evt_organizer) {
		
		return dao.selectEventList2(evt_organizer);
	}


	@Override
	public List<EventVO> selectEventList3(String evt_qualification) {
		
		return dao.selectEventList3(evt_qualification);
	}


	@Override
	public List<EventVO> selectEventList1() {
		
		return dao.selectEventList1();
	}


	@Override
	public List<EventVO> retrieveRecentEvent() {
		return dao.selectRecentEvent();
	}

}
