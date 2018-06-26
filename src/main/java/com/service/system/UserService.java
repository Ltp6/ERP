package com.service.system;

import javax.servlet.http.HttpServletRequest;

import com.model.system.User;

public interface UserService {

	String addUser(HttpServletRequest request);

	String queryAllUser(HttpServletRequest request);

	String queryStaLoginName(HttpServletRequest request);

	String getAllPage(HttpServletRequest request);

	void resetPwdByUserId(HttpServletRequest request);

	void updatePrepareUserByUserId(HttpServletRequest request);

	void updateUserByUserId(HttpServletRequest request, User user);

	void deleteUserByUserId(HttpServletRequest request);

}
