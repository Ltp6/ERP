package com.service.system.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.system.StaffMapper;
import com.model.system.Staff;
import com.service.system.StaffService;


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

}
