package com.controller.system;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.util.controller.BaseController;

@Controller
@RequestMapping("/menuController")
public class MenuController extends BaseController {
	
	@RequestMapping("/menu.do")
	public String menu(HttpServletRequest request) {
		request.setAttribute("menuList", menuService.queryMenuByLoginName(request));
		
		return "/view/home/index.jsp";
	}

}
