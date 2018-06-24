package com.service.system.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.dao.system.StaffMapper;
import com.dao.system.UserMapper;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.model.pojo.Page;
import com.model.system.Staff;
import com.model.system.User;
import com.service.system.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;
	@Resource
	private StaffMapper staffMapper;
	private static Gson gson = new Gson();
	private static final int perpage = 10;

	@Override
	public String queryAllUser(HttpServletRequest request) {
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
		List<User> list = userMapper.qureyAllUser(map);
		System.out.println("list=" + list.toString());
		return gson.toJson(list);
	}

	@Override
	public String getAllPage(HttpServletRequest request) {
		String sreach = request.getParameter("sreach");
		if (sreach == null) {
			sreach = "";
		}
		Page p = new Page();
		// 查询一共有多少条数据
		int tn = userMapper.getTotalNum("%" + sreach + "%");
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

	@Override
	public void addUser(HttpServletRequest request) {
		String loginName = request.getParameter("loginName");
		String userEmail = request.getParameter("userEmail");
		User user = new User();
		user.setUserId(UUID.randomUUID().toString());
		user.setPassword("123456");
		user.setUserStatus("on");
		user.setLoginName(loginName);
		user.setUserEmail(userEmail);
		user.setUserCreatTime(new Date());
		int n = userMapper.insertSelective(user);
		System.out.println(n);
	}

	@Override
	public void queryAllUserTest(HttpServletRequest request) {
		List<User> userList = userMapper.queryAllUserTest();
		request.setAttribute("userList", userList);
	}

	@Override
	public String queryStaLoginName(HttpServletRequest request) {
		List<Staff> loginNameList = staffMapper.queryStaLoginName();
		return gson.toJson(loginNameList);
	}

}
