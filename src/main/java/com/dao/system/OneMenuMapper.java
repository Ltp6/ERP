package com.dao.system;

import com.model.system.OneMenu;

public interface OneMenuMapper {
    int deleteByPrimaryKey(String oneMenuId);

    int insert(OneMenu record);

    int insertSelective(OneMenu record);

    OneMenu selectByPrimaryKey(String oneMenuId);

    int updateByPrimaryKeySelective(OneMenu record);

    int updateByPrimaryKey(OneMenu record);
}