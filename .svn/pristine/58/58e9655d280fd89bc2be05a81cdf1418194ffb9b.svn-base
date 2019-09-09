package kr.or.ddit.listener;

import java.util.Set;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import kr.or.ddit.vo.MemberVO;

//@WebListener
public class CustomSessionAttributeListener implements HttpSessionAttributeListener {

    public void attributeAdded(HttpSessionBindingEvent event)  { 
    	if("authMember".equals(event.getName())) {
    		Set<MemberVO> users = (Set<MemberVO>) event.getSession().getServletContext().getAttribute("userList");
    		MemberVO authMember = (MemberVO) event.getValue();
    		users.add(authMember);
    	}
    }

    public void attributeRemoved(HttpSessionBindingEvent event)  {
    	if("authMember".equals(event.getName())) {
    		Set<MemberVO> users = (Set<MemberVO>) event.getSession().getServletContext().getAttribute("userList");
    		MemberVO authMember = (MemberVO) event.getValue();
    		users.remove(authMember);
    	}
    }

    public void attributeReplaced(HttpSessionBindingEvent event)  { 
    }
	
}
