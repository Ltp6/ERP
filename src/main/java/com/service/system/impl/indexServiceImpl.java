package com.service.system.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.dao.system.StaffMapper;
import com.dao.system.UserMapper;
import com.model.system.Staff;
import com.service.system.indexService;

@Service
public class indexServiceImpl implements indexService {
	@Resource
	private StaffMapper staffMapper;
	@Resource
	private UserMapper userMapper;

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Override
	public String queryStaNameByloginName(HttpServletRequest request) {
		String loginName = (String) request.getSession().getAttribute("loginName");
		if (loginName != null && loginName.length() > 0) {
			if (loginName.equals("admin")) {
				return "admin";
			} else {
				Staff staff = staffMapper.qureyStaffByLoginName(loginName);
				if (staff != null) {
					return staff.getStaName();
				} else {
					return "FAIL";
				}
			}
		} else {
			return null;
		}
	}

	@Override
	public String queryUserNameByloginName(HttpServletRequest request) {
		String loginName = (String) request.getSession().getAttribute("loginName");
		if (loginName != null && loginName.length() > 0) {
			return loginName;
		} else {
			return null;
		}

	}

	@Override
	public String getServerIP(HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		if (ip != null) {
			return ip;
		} else {
			return "获取失败";
		}

	}

	@Override
	public String getServerName(HttpServletRequest request) {
		String serverName = request.getServerName();
		if (serverName != null) {
			return serverName;
		} else {
			return "获取失败";
		}
	}

	@Override
	public String getVisitorCount(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		return request.getServletContext().getAttribute("visitorCount") + "";
	}

	@Override
	public String getSessionTimeOut(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return request.getSession().getMaxInactiveInterval() + "";
	}

	@Override
	public String getServerTime(HttpServletRequest request) {
		Date d=new Date();
		return sdf.format(d);
	}

}
