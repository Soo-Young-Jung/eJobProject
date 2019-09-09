package kr.or.ddit.listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


@WebListener
public class CustomSessionListener implements HttpSessionListener {

    public void sessionCreated(HttpSessionEvent se)  { 
       ServletContext application = se.getSession().getServletContext();
       Integer userCount = (Integer) application.getAttribute("userCount");
       application.setAttribute("userCount", new Integer(userCount.intValue() + 1));
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
    	ServletContext application = se.getSession().getServletContext();
        Integer userCount = (Integer) application.getAttribute("userCount");
        application.setAttribute("userCount", new Integer(userCount.intValue() - 1));
    }
	
}








