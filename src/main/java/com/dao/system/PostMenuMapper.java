package com.dao.system;

import com.model.system.PostMenu;

public interface PostMenuMapper {
    int deleteByPrimaryKey(String postMenuId);

    int insert(PostMenu record);

    int insertSelective(PostMenu record);

    PostMenu selectByPrimaryKey(String postMenuId);

    int updateByPrimaryKeySelective(PostMenu record);

    int updateByPrimaryKey(PostMenu record);
}