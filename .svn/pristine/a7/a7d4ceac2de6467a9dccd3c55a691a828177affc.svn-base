package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Min;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotBlank;

import kr.or.ddit.common.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"annl_no"})
public class AnnounceVO {
	private Integer annl_no;
	private String annl_category;
	@NotBlank
	private String annl_title;
	private String annl_date;
	@NotBlank
	private String annl_closeing;
	private Integer annl_career;
	private String annl_gender;
	@NotBlank
	private String annl_sal;
	private String annl_st;
	@NotBlank
	private String annl_addr1;
	private String annl_addr2;
	private String annl_feb;
	private String annl_homepage;
	private String annl_other;
	@Min(0)
	private Integer annl_num;
	private String mem_id;
	private String finished;
	private Integer dday;
	private Integer scrapCount;
	
	
//	유저정보(기업사진)
	private byte[] mem_profile;
	
//	유저 사진을 base64 포맷을 변환
	public String getMem_profileBase64(){
		if(mem_profile==null) {
			return null;
		}else {
			return Base64.encodeBase64String(mem_profile);
		}
	}

	//	기업정보(기업이름)
	private String ent_name;
	
	private List<LicenseVO> licenseList;
	
	private List<LicenseVO> licenseDelete;
	
//	클라이언트 단을 통해 받은 자격증 정보들
	private transient String[] licenseNameList;
//	클라이언트 단을 통해 받은 삭제할 자격증 정보들
	private transient String[] licenseDelList;
	
	public void setLicenseList(LicenseVO licenseVO) {
		if(licenseVO == null) return;
		if(licenseList == null) licenseList = new ArrayList<>();
		if(StringUtils.isNotBlank(licenseVO.getCer_name())) {
			licenseList.add(licenseVO);
		}
	}
	
	public void setLicenseNameList(String[] licenseNameList) {
		if(licenseNameList == null || licenseNameList.length == 0) return;
		if(licenseList == null) licenseList = new ArrayList<>();
		for(String licenseName : licenseNameList) {
			if(StringUtils.isBlank(licenseName)) continue;
			LicenseVO licenseVO = new LicenseVO();
			licenseVO.setCer_name(licenseName);
			licenseList.add(licenseVO);
		}
	}
	public void setLicenseDelList(String[] licenseDelList) {
		if(licenseDelList == null || licenseDelList.length == 0) return;
		if(licenseDelete == null) licenseDelete = new ArrayList<>();
		for(String licenseDel : licenseDelList) {
			if(StringUtils.isBlank(licenseDel)) continue;
			LicenseVO licenseVO = new LicenseVO();
			licenseVO.setCer_name(licenseDel);
			licenseDelete.add(licenseVO);
		}
	}
	
	
}
