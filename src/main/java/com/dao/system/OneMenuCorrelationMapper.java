package com.dao.system;

import com.model.system.OneMenuCorrelation;

public interface OneMenuCorrelationMapper {
    int deleteByPrimaryKey(String menuCorId);

    int insert(OneMenuCorrelation record);

    int insertSelective(OneMenuCorrelation record);

    OneMenuCorrelation selectByPrimaryKey(String menuCorId);

    int updateByPrimaryKeySelective(OneMenuCorrelation record);

    int updateByPrimaryKey(OneMenuCorrelation record);
}