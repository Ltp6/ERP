package com.dao.system;

import com.model.system.TwoMenu;

public interface TwoMenuMapper {
    int deleteByPrimaryKey(String menuId);

    int insert(TwoMenu record);

    int insertSelective(TwoMenu record);

    TwoMenu selectByPrimaryKey(String menuId);

    int updateByPrimaryKeySelective(TwoMenu record);

    int updateByPrimaryKey(TwoMenu record);
}