package com.dao.system;

import java.util.List;

import com.model.system.Post;

public interface PostMapper {
    int deleteByPrimaryKey(String postId);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(String postId);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKey(Post record);

	List<Post> selectAllPostsByDepId(String depId);
}