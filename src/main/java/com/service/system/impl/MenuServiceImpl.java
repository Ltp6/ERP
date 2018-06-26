package com.service.system.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.dao.system.MenuCollectionMapper;
import com.dao.system.OneMenuMapper;
import com.dao.system.TwoMenuMapper;
import com.google.gson.Gson;
import com.model.pojo.Menu;
import com.model.pojo.MenuCollection;
import com.model.pojo.Page;
import com.model.system.MenuCorrelation;
import com.model.system.OneMenu;
import com.model.system.TwoMenu;
import com.model.system.User;
import com.service.system.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Resource
	private OneMenuMapper oneMenuMapper;
	@Resource
	private TwoMenuMapper twoMenuMapper;
	@Resource
	private MenuCollectionMapper menuCollectionMapper;
	
	private static Gson gson = new Gson();
	private static final int perpage = 5;
	
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

	@Override
	public String queryAllMenu(HttpServletRequest request) {
		// 得到前台点击页面的页码数
				String n = request.getParameter("n");
				String search = request.getParameter("search");
				if (search == null) {
					search = "";
				}
				// 起始页码
				int pageNumber = 1;
				if (n != null && n.length() > 0) {
					pageNumber = Integer.parseInt(n);
				}
				Map<String, Object> map = new HashMap<String, Object>();

				int start = (pageNumber - 1) * perpage;
				map.put("start", start);
				map.put("size", perpage);
				map.put("search", "%" + search + "%");
				List<MenuCollection> list = menuCollectionMapper.queryAllMenu(map);
				// List<UserReception> userReception=new ArrayList<>();
				// UserReception ur = new UserReception();
				// for (User user : list) {
				// System.out.println("list="+user.getLoginName());
				// ur.setUserId(user.getUserId());
				// ur.setLoginName(user.getLoginName());
				// ur.setUserEmail(user.getUserEmail());
				// ur.setUserStatus(user.getUserStatus());
				// ur.setUserCreatTime(sdf.format(user.getUserCreatTime()));
				// userReception.add(ur);
				// }
				return gson.toJson(list);
	}

	@Override
	public String getAllMenuPage(HttpServletRequest request) {
		String search = request.getParameter("search");
		if (search == null) {
			search = "";
		}
		Page p = new Page();
		// 查询一共有多少条数据
		int tn = menuCollectionMapper.getTotalNum("%" + search + "%");
		p.setTotalRecords(tn + "");

		int t = 0;
		if (tn % perpage == 0) {
			t = tn / perpage;
		} else {
			t = (tn / perpage) + 1;
		}

		System.out.println("t=" + t);
		p.setTotal(t + "");

		return gson.toJson(p);
	}
}
