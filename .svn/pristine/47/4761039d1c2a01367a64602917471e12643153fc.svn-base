package kr.or.ddit.suggestion.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SuggestionVO; 

@Repository
public interface ISuggestionDAO {
	public int insertSuggestion(SuggestionVO suggestion);
	public SuggestionVO selectSuggestion(int sug_no);
	public long selectSuggestionCount(PagingVO<SuggestionVO> pagingVO);
	public List<SuggestionVO> selectSuggestionList(PagingVO<SuggestionVO> pagingVO);
	public int updateSuggestion(SuggestionVO suggestion);
	public int deleteSuggestion(SuggestionVO suggestion);
	
	public List<SuggestionVO> reply(int sug_no);
	
	
	public int cnt();
}
