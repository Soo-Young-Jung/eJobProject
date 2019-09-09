package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of = {"mem_id"})
public class BlogCategoryVO implements Serializable {
	
	private long bc_no;
	private String mem_id;
	private String bc_name;
	
	private transient List<BlogCategoryVO> categoryList; 
	
}
