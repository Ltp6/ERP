package com.dao.system;

import com.model.system.MenuCorrelation;

public interface MenuCorrelationMapper {
    int deleteByPrimaryKey(String menuCorId);

    int insert(MenuCorrelation record);

    int insertSelective(MenuCorrelation record);

    MenuCorrelation selectByPrimaryKey(String menuCorId);

    int updateByPrimaryKeySelective(MenuCorrelation record);

    int updateByPrimaryKey(MenuCorrelation record);
}