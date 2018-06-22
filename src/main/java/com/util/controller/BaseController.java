package com.util.controller;

import javax.annotation.Resource;

import com.service.system.LoginService;

public class BaseController {
	@Resource
	public LoginService loginService;
}
