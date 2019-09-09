package kr.or.ddit.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController{

	@RequestMapping(value="/file/upload.do", method=RequestMethod.POST)
	public String process(String uploader, MultipartFile uploadFile, 
						HttpSession session, Model model) throws ServletException, IOException {
		 	
			File saveFolder = new File("d:/savefiles");
			
			// 원본 파일명
			String filename = uploadFile.getOriginalFilename();
			
			// 저장 파일명
//			filename+"_"+System.currentTimeMillis()
			String savename = UUID.randomUUID().toString();
			File saveFile = new File(saveFolder, savename);
			try(
				InputStream is = uploadFile.getInputStream();
			){
				FileUtils.copyInputStreamToFile(is, saveFile);
			}		
			
			// 다운로드시에 사용할 원본 파일명
			session.setAttribute("filename", filename);
			
			Map<String, Object> result = new LinkedHashMap<>();
			result.put("uploader", uploader);
			result.put("filename", filename);
			result.put("uploadFile", saveFile);
			model.addAttribute("result", result);
			
			return "file/view";
	}

}










