package kr.or.ddit.vo;

import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"att_no", "att_no"})
public class AttatchVO {
	public AttatchVO(MultipartFile item){
		this.item = item;
		att_filename = item.getOriginalFilename();
		att_mime = item.getContentType();
		att_filesize = item.getSize();
		att_savename = UUID.randomUUID().toString();
		att_fancysize = FileUtils.byteCountToDisplaySize(att_filesize);
	
	}
	
	private MultipartFile item;
	private Long att_no;
	private Long bo_no;
	private String att_filename;
	private String att_savename;
	private String att_mime;
	private Long att_filesize;
	private String att_fancysize;
	private Integer att_download;
	
}
