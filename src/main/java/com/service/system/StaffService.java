package com.service.system;

import java.util.List;

import com.model.system.Staff;

public interface StaffService {

	List<Staff> queryAllStaff();

	Staff queryStaff(String staId);

	

	
}
