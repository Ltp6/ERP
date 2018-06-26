package com.dao.system;

import java.util.List;

import com.model.system.OneMenu;

public interface OneMenuMapper {
    int deleteByPrimaryKey(String oneMenuId);

    int insert(OneMenu record);

    int insertSelective(OneMenu record);

    OneMenu selectByPrimaryKey(String oneMenuId);

    int updateByPrimaryKeySelective(OneMenu record);

    int updateByPrimaryKey(OneMenu record);

	List<OneMenu> queryAllOneMenu();

	List<OneMenu> queryOneMenuByLoginName(String loginName);

}