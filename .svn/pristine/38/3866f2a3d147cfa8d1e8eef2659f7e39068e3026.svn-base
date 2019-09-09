package kr.or.ddit.vo;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"evt_no"})
public class EventVO implements Serializable{
	
		
	private long evt_no;
	private String evt_title;
	private String evt_content;
	private String evt_date;
	private String mem_id;
	private String evt_closeing;
	private String evt_qualification;
	private int evt_money;
	private String evt_file;
	private String evt_organizer;
	
	
	private String num;
	
	// 삭제할 첨부파일에 대한 정보
	private Long[] delFiles;
	
	// 게시글 삭제 프로시저의 out bound 변수용.//////////////////////////////////////////////
	private int rowcnt;
	
	public void setBo_files(MultipartFile[] bo_files) {
		if(bo_files==null) return;
		attatchList = new ArrayList<>();		
		for(MultipartFile tmp : bo_files) {
			if(StringUtils.isBlank(tmp.getOriginalFilename())) continue;
			attatchList.add(new EventAttatchVO(tmp));
		}
		
	}
	
	private transient List<EventAttatchVO> attatchList;
	
	private long rep_cnt;
	
	
	
	// 이미지//////////////////////////////////////////////////////////////////////////
	@JsonIgnore
	private byte[] evt_profile;
	
	
	@JsonProperty("evt_profileBase64")
	public String getEvt_profileBase64(){
		String base64String = null;
		if(evt_profile!=null){
			base64String = Base64.encodeBase64String(evt_profile);
		}
		return base64String;
	}
	@JsonIgnore
	private MultipartFile evt_image;
	
	public void setEvt_image(MultipartFile evt_image) throws IOException {
		this.evt_image = evt_image;
		if(evt_image!=null && !evt_image.isEmpty() 
				&& evt_image.getContentType().startsWith("image/")){
			evt_profile = evt_image.getBytes();
		}
	}
///////////////////////////////////////////////////////////////////////////////////////////
	
	

}
