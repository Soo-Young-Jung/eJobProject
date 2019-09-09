package kr.or.ddit.common;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtils {
	public static String uploadFile(MultipartFile image, File saveFolder, String saveName) throws IOException {
		if(image==null || StringUtils.isBlank(image.getOriginalFilename())) {
			return null;
		}
		File saveFile = new File(saveFolder, saveName);
		try (
				InputStream is = image.getInputStream();
				){
			FileUtils.copyInputStreamToFile(is, saveFile);
		}
		return saveName;
	}
}
