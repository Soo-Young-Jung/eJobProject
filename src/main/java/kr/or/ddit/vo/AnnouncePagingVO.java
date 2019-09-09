package kr.or.ddit.vo;

import java.util.List;

import javax.validation.constraints.Min;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AnnouncePagingVO<T> {
	public AnnouncePagingVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
	private int screenSize=10;
	private int blockSize=5;
	private long totalRecord;
	private long totalPage;
	private long currentPage;
	private long startRow;
	private long endRow;
	private long startPage;
	private long endPage;
	private List<T> dataList;
	
	//글제목 or 회사명
	private String searchType;
	private String searchWord;
	
	//근무형태
	private String searchST;
	private String searchAddr;
	@Min(value=0)
	private String searchCareer;
	//최종학력
	private String searchFEB;

	//스크랩 기능에서 ID를 통해 검색하는 기능	
	private String searchId;
	
	private T searchVO;
	
	private String funcName="paging";
	
	//지원자 아이디
	private String searchApp;
	//공고 분류
	private String searchCategory;
	
	private String mem_id;
	
	
	/**
	 * totalRecord 와  totalPage 를 연산
	 * @param totalRecord
	 */
	public void setTotalRecord(long totalRecord) {
		this.totalRecord = totalRecord;
		this.totalPage = (totalRecord + (screenSize-1)) / screenSize;
	}
	
	public void setCurrentPage(long currentPage) {
		this.currentPage = currentPage;
		this.endRow = screenSize * currentPage;
		this.startRow = endRow - (screenSize-1);
		this.endPage = ((currentPage+(blockSize-1))/blockSize)*blockSize;
		this.startPage = endPage - (blockSize - 1);
	}
	
	String pattern = "<a href='#' onclick='%s(%d)'>[%s]</a>";

	public String getPagingHTML(){
		StringBuffer html = new StringBuffer();
		if(startPage>1)
			html.append(String.format(pattern, funcName, (startPage-1), "이전"));
		endPage = endPage > totalPage? totalPage : endPage;
		for(long i = startPage; i<=endPage; i++) {
			if(currentPage==i) {
				html.append(i);
			}else {
				html.append(String.format(pattern, funcName, i, i+""));
			}
		}
		if(endPage<totalPage)
			html.append(String.format(pattern, funcName, (endPage+1), "다음"));
		return html.toString();
	}
	
	String bootstrapPtrn = "<li %s><a class='page-link' href='#' onclick='%s'>%s</a></li>";

	public String getPagingHTMLForBS(){
		StringBuffer html = new StringBuffer();
		html.append("<nav aria-label='Page navigation'>");
		html.append("<ul class='pagination justify-content-center'>");
		
		html.append(String.format(bootstrapPtrn, 
						startPage>1?"class='page-item'":"class='page-item disabled' tabindex='-1'",
						startPage>1?funcName +"("+ (startPage-1) +");" : 
									"return false;", 
						"<i class='fa fa-angle-left' aria-hidden='true'></i>"));
		endPage = endPage > totalPage? totalPage : endPage;
		for(long i = startPage; i<=endPage; i++) {
			html.append(String.format(bootstrapPtrn, 
							currentPage==i?"class='page-item active'":"class='page-item'",
						    funcName +"(" + i + ");",
						    i+ (currentPage==i?"<span class='sr-only'>(current)</span>":"") 		
					));
		}
		
		html.append(String.format(bootstrapPtrn, 
					endPage<totalPage?"class='page-item'":"class='page-item disabled''",
					endPage<totalPage?funcName +"("+ (endPage+1) +");" : 
								"return false;",
					"<i class='fa fa-angle-right' aria-hidden='true'></i>"));
		
		html.append("</ul>");
		html.append("</nav>");
		return html.toString();
	}
}