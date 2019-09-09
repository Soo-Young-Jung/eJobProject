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
@EqualsAndHashCode(of= {"evt_no", "evtt_no"})
public class EventAttatchVO {
	public EventAttatchVO(MultipartFile item){
		this.item = item;
		evt_filename = item.getOriginalFilename();
		evt_mime = item.getContentType();
		evt_filesize = item.getSize();
		evt_savename = UUID.randomUUID().toString();
		evt_fancysize = FileUtils.byteCountToDisplaySize(evt_filesize);
		
	}
	private MultipartFile item;
	private Long evt_no;
	private Long evtt_no;
	private String evt_filename;
	private String evt_savename;
	private String evt_mime;
	private Long evt_filesize;
	private String evt_fancysize;
	private Integer evt_download;
}
