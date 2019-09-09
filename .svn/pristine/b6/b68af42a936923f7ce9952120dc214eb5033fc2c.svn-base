package kr.or.ddit.vo;

import org.apache.commons.codec.binary.Base64;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Ent_info2VO {
	private String mem_id; // 기업 아이디
	private String ent_no; // 사업자 등록증
	private String ent_name; // 기업이름
	private String ent_ceo; // 대표이름
	private String ent_category; // 분류
	private String ent_addr1; // 우편번호
	private String ent_addr2; // 상세주소
	private String ent_tel; // 기업전화번호
	private String ent_mail; // 기업메일
	@JsonIgnore
	private byte[] mem_profile;
	
	@JsonProperty("mem_profileBase64")
	public String getMem_profileBase64(){
		String base64String = null;
		if(mem_profile!=null){
			base64String = Base64.encodeBase64String(mem_profile);
		}
		return base64String;
	}
}
