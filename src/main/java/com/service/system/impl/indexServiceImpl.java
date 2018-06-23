package com.service.system.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.dao.system.StaffMapper;
import com.model.system.Staff;
import com.service.system.indexService;

@Service
public class indexServiceImpl implements indexService {
	@Resource
	private StaffMapper staffMapper;

	@Override
	public String queryStaNameByloginName(HttpServletRequest request) {
		String loginName = (String) request.getSession().getAttribute("loginName");
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
	}

}
