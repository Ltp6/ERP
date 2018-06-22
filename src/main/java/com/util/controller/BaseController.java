package com.util.controller;

import javax.annotation.Resource;

import com.service.system.LoginService;
import com.service.system.OneMenuService;
import com.service.system.TwoMenuService;

public class BaseController {
	@Resource
	public LoginService loginService;
	@Resource
	public OneMenuService oneMenuService;
	@Resource
	public TwoMenuService twoMenuService;
}
