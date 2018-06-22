package com.dao.system;

import com.model.system.StaDep;

public interface StaDepMapper {
    int deleteByPrimaryKey(String staDepId);

    int insert(StaDep record);

    int insertSelective(StaDep record);

    StaDep selectByPrimaryKey(String staDepId);

    int updateByPrimaryKeySelective(StaDep record);

    int updateByPrimaryKey(StaDep record);
}