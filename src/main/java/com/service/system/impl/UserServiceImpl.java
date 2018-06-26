package com.service.system.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.model.pojo.Page;
import com.model.pojo.UserReception;
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
	private static final int perpage = 5;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

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
	public String getAllPage(HttpServletRequest request) {
		String search = request.getParameter("search");
		if (search == null) {
			search = "";
		}
		Page p = new Page();
		// 查询一共有多少条数据
		int tn = userMapper.getTotalNum("%" + search + "%");
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
	public String addUser(HttpServletRequest request) {
		String loginName = request.getParameter("loginName");
		System.out.println("loginName=" + loginName);
		String userEmail = request.getParameter("userEmail");
		System.out.println("userEmail=" + userEmail);
		User user = new User();
		if (loginName != null) {
			user.setUserId(UUID.randomUUID().toString());
			user.setPassword("123456");
			user.setUserStatus("on");
			user.setLoginName(loginName);
			user.setUserEmail(userEmail);
			user.setUserCreatTime(new Date());
			int n = userMapper.insertSelective(user);
			if (n > 0) {
				return "SUCCESS";
			} else {
				return "FAIL";
			}
		} else {
			return "FAIL";
		}

	}

	@Override
	public String queryStaLoginName(HttpServletRequest request) {
		List<Staff> list = staffMapper.queryStaLoginName();
		List<String> loginNameList = new ArrayList<String>();
		for (Staff staff : list) {
			System.out.println(staff.getLoginName());
			loginNameList.add(staff.getLoginName());
		}
		return gson.toJson(loginNameList);
	}

	@Override
	public void resetPwdByUserId(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		System.out.println(userId + "------------------------");
		int n = userMapper.resetPwdByUserId(userId, "123456");
		System.out.println(n + "===========");
		if (n > 0) {
			request.setAttribute("sf", "SUCCESS");
		} else {
			request.setAttribute("sf", "FAIL");
		}
	}

	@Override
	public void updatePrepareUserByUserId(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		if (userId != null&&userId.length()>0) {
			User u = userMapper.selectByPrimaryKey(userId);
			System.out.println(u.getUserCreatTime());
			request.setAttribute("user", u);
		}
	}

	@Override
	public void updateUserByUserId(HttpServletRequest request,User user) {
		if(user.getUserStatus()==null) {
			user.setUserStatus("off");
			user.setUserCreatTime(new Date());
			int n = userMapper.updateByPrimaryKey(user);
		}else {
			user.setUserCreatTime(new Date());
			int n = userMapper.updateByPrimaryKey(user);
		}
		
	}

	@Override
	public void deleteUserByUserId(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		System.out.println(userId + "------------------------");
		int n = userMapper.deleteByPrimaryKey(userId);
		System.out.println(n + "===========");
		if (n > 0) {
			request.setAttribute("sf", "SUCCESS");
		} else {
			request.setAttribute("sf", "FAIL");
		}
		
	}

}
