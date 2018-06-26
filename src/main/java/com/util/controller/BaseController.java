package com.util.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.service.system.DepPostService;
import com.service.system.LoginService;
import com.service.system.MenuService;
import com.service.system.StaffPostService;
import com.service.system.StaffService;
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
	@InitBinder
	public void initBinder(ServletRequestDataBinder servletRequestDataBinder) {
		servletRequestDataBinder.registerCustomEditor(Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	}
	@Resource
	public StaffService staffservice;
	@Resource
	public DepPostService depPostService;
	@Resource
	public StaffPostService staffPostService;
}
