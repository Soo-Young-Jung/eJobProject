package kr.or.ddit.blog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import kr.or.ddit.blog.dao.IBlogDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogBoardVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.FollowVO;
import kr.or.ddit.vo.MemberLicVO;
import kr.or.ddit.vo.ResumeVO;

@Service
public class BlogServiceImpl implements IBlogService {
	
	private BlogServiceImpl(){}
	private static BlogServiceImpl service;
	public static BlogServiceImpl getInstance() {
		if(service==null) service = new BlogServiceImpl();
		return service;
	}
	
	@Inject
	IBlogDAO blogDAO;
	
	@Override
	public ServiceResult modifyBlog(BlogVO blog) {
		int cnt = blogDAO.updateBlog(blog);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			result = ServiceResult.OK; 
		}
		return result;
	}
	
	@Override
	public BlogVO retrieveBlog(String mem_id) {
		BlogVO blog = blogDAO.selectBlog(mem_id);
		return blog;
	}
	
	@Override
	public List<BlogVO> retrieveBlogList() {
		List<BlogVO> blogList = blogDAO.selectBlogList();
		return blogList;
	}

	@Override
	public List<FollowVO> retrieveFollowList(String mem_id) {
		return blogDAO.selectFollowList(mem_id);
	}

	@Override
	public ServiceResult createBlog(BlogVO blog) {
		int cnt = blogDAO.insertBlog(blog);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			result = ServiceResult.OK; 
		}
		return result;
	}

	@Override
	public List<MemberLicVO> retrieveLicList(String mem_id) {
		return blogDAO.selectLicList(mem_id);
	}

	@Override
	public ResumeVO retrieveJobStatus(String mem_id) {
		return blogDAO.selectJobStatus(mem_id);
	}

	@Override
	public ServiceResult sendtoUser(String mem_id, String mail, String subject, String content) {
		String user = "sdamjder@naver.com";
		String password = "guddnr12#$";
		
		ServiceResult result = ServiceResult.FAILED;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mail", mail);
		map.put("subject", subject);
		map.put("content", content);
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
			message.setSubject("[이잡어때]"+subject);
			
			message.setText(content);
			
			Transport.send(message);
			
			result = ServiceResult.OK;
		}catch(AddressException e) {
			e.printStackTrace();
		}
		catch(MessagingException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<BlogBoardVO> retrieveRecentBoard(String mem_id) {
		return blogDAO.selectBoardList(mem_id);
	}
	
}
