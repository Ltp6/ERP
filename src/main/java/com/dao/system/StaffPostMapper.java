package com.dao.system;

import com.model.system.DepPost;
import com.model.system.StaffPost;

public interface StaffPostMapper {
    int deleteByPrimaryKey(String staPostId);

    int insert(StaffPost record);

    int insertSelective(StaffPost record);

    StaffPost selectByPrimaryKey(String staPostId);

    int updateByPrimaryKeySelective(StaffPost record);

    int updateByPrimaryKey(StaffPost record);

	int deleteOldStaffInfo(String staId);

	DepPost queryStaffInfo(String staId);

}