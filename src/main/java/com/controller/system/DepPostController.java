package com.controller.system;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.system.DepPost;
import com.util.controller.BaseController;
import net.sf.json.JSONArray;
@Controller
@RequestMapping("/depPostController")
public class DepPostController extends BaseController{
	
@RequestMapping("/queryStaff.do")
	public String queryStaff(HttpServletRequest request) {
		request.setAttribute("staffList", staffservice.queryAllStaff());
		return "/view/StaffManagement/Staff_List.jsp";
	}	
@RequestMapping("/queryStaffInfo.do")
public String queryStaffInfo(HttpServletRequest request,String staId) {
	System.out.println("*******************"+depPostService.queryStaffInfo(staId));
	request.setAttribute("staffInfo", depPostService.queryStaffInfo(staId));
	return "/view/StaffManagement/staffTransfer.jsp";
}

@RequestMapping("/staffTransfer.do")
public String staffTransfer(HttpServletRequest request,String staId,String postId,DepPost depPost ) {
	System.out.println("77777777"+staId+postId);
	 int num=staffPostService.insertStaffTransferInfo(staId,postId);
	
	return "redirect:/depPostController/queryStaff.do";
	
}

@RequestMapping("/search.do")
public ModelAndView search(HttpServletRequest request, HttpServletResponse response, ModelAndView model)
		throws IOException {
	response.setCharacterEncoding("UTF-8");
	String flag = request.getParameter("flag");
	List<DepPost> list = null;
	JSONArray jsonarray = null;

	if (flag.equals("getOne")) {
		list = depPostService.queryAllDep();
		System.out.println("部门" + list.toString());
	} else {
		String depId = request.getParameter("depId");
		System.out.println(depId);
		if (depId != null) {
			if (depId.equals("")) {
				list = null;
			} else {
				list = depPostService.queryPost(depId);
				System.out.println(list.toString());
				for (DepPost dp : list) {
					System.out.println("职务" + dp);
				}
				
			}
		} 

		// list = acaId.equals("") ? null
		// :
		// academyMajorClassService.queryMajorByAcaId(Integer.parseInt(request.getParameter("acaId")));
	}
	jsonarray = JSONArray.fromObject(list);
	PrintWriter out = response.getWriter();
	out.print(jsonarray.toString());
	out.flush();
	out.close();
	model.addObject("list", list);
	model.setViewName("/view/StaffManagement/staffTransfer.jsp");
	return model;
}


}
