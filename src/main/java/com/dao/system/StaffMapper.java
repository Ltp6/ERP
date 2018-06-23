package com.dao.system;

import com.model.system.Staff;

public interface StaffMapper {
    int deleteByPrimaryKey(String staId);

    int insert(Staff record);

    int insertSelective(Staff record);

    Staff selectByPrimaryKey(String staId);

    int updateByPrimaryKeySelective(Staff record);

    int updateByPrimaryKey(Staff record);

	Staff qureyStaffByLoginName(String loginName);
}