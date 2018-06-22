package com.dao.system;

import com.model.system.DepPost;

public interface DepPostMapper {
    int deleteByPrimaryKey(String depPostId);

    int insert(DepPost record);

    int insertSelective(DepPost record);

    DepPost selectByPrimaryKey(String depPostId);

    int updateByPrimaryKeySelective(DepPost record);

    int updateByPrimaryKey(DepPost record);
}