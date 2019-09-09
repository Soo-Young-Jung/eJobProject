package kr.or.ddit.suggestion.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SuggestionVO;

public interface ISuggestionService {
	public ServiceResult createSuggestion(SuggestionVO suggestion);
	public long retrieveSuggestionCount(PagingVO<SuggestionVO> pagingVO);
	public List<SuggestionVO> retrieveSuggestionList(PagingVO<SuggestionVO> pagingVO);
	public SuggestionVO retrieveSuggestion(int sug_no);
	public ServiceResult modifySuggestion(SuggestionVO suggestion);
	public ServiceResult removeSuggestion(SuggestionVO suggestion);
	
	public List<SuggestionVO> reply(int sug_no);
	public int cnt();
}
