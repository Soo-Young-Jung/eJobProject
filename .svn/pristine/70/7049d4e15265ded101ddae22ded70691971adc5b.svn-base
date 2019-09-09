package kr.or.ddit.vo;

import java.io.IOException;

import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import kr.or.ddit.common.validation.IdPattern;
import kr.or.ddit.common.validation.PasswordPattern;
import kr.or.ddit.common.validation.TelPattern;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"mem_id"})
public class MemberVO {
	@IdPattern
	private String mem_id;
	@PasswordPattern
	private String mem_pass;
	@NotBlank(message = "이름을 입력해주세요")
	private String mem_name;
	@Email
	private String mem_mail;
	@TelPattern
	private String mem_tel;
	private String mem_div;
	private String mem_delete;
	private String mem_add1;
	private String mem_add2;
	private byte[] mem_img;
	public String getMem_imgBase64(){
		if(mem_img==null) {
			return null;
		}else {
			return Base64.encodeBase64String(mem_img);
		}
	}
	
	//팔로우 땜에 하나 만들었습니다;;
	private transient List<FollowVO> followList;
	
	//기업 회원 이미지 출력
	private transient List<MemberVO> profileList;
	
	//기업 이름 저장
	private String ent_name;
	
	///////////////////////////////////////////////////////////
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
	
	@JsonIgnore
	private MultipartFile mem_image;
	
	public void setMem_image(MultipartFile mem_image) throws IOException {
		this.mem_image = mem_image;
		if(mem_image!=null && !mem_image.isEmpty() 
				&& mem_image.getContentType().startsWith("image/")){
			mem_profile = mem_image.getBytes();
		}
	}
	
}
