package com.controller.system;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.util.controller.BaseController;

@Controller
@RequestMapping("/indexController")
public class IndexController extends BaseController {
	// 获得姓名的信息
	@RequestMapping(value = "/getStaName.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getName(HttpServletRequest request) {
		return indexrService.queryStaNameByloginName(request);
	}

	// 获得账户名
	@RequestMapping(value = "/getUserName.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getUserName(HttpServletRequest request) {
		return indexrService.queryUserNameByloginName(request);
	}

	// 获得IP
	@RequestMapping(value = "/getServerIP.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getServerIP(HttpServletRequest request) {
		return indexrService.getServerIP(request);
	}

	// 获得服务器名称
	@RequestMapping(value = "/getServerName.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getServerName(HttpServletRequest request) {
		return indexrService.getServerName(request);
	}

	// 获得当前在线人数名称
	@RequestMapping(value = "/getVisitorCount.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getVisitorCount(HttpServletRequest request) {
		return indexrService.getVisitorCount(request);
	}

	// 获得登录超时时间
	@RequestMapping(value = "/getSessionTimeOut.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getSessionTimeOut(HttpServletRequest request) {
		return indexrService.getSessionTimeOut(request);
	}

	// 获得服务器时间
	@RequestMapping(value = "/getServerTime.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getServerTime(HttpServletRequest request) {
		return indexrService.getServerTime(request);
	}
}
