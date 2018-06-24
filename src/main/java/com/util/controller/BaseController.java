package com.util.controller;

import javax.annotation.Resource;

import com.service.system.LoginService;
import com.service.system.MenuService;
import com.service.system.UserService;
import com.service.system.indexService;

public class BaseController {
	@Resource
	public LoginService loginService;
	@Resource
	public MenuService menuService;
	@Resource
	public indexService indexrService;
	@Resource
	public UserService userService;
}
