package com.service.system.impl;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.dao.system.StaffMapper;
import com.google.gson.Gson;
import com.model.system.Staff;
import com.service.system.StaffService;

import java.util.List;

@Service
public class StaffServiceImpl implements StaffService{
@Resource
private StaffMapper staffMapper;
	
@Override
	public List<Staff> queryAllStaff() {
	List<Staff> list=staffMapper.queryAllStaff();
	System.out.println(list.toString());
		// TODO Auto-generated method stub
		return staffMapper.queryAllStaff();
	}

@Override
public Staff queryStaff(String staId) {
	// TODO Auto-generated method stub
	return staffMapper.selectByPrimaryKey(staId);
}

@Override
public String selectStaffById(HttpServletRequest request) {
	// TODO Auto-generated method stub
	String staffId=request.getParameter("staffId");
	Staff staff=staffMapper.selectByPrimaryKey(staffId);
	Gson gson=new Gson();
	return gson.toJson(staff);
}

}
