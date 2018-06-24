package com.dao.system;

import java.util.List;
import java.util.Map;

import com.model.system.User;

public interface UserMapper {
	int deleteByPrimaryKey(String userId);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(String userId);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKeyWithBLOBs(User record);

	int updateByPrimaryKey(User record);

	User queryUserByLoginName(String loginName);

	List<User> qureyAllUser(Map<String, Object> map);

	int getTotalNum(String string);

	List<User> queryAllUserTest();

}