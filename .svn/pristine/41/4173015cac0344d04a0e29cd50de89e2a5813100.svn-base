package kr.or.ddit.vo;

import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"ba_no", "bb_no"})
public class BlogBoardAttatchVO {
	public BlogBoardAttatchVO(MultipartFile item){
		this.item = item;
		ba_filename = item.getOriginalFilename();
		ba_mime = item.getContentType();
		ba_filesize = item.getSize();
		ba_savename = UUID.randomUUID().toString();
		ba_fancysize = FileUtils.byteCountToDisplaySize(ba_filesize);
	}
	private MultipartFile item;
	private long ba_no;
	private long bb_no;
	private String ba_filename;
	private String ba_savename;
	private String ba_mime;
	private long ba_filesize;
	private String ba_fancysize;
	private Integer ba_download;
}
