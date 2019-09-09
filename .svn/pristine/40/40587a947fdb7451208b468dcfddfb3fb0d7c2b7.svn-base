package kr.or.ddit.vo;

import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MypageAttatchVO {
	public MypageAttatchVO(MultipartFile item){
		this.item = item;
		file_orgn = item.getOriginalFilename();
		file_saven = UUID.randomUUID().toString();
	}
	private MultipartFile item;
	private String mem_id;
	private int file_no;
	private String file_orgn;
	private String file_saven;
	private long er_no;
	
}
