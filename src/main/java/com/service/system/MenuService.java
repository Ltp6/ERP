package com.service.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.model.pojo.Menu;

public interface MenuService {

	List<Menu> queryMenuByLoginName(HttpServletRequest request);

}
