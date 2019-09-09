package kr.or.ddit.mypage.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.vo.MypageAttatchVO;

public class MypageDownloadView extends AbstractView {

	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		MypageAttatchVO attatch = (MypageAttatchVO) model.get("attatch");
		
		String originalFilename = attatch.getFile_orgn();
		File inputFile = new File(saveFolder, attatch.getFile_saven());
		
		resp.setContentType("application/octet-stream");
		originalFilename = new String(originalFilename.getBytes(), "ISO-8859-1");
		resp.setHeader("Content-Disposition", "attatchment;filename=\""+originalFilename+"\"");
		try(
			FileInputStream is = new FileInputStream(inputFile);
			OutputStream os = resp.getOutputStream();
		){
			FileUtils.copyFile(inputFile, os);
		}
	}
}