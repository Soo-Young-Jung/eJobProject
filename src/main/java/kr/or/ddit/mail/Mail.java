package kr.or.ddit.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.Ent_info2VO;
import kr.or.ddit.vo.MemberVO;

public class Mail {
	
	
	
	
	public void succ(MemberVO memberVO, AnnounceVO announceVO, Ent_info2VO ent_info2VO) {
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
		
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(memberVO.getMem_mail()));
			
			// Subject
			message.setSubject(announceVO.getAnnl_title() + " 공고 지원에 합격하신 것을 축하드립니다.");
			
			String setText = "";
			setText += "당신이 지원하신 " + ent_info2VO.getEnt_name() + " 기업의 " + announceVO.getAnnl_title() + " 공고에 합격하였습니다. 축하드립니다.<br>";
			setText += ent_info2VO.getEnt_name() +  " 기업의 연락 담당자 : " + ent_info2VO.getEnt_ceo() + " 기업의 연락처 : " + ent_info2VO.getEnt_tel();
			message.setContent(setText, "text/html; charset=euc-kr");
			
			
			Transport.send(message);
			
		}catch(AddressException e) {
			e.printStackTrace();
		}
		catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	public void rec(MemberVO memberVO, AnnounceVO announceVO, Ent_info2VO ent_info2VO) {
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
		
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(memberVO.getMem_mail()));
			
			  // Subject
			   message.setSubject(ent_info2VO.getEnt_name() + " 기업이 당신에게 새로운 일자리를 추천합니다.");
			   
			   String setText = "";
			   setText += ent_info2VO.getEnt_name() + " 기업이 당신에게 " + announceVO.getAnnl_title() + " 에 지원해주기를 추천 합니다.<br>";
			   setText += "<a href='" + "http://localhost/eJobProject/announce/announceView.do?annl_no=" + announceVO.getAnnl_no() + "'>";
			   setText += "바로가기</a>";
			  message.setContent(setText, "text/html; charset=euc-kr");
			
			
			Transport.send(message);
			
		}catch(AddressException e) {
			e.printStackTrace();
		}
		catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
}
