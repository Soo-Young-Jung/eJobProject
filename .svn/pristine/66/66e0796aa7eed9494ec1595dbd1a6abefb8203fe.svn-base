package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

@Data
public class NoticeBoardVO implements Serializable {
	// implements Serializable 추가
	
	
	private int not_no; // 게시글 번호
	private String not_title; // 게시글 제목
	private String not_content; // 게시글 내용
	private String not_div; // 공지구분자
	private String adm_id; // 관리자 아이디
	private String not_date; // 작성 날짜
	
	
	private transient List<AttatchVO> attatchList;
	
	private long rep_cnt;
	
}
