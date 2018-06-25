package com.dao.system;

import java.util.List;

import com.model.system.Department;

/**
 * <p>
 *  	部门表映射接口
 * </p>	
 * @Copyright (C),eat sleep code
 * @author yansir
 * @Date:2018年6月25日
 */
public interface DepartmentMapper {
    int deleteByPrimaryKey(String depId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(String depId);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);

	List<Department> selectAllDeps();
}