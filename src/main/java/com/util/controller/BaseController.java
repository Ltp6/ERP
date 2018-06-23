package com.util.controller;

import javax.annotation.Resource;

import com.service.system.LoginService;
import com.service.system.MenuService;

public class BaseController {
	@Resource
	public LoginService loginService;
	@Resource
	public MenuService menuService;
}
