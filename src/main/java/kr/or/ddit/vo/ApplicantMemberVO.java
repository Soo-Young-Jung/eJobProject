package kr.or.ddit.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"mem_id"})
public class ApplicantMemberVO {
	
	private String mem_id;
	private String mem_name;
	
	private String er_age;
	private String er_gender;
	private String er_career;
	
	private String er_no;
	
}
