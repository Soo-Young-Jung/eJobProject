package kr.or.ddit.vo;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import kr.or.ddit.common.validation.EntNoPattern;
import kr.or.ddit.common.validation.IdPattern;
import kr.or.ddit.common.validation.TelPattern;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"mem_id"})
public class Ent_infoVO { // 기업 멤버
	@IdPattern
	private String mem_id; // 기업 아이디
	@EntNoPattern
	private String ent_no; // 사업자 등록증
	@NotBlank(message="기업이름을 입력해주세요")
	private String ent_name; // 기업이름
	@NotBlank(message="대표이름을 입력해주세요")
	private String ent_ceo; // 대표이름
	@NotBlank(message="회사분류를 입력해주세요")
	private String ent_category; // 분류
	
	private String ent_addr1; // 우편번호
	private String ent_addr2; // 상세주소
	@TelPattern
	private String ent_tel; // 기업전화번호
	@Email
	private String ent_mail; // 기업메일
	
}
