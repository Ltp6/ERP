package com.service.system;

import javax.servlet.http.HttpServletRequest;

public interface indexService {

	String queryStaNameByloginName(HttpServletRequest request);

	String queryUserNameByloginName(HttpServletRequest request);

	String getServerIP(HttpServletRequest request);

	String getServerName(HttpServletRequest request);

	String getVisitorCount(HttpServletRequest request);

	String getSessionTimeOut(HttpServletRequest request);

	String getServerTime(HttpServletRequest request);



}
