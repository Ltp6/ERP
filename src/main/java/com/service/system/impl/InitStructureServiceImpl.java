package com.service.system.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.dao.system.DepartmentMapper;
import com.dao.system.PostMapper;
import com.dao.system.StaffMapper;
import com.google.gson.Gson;
import com.model.system.Department;
import com.model.system.Post;
import com.model.system.Staff;
import com.service.system.InitStructureService;

import net.sf.json.JSONArray;

/**
 * <p>
 * 初始化组织结构的实现类，用于处理相应的业务逻辑以及从数据库 中拿到所需数据。
 * </p>
 * 
 * @Copyright (C),eat sleep code
 * @author yansir
 * @Date:2018年6月22日
 */
@Service
public class InitStructureServiceImpl implements InitStructureService {

	// 注入部门的映射接口
	@Resource
	private DepartmentMapper dm;

	// 注入职位的映射接口
	@Resource
	private PostMapper pm;

	// 注入职工的映射接口
	@Resource
	private StaffMapper sm;

	@Override
	public String initTree(HttpServletRequest request) {
		// TODO Auto-generated method stub
		// 得到所有的部门
		List<Department> depList = dm.selectAllDeps();
		
		List<String> strList=new ArrayList<>();
		// 遍历所有部分得到对应的职位和人员,并封装到DepPosStaPojo对象中
		for (Department department : depList) {
			String s1="{id:"+department.getDepId()+",pId:0,name:\""+department.getDepName()+"\",icon:\"css/zTreeStyle/img/diy/1_open.png\"}";
			strList.add(s1);
			// 根据部门得到所有职位，并封装到DepPosStaPojo中
			List<Post> posList = pm.selectAllPostsByDepId(department.getDepId());
			// 根据职位得到对应人员，并封装到DepPosStaPojo中
			for (Post post : posList) {
				String s2="{id:"+post.getPostId()+",pId:"+department.getDepId()+",name:\""+post.getPostName()+"\",icon:\"css/zTreeStyle/img/diy/8.png\"}";
				strList.add(s2);
				// 根据职位ID得到其对应的员工
				List<Staff> staList = sm.selectStaffsByPostId(post.getPostId());
				for (Staff staff : staList) {
					String s3="{id:"+staff.getStaId()+",pId:"+post.getPostId()+",name:\""+staff.getStaName()+"\",icon:\"css/zTreeStyle/img/diy/2.png\"}";
					strList.add(s3);
				}
			}
		}
		// 将加载得到的DepPosStaPojo集合转换成gson并返回
		return JSONArray.fromObject(strList).toString();
//		Gson gson=new Gson();
//		return gson.toJson(strList);
	}

}
