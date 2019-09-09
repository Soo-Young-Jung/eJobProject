package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of={"bb_no"})
public class BlogBoardVO implements Serializable {
	private long rnum;
	private Integer bb_no;
	private long bc_no;
	private String bc_title;
	private String bc_content;
	private String bc_date;
	private long bc_hit;
	private String bc_class;
	private String bc_video;
	private String bc_writer;
	
	// 삭제할 첨부파일에 대한 정보
	private Long[] delFiles;
	
	// 게시글 삭제 프로시저의 out bound 변수용.
	private int rowcnt;
	
	public void setBc_files(MultipartFile[] bc_files) {
		if(bc_files==null) return;
		attatchList = new ArrayList<>();		
		for(MultipartFile tmp : bc_files) {
			if(StringUtils.isBlank(tmp.getOriginalFilename())) continue;
			attatchList.add(new BlogBoardAttatchVO(tmp));
		}
	}
	
	private transient List<BlogReplyVO> replyList;
	private transient List<BlogBoardAttatchVO> attatchList;
	private transient List<HashtagVO> hashtagList;
	
	private long br_cnt;
	private String bc_name;
}
