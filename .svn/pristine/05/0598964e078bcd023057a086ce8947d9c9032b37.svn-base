package kr.or.ddit.mypage.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mypage.dao.IMypageDAO;
import kr.or.ddit.vo.CareerVO;
import kr.or.ddit.vo.Ent_infoVO;
import kr.or.ddit.vo.LoginRecordVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MypageAttatchVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ResumeVO;

@Service
public class MypageServiceImpl implements IMypageService {

	@Inject
	IMypageDAO dao;
	
	@Inject
	WebApplicationContext container;
	
	
	@Override
	public List<LoginRecordVO> loginrecord(String mem_id) {
		return dao.loginrecord(mem_id);
	}
	
	@Override
	public String SendMail(String mail) {
		String user = "qnco23@gmail.com";
		String password = "askdhaw13!";
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
		uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌. 
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
			message.setSubject("안녕하세요 이잡어때 입니다.");
			
			message.setText("이메일 확인코드는 \n" + uuid + " 입니다.");
			
			Transport.send(message);
			
		}catch(AddressException e) {
			e.printStackTrace();
		}
		catch(MessagingException e) {
			e.printStackTrace();
		}
		return uuid;
	}

	@Override
	public MemberVO searchMember(String mem_id) {
		return dao.searchMember(mem_id);
	}

	@Override
	public ServiceResult editMember(MemberVO member) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.editMember(member);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}
	
	@Override
	public ServiceResult editEntMember(MemberVO member) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.editEntMember(member);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult insertResume(ResumeVO resume) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.insertResume(resume);
		if(cnt > 0) {
			processFiles(resume);
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult insertCareer(CareerVO career) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.insertCareer(career);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public int countResume(String mem_id) {
		return dao.countResume(mem_id);
	}

	@Override
	public List<ResumeVO> selectResume(String mem_id) {
		return dao.selectResume(mem_id);
	}

	@Override
	public String searchId(MemberVO member) {
		return dao.searchId(member);
	}

	@Override
	public String searchPass(MemberVO member) {
		return dao.searchPass(member);
	}

	@Override
	public ResumeVO searchResume(int er_no) {
		return dao.searchResume(er_no);
	}

	@Override
	public CareerVO searchCareer(CareerVO career) {
		return dao.searchCareer(career);
	}

	@Override
	public ServiceResult editResume(ResumeVO resume) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.editResume(resume);
		if(cnt > 0) {
			processFiles(resume);
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult editCareer(CareerVO career) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.editCareer(career);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	
	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	private void processFiles(ResumeVO resume) {
		Long[] delFiles = resume.getDelFiles();
		if(delFiles!=null && delFiles.length>0) {
			for(Long delFileNo : delFiles) {
				MypageAttatchVO saved = dao.selectAttatch(resume.getEr_no());
				dao.deleteAttatch(delFileNo);
				FileUtils.deleteQuietly(new File(saveFolder, saved.getFile_saven()));
			}
		}
		
		
		
		List<MypageAttatchVO> attatchList= resume.getAttatchList();
		if(attatchList==null || attatchList.size()==0) return;
		
//		if(1==1) throw new RuntimeException("트랜잭션 관리 여부 확인을 위한 예외");
		long er_no = dao.selectErno(resume);
		for(MypageAttatchVO attatch : attatchList) {
			attatch.setEr_no(er_no);
			attatch.setMem_id(resume.getMem_id());
			dao.insertMypageAttatch(attatch);
			File saveFile = new File(saveFolder, attatch.getFile_saven());
			try(
				InputStream is = attatch.getItem().getInputStream();
			){
				FileUtils.copyInputStreamToFile(is, saveFile);
			}catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	@Override
	public ServiceResult insertMypageAttatch(ResumeVO resume) {
		ServiceResult result = ServiceResult.FAILED;
//		int cnt = processFiles(resume);
//		if(cnt > 0) {
//			result = ServiceResult.OK;
//		}
		return result;
	}

	@Override
	public MypageAttatchVO selectAttatch(long er_no) {
		return dao.selectAttatch(er_no);
	}

	@Override
	public ServiceResult deleteAttatch(long er_no) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.deleteAttatch(er_no);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult deleteResume(ResumeVO resume) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.deleteResume(resume);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult deleteCareer(CareerVO career) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.deleteCareer(career);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}
	

	@Override
	public int selectOpen(String mem_id) {
		return dao.selectOpen(mem_id);
	}

	@Override
	public int checkTitle(String er_title) {
		return dao.checkTitle(er_title);
	}
	
	@Override
	public int resumeCount(String mem_id) {
		return dao.resumeCount(mem_id);
	}

	@Override
	public int recordCount(String mem_id) {
		return dao.recordCount(mem_id);
	}

	@Override
	public List<LoginRecordVO> recordList(PagingVO paging) {
		return dao.recordList(paging);
	}

	@Override
	public Ent_infoVO searchEntInfo(String mem_id) {
		return dao.searchEntInfo(mem_id);
	}

	@Override
	public ServiceResult editEntInfo(Ent_infoVO ent) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.editEntInfo(ent);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public long openResume(String mem_id) {
		return dao.openResume(mem_id);
	}
}
