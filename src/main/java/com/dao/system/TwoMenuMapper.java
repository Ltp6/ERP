package com.dao.system;

import com.model.system.TwoMenu;

public interface TwoMenuMapper {
    int deleteByPrimaryKey(String twoMenuId);

    int insert(TwoMenu record);

    int insertSelective(TwoMenu record);

    TwoMenu selectByPrimaryKey(String twoMenuId);

    int updateByPrimaryKeySelective(TwoMenu record);

    int updateByPrimaryKey(TwoMenu record);
}