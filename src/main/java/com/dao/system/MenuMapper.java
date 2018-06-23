package com.dao.system;

import java.util.List;

import com.model.pojo.Menu;

public interface MenuMapper {

	List<Menu> queryMenuByLoginName(String loginName);

}
