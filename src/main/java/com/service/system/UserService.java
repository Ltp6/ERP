package com.service.system;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

	void addUser(HttpServletRequest request);

	String queryAllUser(HttpServletRequest request);

	String getAllPage(HttpServletRequest request);

	void queryAllUserTest(HttpServletRequest request);

	String queryStaLoginName(HttpServletRequest request);

}
