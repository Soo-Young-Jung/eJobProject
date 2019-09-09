package kr.or.ddit.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class BlogBoardPagingVO<T> {
	public BlogBoardPagingVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
	private int screenSize = 10;
	private int blockSize = 5;
	private long totalRecord;
	private long totalPage;
	private long currentPage;
	private long startRow;
	private long endRow;
	private long startPage;
	private long endPage;
	private List<T> dataList; //pagingVO의 객체가 생성되면(런타임에 동적으로 범용적으로 적용할 수 있는 타입 == general type) 타입 결정. T : 타입변수
	private String searchType;
	private String searchWord;
	private T searchVO;
	private String funcName="paging";
	
	
	//경우에 따라 하나의 페이지에서 여러개의 페이징 데이터 운영될 수 있어. 동적으로 함수 이름 바꿔주기 위해 
	public void setFuncName(String funcName) {
		this.funcName = funcName;
	}
	
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	public void setSearchVO(T searchVO) {
		this.searchVO = searchVO;
	}
	
	/**
	 * totalRecord와 totalPage를 연산
	 * @param totalRecord
	 */
	public void setTotalRecord(long totalRecord) {
		this.totalRecord = totalRecord;
		this.totalPage  = (totalRecord + (screenSize-1)) / screenSize;
	}
	
	public void setCurrentPage(long currentPage) {
		this.currentPage = currentPage;
		this.endRow = screenSize * currentPage;
		this.startRow = endRow - (screenSize-1);
		this.endPage = ((currentPage + (blockSize-1))/blockSize) * blockSize;
		this.startPage = endPage - (blockSize-1);
	}
	
	
	String pattern = "&nbsp;&nbsp;<a href='#' onclick='%s(%d)'>[%s]</a>&nbsp;&nbsp;";
	@JsonProperty("pagingHTML")
	public String pagingHTML(){
		StringBuffer html = new StringBuffer();
		if(startPage>1)
			html.append(String.format(pattern, funcName, (startPage-1), "이전"));
		endPage = endPage > totalPage?totalPage:endPage; 
		for(long i = startPage;  i <= endPage; i++) {
			if(currentPage==i) {
				html.append(i);
			}else {
				html.append(String.format(pattern, funcName, i, i+""));				
			}
		}
		if(endPage < totalPage)
			html.append(String.format(pattern, funcName, (endPage+1), "다음"));
		return html.toString();
	}
	
	
	String bootstrapPtrn = "<li %s><a class='page-link' href='#' onclick='%s'>%s</a></li>";
//	String pagingPtn = "<li %s><a class='page-link' href='blogboardlist.do?page=%s' onclick='%s'>%s</a></li>";
	@JsonProperty("pagingHTMLForBS")
	public String getPagingHTMLForBS(){
		StringBuffer html = new StringBuffer();
		html.append("<nav aria-label='Page navigation'>");
		html.append("<ul class='pagination justify-content-center'>");
		
		html.append(String.format(bootstrapPtrn, startPage>1?"":"class='page-item disabled'"
								, startPage>1?funcName + "("+ (startPage-1) +");":"return false;"
								, "<span aria-hidden='true'> « </span>"));
		
		endPage = endPage > totalPage?totalPage:endPage; 
		
		for(long i = startPage;  i <= endPage; i++) {
			html.append(String.format(bootstrapPtrn, currentPage==i?"class='page-item active'":"class='page-item'"
						, funcName + "(" + i + ");", i+ (currentPage==i?"<span class='sr-only'>(current)</span>":"")));
		}

		html.append(String.format(bootstrapPtrn, endPage<totalPage?"":"class='page-item disabled'"
								, endPage<totalPage?funcName + "("+ (endPage+1) +");":"return false;"
								, "<span aria-hidden='true'>»</span>"));
		
		html.append("</ul>");
		html.append("</nav>");
		return html.toString();
	}
	
}