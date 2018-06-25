package com.controller.system;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.system.InitStructureService;
import com.service.system.StaffService;

@Controller
@RequestMapping("/initStructureController")
public class InitStructureController {
	
	@Resource
	private InitStructureService iss;
	
	@Resource
	private StaffService staffService;
	
	/**
	 * <p>
	 * 初始化公司结构
	 * </p>
	 * @author Yan Guiyi
	 * @Date 2018年6月24日
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/initTree.ajax",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String initTree(HttpServletRequest request){
		
		return iss.initTree(request);
	}
	
	/**
	 * <p>
	 * 点击zTree节点时，根据Id查询员工信息
	 * </p>
	 * @author Yan Guiyi
	 * @Date 2018年6月24日
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/selectStaff.ajax",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String selectStaff(HttpServletRequest request){
		
		return staffService.selectStaffById(request);
		
	}
	
}
