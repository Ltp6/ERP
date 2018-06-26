package com.controller.system;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.system.User;
import com.util.controller.BaseController;

@Controller
@RequestMapping("/userController")
public class UserController extends BaseController {

	
	@RequestMapping(value = "/queryAllUser.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String queryAllUser(HttpServletRequest request) {
		return userService.queryAllUser(request);
	}
	// 获取全部页码
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
	@RequestMapping("/resetPwd.do")
	public String resetPwd(HttpServletRequest request) {
		System.out.println("我来了");
		userService.resetPwdByUserId(request);
		return "/view/user/user-resetPwd.jsp";
	}
	@RequestMapping("/updatePrepareUser.do")
	public String updatePrepareUser(HttpServletRequest request) {
		System.out.println("我来了");
		userService.updatePrepareUserByUserId(request);
		return "/view/user/user-update.jsp";
	}
	@RequestMapping("/updateUser.do")
	public String updateUser(HttpServletRequest request,User user) {
		System.out.println("我来了");
		userService.updateUserByUserId(request,user);
		return "/view/user/user-list.jsp";
	}
	@RequestMapping("/deleteUser.do")
	public String deleteUser(HttpServletRequest request) {
		System.out.println("我来了");
		userService.deleteUserByUserId(request);
		return "/view/user/user-delete.jsp";
	}
}
