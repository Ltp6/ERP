package com.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class VisitorCountListener implements HttpSessionListener {
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		ServletContext sc = se.getSession().getServletContext();
		Integer c = (Integer) sc.getAttribute("visitorCount");
		c++;
		sc.setAttribute("visitorCount", c);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		ServletContext sc = se.getSession().getServletContext();
		Integer c = (Integer) sc.getAttribute("visitorCount");
		c--;
		if (c < 0) {
			c = 0;
		}
		sc.setAttribute("visitorCount", c);
	}

}
