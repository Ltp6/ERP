package com.service.system.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.dao.system.MenuMapper;
import com.dao.system.OneMenuMapper;
import com.model.pojo.Menu;
import com.model.system.OneMenu;
import com.service.system.MenuService;


@Service
public class MenuServiceImpl implements MenuService {

	@Resource
	private OneMenuMapper oneMenuMapper;

	@Override
	public List<Menu> queryMenuByLoginName(HttpServletRequest request) {
//		List<AuthGroup> groups = agm.selectAll();
		List<OneMenu> oneMenuList = oneMenuMapper.queryAllOneMenu();
		String loginName = (String) request.getSession().getAttribute("loginName");
		
		List<Menu> menuList = new ArrayList<>();
		for (OneMenu one : oneMenuList) {
			Menu menu = new Menu();
			menu.setOneMenu(one);
			Map<String, String> map = new HashMap<String, String>();
			/*map.put("accountId", accountId);
			map.put("authGroupId", ag.getAuthGroupId());
			List<SystemAuth> auths = sam.selectByAccountIdAndGroupId(map);
			agp.setAuths(auths);
			pojos.add(agp);*/
		}
		return menuList;
	}

}
