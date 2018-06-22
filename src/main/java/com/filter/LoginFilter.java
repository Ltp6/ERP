package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dao.system.UserMapper;
import com.model.system.User;

public class LoginFilter implements Filter {

	private ApplicationContext context;// IOC容器
	private HttpServletRequest httpRequest;
	private UserMapper userMapper;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// 在非IOC容器生成的对象中获取Spring的IOC容器。
		context = WebApplicationContextUtils.getWebApplicationContext(filterConfig.getServletContext());
		userMapper = context.getBean(UserMapper.class);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String path = httpRequest.getServletPath();
		// 请求合法性判定，对所有非登录页面的访问进行判定
		if (path.equals("/login.jsp")) {
			chain.doFilter(request, response);
		} else {
			String loginName = (String) httpRequest.getSession().getAttribute("loginName");
			if (loginName != null) {
				User user = userMapper.queryUserByLoginName(loginName);
				if (user != null) {
					if (user.getUserStatus().equalsIgnoreCase("on")) {
						System.out.println("放行");
						chain.doFilter(request, response);// 放行
					} else {
						httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
					}
				} else {
					httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
				}
			} else {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
			}
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
