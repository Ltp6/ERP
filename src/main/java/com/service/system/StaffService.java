package com.service.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import com.model.system.Staff;

public interface StaffService {

	List<Staff> queryAllStaff();

	Staff queryStaff(String staId);
	String selectStaffById(HttpServletRequest request);

	
}
