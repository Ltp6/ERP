package com.service.system;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LoginService {

	String checkLoginName(HttpServletRequest request);

	String login(HttpServletRequest request,HttpServletResponse response);

	void loginOut(HttpServletRequest request);

	String rememberMe(HttpServletRequest request);

	void removeRememberMe(HttpServletRequest request, HttpServletResponse response);

}
