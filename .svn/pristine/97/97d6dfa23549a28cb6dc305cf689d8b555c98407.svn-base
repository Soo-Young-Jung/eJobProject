package kr.or.ddit.suggestion.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.suggestion.dao.ISuggestionDAO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SuggestionVO;

@Service
public class SuggestionServiceImpl implements ISuggestionService{
	
	@Inject
	ISuggestionDAO dao;
	
	@Override
	public ServiceResult createSuggestion(SuggestionVO suggestion) {
		int rowCnt = dao.insertSuggestion(suggestion);
		ServiceResult result = ServiceResult.FAILED;
		if(rowCnt > 0) result = ServiceResult.OK;
		return result;
	}

	@Override
	public long retrieveSuggestionCount(PagingVO<SuggestionVO> pagingVO) {
		
		return dao.selectSuggestionCount(pagingVO);
	}

	@Override
	public List<SuggestionVO> retrieveSuggestionList(PagingVO<SuggestionVO> pagingVO) {
	
		return dao.selectSuggestionList(pagingVO);
	}

	@Override
	public SuggestionVO retrieveSuggestion(int sug_no) {
		
		return dao.selectSuggestion(sug_no);
	}

	@Override
	public ServiceResult modifySuggestion(SuggestionVO suggestion) {
		int rowCnt = dao.updateSuggestion(suggestion);
		ServiceResult result = ServiceResult.INVALIDPASSWORD;
		if(rowCnt > 0 ) result = ServiceResult.OK;
		return result;
	}

	@Override
	public ServiceResult removeSuggestion(SuggestionVO suggestion) {
		int rowCnt = dao.deleteSuggestion(suggestion);
		ServiceResult result = ServiceResult.INVALIDPASSWORD;
		if(rowCnt > 0 ) result = ServiceResult.OK;
		return result;
	}

	@Override
	public List<SuggestionVO> reply(int sug_no) {
		
		return dao.reply(sug_no);
	}

	@Override
	public int cnt() {
		
		return dao.cnt();
	}

}
