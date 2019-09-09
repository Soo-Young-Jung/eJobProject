package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.codec.binary.Base64;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"mem_id"})
public class BlogVO implements Serializable {
	private String mem_id;
	private String mem_name;
	private String blog_name;
	private String blog_date;
	private String blog_status;
	private String blog_introduce;
	
	private List<FollowVO> followList;
	private List<HashtagVO> hashList;
	private List<BlogCategoryVO> categoryList;
	private List<MemberLicVO> memberLicList;
	private List<BlogBoardVO> boardList;
	
	private String mem_div;
	private String jobsearch;
	private byte[] mem_profile;
	
	public String getMem_imgBase64(){
		if(mem_profile==null) {
			return null;
		}else {
			return Base64.encodeBase64String(mem_profile);
		}
	}
}
