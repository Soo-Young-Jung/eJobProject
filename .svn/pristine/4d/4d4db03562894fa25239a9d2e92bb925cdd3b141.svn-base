package kr.or.ddit.blog.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.vo.BlogBoardAttatchVO;
import kr.or.ddit.vo.MypageAttatchVO;

public class BlogDownloadView extends AbstractView {

	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		String div = (String) model.get("div");
		if(div.equals("BL")) {
			BlogBoardAttatchVO attatch = (BlogBoardAttatchVO) model.get("blAttatch");
			
			String originalFilename = attatch.getBa_filename();
			File inputFile = new File(saveFolder, attatch.getBa_savename());
			
			resp.setContentType("application/octet-stream");
			originalFilename = new String(originalFilename.getBytes(), "ISO-8859-1");
			resp.setHeader("Content-Disposition", "attatchment;filename=\""+originalFilename+"\"");
			resp.setHeader("Content-Length", attatch.getBa_filesize()+"");
			try(
					FileInputStream is = new FileInputStream(inputFile);
					OutputStream os = resp.getOutputStream();
					){
				FileUtils.copyFile(inputFile, os);
			}
		}else {
			MypageAttatchVO attatch = (MypageAttatchVO) model.get("myAttatch");
			
			String originalFilename = attatch.getFile_orgn();
			File inputFile = new File(saveFolder, attatch.getFile_saven());
			
			resp.setContentType("application/octet-stream");
			originalFilename = new String(originalFilename.getBytes(), "ISO-8859-1");
			resp.setHeader("Content-Disposition", "attatchment;filename=\""+originalFilename+"\"");
			resp.setHeader("Content-Length", attatch.getFile_saven()+"");
			try(
					FileInputStream is = new FileInputStream(inputFile);
					OutputStream os = resp.getOutputStream();
					){
				FileUtils.copyFile(inputFile, os);
		}
	}
}
}