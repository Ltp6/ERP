package com.dao.system;

import java.util.List;

import com.model.system.TwoMenu;

public interface TwoMenuMapper {
    int deleteByPrimaryKey(String twoMenuId);

    int insert(TwoMenu record);

    int insertSelective(TwoMenu record);

    TwoMenu selectByPrimaryKey(String twoMenuId);

    int updateByPrimaryKeySelective(TwoMenu record);

    int updateByPrimaryKey(TwoMenu record);

	List<TwoMenu> queryTowMenuByLoginNameAndOneMenuId(String loginName, String oneMenuId);
}