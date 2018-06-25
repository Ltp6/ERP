package com.service.system.impl;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.dao.system.StaffMapper;
import com.google.gson.Gson;
import com.model.system.Staff;
import com.service.system.StaffService;

@Service
public class StaffServiceImpl implements StaffService {
	
	@Resource
	private StaffMapper staffMapper;
	

	/**
	 *通过指定ID得到对应的员工对象
	 */
	@Override
	public String selectStaffById(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String staffId=request.getParameter("staffId");
		Staff staff=staffMapper.selectByPrimaryKey(staffId);
		Gson gson=new Gson();
		return gson.toJson(staff);
	}
	
}
