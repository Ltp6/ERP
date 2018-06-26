package com.controller.system;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.util.controller.BaseController;

@Controller
@RequestMapping("/menuController")
public class MenuController extends BaseController {
	
	@RequestMapping("/menu.do")
	public String menu(HttpServletRequest request) {
		menuService.querySelfMenuByLoginName(request);
		return "/view/home/index.jsp";
	}

	@RequestMapping(value = "/queryAllMenu.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String queryAllMenu(HttpServletRequest request) {
		return menuService.queryAllMenu(request);
	}
	// 获取全部页码
		@RequestMapping("/getAllMenuPage.ajax")
		@ResponseBody
		public String getAllMenuPage(HttpServletRequest request) {
			return menuService.getAllMenuPage(request);
		}
	
	
}
