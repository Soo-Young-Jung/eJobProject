package kr.or.ddit.blog.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BlogUploadImageController{
	@Inject
	WebApplicationContext container;

	@Value("#{appInfo['blogImages']}")
	String saveUrl;
	
	@PostMapping("/bloghome/uploadImage.do")
	@ResponseBody
	public Map<String, String> process(@RequestPart(name="upload", required=true) MultipartFile image) throws IOException{
		Map<String, String> resultMap = new HashMap<>();
		String filename = image.getOriginalFilename();
		if(StringUtils.isNotBlank(filename)) {
			File saveFolder = new File( container.getServletContext().getRealPath(saveUrl) );
			if(!saveFolder.exists()) saveFolder.mkdirs();
			String savename = UUID.randomUUID().toString();
			try(
				InputStream is = image.getInputStream();	
			){
				FileUtils.copyInputStreamToFile(is, new File(saveFolder, savename));
			}
			//		fileName, uploaded, url
			resultMap.put("fileName", filename);
			resultMap.put("uploaded", "1");
			resultMap.put("url", container.getServletContext().getContextPath() + saveUrl +"/"+ savename);
		}
		return resultMap;
	}

}











