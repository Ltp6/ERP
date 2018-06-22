package com.controller.system;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.util.controller.BaseController;
@Controller
@RequestMapping("/loginController")
public class LoginController extends BaseController{

	
	@RequestMapping("/checkLoginName.ajax")
	@ResponseBody
	public String checkLoginName(HttpServletRequest request) {
		"a".equals("");
		return loginService.checkLoginName(request);
	}
	@RequestMapping("/login.ajax")
	@ResponseBody
	public String login(HttpServletRequest request,HttpServletResponse response) {
		return loginService.login(request,response);
	}
	@RequestMapping("/loginOut.do")
	public String loginOut(HttpServletRequest request) {
		loginService.loginOut(request);
		return "/login.jsp";
	}
	@RequestMapping("/rememberMe.ajax")
	@ResponseBody
	public String rememberMe(HttpServletRequest request) {
		return loginService.rememberMe(request);
	}
	@RequestMapping("/removeRememberMe.ajax")
	@ResponseBody
	public String removeRememberMe(HttpServletRequest request,HttpServletResponse response) {
		loginService.removeRememberMe(request,response);
		return "";
	}
	
}
