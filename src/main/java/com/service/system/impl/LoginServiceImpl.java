package com.service.system.impl;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.dao.system.UserMapper;
import com.google.gson.Gson;
import com.model.pojo.AccountInfo;
import com.model.system.User;
import com.service.system.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	private Gson g =new Gson();
	
	@Resource
	private UserMapper userMapper;

	@Override
	public String checkLoginName(HttpServletRequest request) {
		String loginName = request.getParameter("loginName");
		if (loginName != null) {
			User user = userMapper.queryUserByLoginName(loginName);
			if (user != null) {
				return "SUCCESS";
			} else {
				return "FAIL";
			}
		} else {
			return "FAIL";
		}
	}

	@Override
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String loginName = request.getParameter("loginName");
		User user = userMapper.queryUserByLoginName(loginName);
		if (user != null) {
			String password = request.getParameter("password");
			if (password.equals(user.getPassword())) {
				if (user.getUserStatus().equalsIgnoreCase("on")) {
					request.getSession().setAttribute("loginName", user.getLoginName());
					// 记住账户操作
					String remember = request.getParameter("remember");
					if (remember.equals("ture")) {
						Cookie cookie = new Cookie("ERP", user.getLoginName());// 设置一个新的Cookie
						cookie.setMaxAge(10 * 24 * 60 * 60);// 记住30天
						response.addCookie(cookie);// 写入一个新的Cookie
					}
					return "SUCCESS";
				} else {
					return "FAIL";
				}
			} else {
				return "FAIL";
			}
		} else {
			return "FAIL";
		}
	}

	@Override
	public void loginOut(HttpServletRequest request) {
		request.getSession().invalidate();
	}

	@Override
	public String rememberMe(HttpServletRequest request) {
		// TODO 自动生成的方法存根
		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("ERP")) {
				User user = userMapper.queryUserByLoginName(c.getValue());;// 由Cookie中的主键得到用户信息
				AccountInfo accountInfo = new AccountInfo();// 用于封装登录信息的pojo对象
				accountInfo.setLoginName(user.getLoginName());
				accountInfo.setPassword(user.getPassword());
				if (accountInfo != null) {
					return g.toJson(accountInfo);// 以Json格式发送回去
				}
			}
		}
		return "NULL";// 没有此信息返回NULL标识
	}

	@Override
	public void removeRememberMe(HttpServletRequest request,HttpServletResponse response) {
		// TODO 自动生成的方法存根
				Cookie[] cookies=request.getCookies();
				for(Cookie c:cookies) {
					if(c.getName().equals("ERP")) {
						c.setMaxAge(0);
						response.addCookie(c);//将Cookie生命置为0后要重新发送回去以生效
						break;
					}
				}
	}

}
