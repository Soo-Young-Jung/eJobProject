package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ResumeVO {
	 private  long er_no;
	 private  String er_age;
	 private  String er_gender;
	 private  String er_feb;
	 private  String er_career;
	 private  String er_interest;
	 private  String mem_id;
	 private  String er_name;
	 private  String er_jobsearch;
	 private  String er_title;
	 private  String er_open;
	 
	 //블로그 정보에서 사용할 구직정보 상태 저장할 변수
	 private String jobsearch;
	 	 
	 private Long[] delFiles;
	 
	 public void setFile_file(MultipartFile[] file_file) {
			if(file_file==null) return;
			attatchList = new ArrayList<>();	
			for(MultipartFile tmp : file_file) {
				if(StringUtils.isBlank(tmp.getOriginalFilename())) continue;
				attatchList.add(new MypageAttatchVO(tmp));
			}
			
		}
	 
	 private transient List<MypageAttatchVO> attatchList;
}
