package com.service.system.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.dao.system.OneMenuMapper;
import com.dao.system.TwoMenuMapper;
import com.model.pojo.Menu;
import com.model.system.OneMenu;
import com.model.system.TwoMenu;
import com.service.system.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Resource
	private OneMenuMapper oneMenuMapper;
	@Resource
	private TwoMenuMapper twoMenuMapper;

	@Override
	public void querySelfMenuByLoginName(HttpServletRequest request) {
		// TODO Auto-generated method stub

		String loginName = (String) request.getSession().getAttribute("loginName");
		List<OneMenu> oneMenuList = new ArrayList<>();
		if (loginName.equals("admin")) {
			oneMenuList = oneMenuMapper.queryAllOneMenu();
		} else {
			 oneMenuList = oneMenuMapper.queryOneMenuByLoginName(loginName);
		}

		List<Menu> menuList = new ArrayList<>();
		for (OneMenu oneMenu : oneMenuList) {
			Menu menu = new Menu();
			menu.setOneMenu(oneMenu);
			List<TwoMenu> twoMenuList = twoMenuMapper.queryTowMenuByLoginNameAndOneMenuId(loginName,
					oneMenu.getOneMenuId());
			menu.setTwoMenuList(twoMenuList);
			menuList.add(menu);
		}
		request.setAttribute("menuList", menuList);
	}
}
