package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"br_no", "bb_no"})
public class BlogReplyVO implements Serializable{
	
	public BlogReplyVO(Integer bb_no) {
		super();
		this.bb_no = bb_no;
	}
	
	public BlogReplyVO(Integer bb_no, String br_writer) {
		super();
		this.bb_no = bb_no;
		this.br_writer = br_writer;
	}
	
	private long rnum;
	private Integer br_no;
	private Integer bb_no;
	private String br_writer;
	private String br_date;
	private String br_mail;
	private String br_content;
}
