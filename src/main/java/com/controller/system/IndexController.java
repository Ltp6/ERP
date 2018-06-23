package com.controller.system;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.util.controller.BaseController;

@Controller
@RequestMapping("/indexController")
public class IndexController extends BaseController {

	@RequestMapping(value = "/getStaName.ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getName(HttpServletRequest request) {
		return indexrService.queryStaNameByloginName(request);
	}

}
