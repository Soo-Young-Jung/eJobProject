package kr.or.ddit.common.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController{

	@RequestMapping("/file/download.do")
	public String process(@RequestParam(name="file", required=true) String filename , 
				HttpServletResponse resp, HttpSession session) throws ServletException, IOException {

		File saveFolder = new File("d:/savefiles");
		File inputFile = new File(saveFolder, filename);
		if(!inputFile.exists()) {
			resp.sendError(404);
			return null;
		}
		
		String originalFilename = (String) session.getAttribute("filename");
		
		resp.setContentType("application/octet-stream");
//		originalFilename = URLEncoder.encode(originalFilename, "UTF-8");
		originalFilename = new String(originalFilename.getBytes(), "ISO-8859-1");
		resp.setHeader("Content-Disposition", "attatchment;filename=\""+originalFilename+"\"");
		try(
			FileInputStream is = new FileInputStream(inputFile);
			OutputStream os = resp.getOutputStream();	
		){
			byte[] buffer = new byte[1024];
			int cnt = -1;
			while((cnt=is.read(buffer))!=-1) {
				os.write(buffer, 0, cnt);
			}
		}
		
		return null;
	}

}











