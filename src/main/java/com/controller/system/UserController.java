package com.controller.system;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.util.controller.BaseController;

@Controller
@RequestMapping("/userController")
public class UserController extends BaseController {

	
	@RequestMapping(value = "/queryAllUser.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String queryAllUser(HttpServletRequest request) {
		return userService.queryAllUser(request);
	}
	
	@RequestMapping("/getAllPage.ajax")
	@ResponseBody
	public String getAllPage(HttpServletRequest request) {
		return userService.getAllPage(request);
	}
	
	@RequestMapping(value = "/queryStaLoginName.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String queryStaLoginName(HttpServletRequest request) {
		return userService.queryStaLoginName(request);
	}
	
	@RequestMapping("/addUser.do")
	public String addUser(HttpServletRequest request) {
		userService.addUser(request);
		return "/view/user/user-list.jsp";
	}
	@RequestMapping("/queryAllUserTest.do")
	public String queryAllUserTest(HttpServletRequest request) {
		userService.queryAllUserTest(request);
		return "/view/user/user-list.jsp";
	}
}
