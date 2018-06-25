package com.model.pojo;

import java.util.List;
import java.util.Map;

import com.model.system.Department;
import com.model.system.Post;
import com.model.system.Staff;

/**
 * <p>
 * 用于承载各个部门，每个部门的职位，每个职位的人员信息的实体类
 * </p>
 * 
 * @Copyright (C),eat sleep code
 * @author yansir
 * @Date:2018年6月22日
 */
public class DepPosStaPojo {
	// 部门
	private Department dep;
	// 部门对应的职位集合
	private List<Post> postList;
	// 职位对应的人员集合
	private Map<String, List<Staff>> staMap;

	public DepPosStaPojo() {
		super();
	}

	public Department getDep() {
		return dep;
	}

	public void setDep(Department dep) {
		this.dep = dep;
	}

	public List<Post> getPostList() {
		return postList;
	}

	public void setPostList(List<Post> postList) {
		this.postList = postList;
	}

	public Map<String, List<Staff>> getStaMap() {
		return staMap;
	}

	public void setStaMap(Map<String, List<Staff>> staMap) {
		this.staMap = staMap;
	}

}
