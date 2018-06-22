package com.dao.system;

import com.model.system.Department;

public interface DepartmentMapper {
    int deleteByPrimaryKey(String depId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(String depId);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}