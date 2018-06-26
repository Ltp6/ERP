package com.controller.system;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.util.controller.BaseController;

/**  
* @ClassName: StaffController  
* @Description: 职工控制器(这里用一句话描述这个类的作用)  
* @author CYY  
* @date 2018年6月23日  
*    
*/  
@Controller
@RequestMapping("/staffController")
public class StaffController extends BaseController {	
	/**  
	* @Title: queryStaff  
	* @Description: 查询所有职工信息(这里用一句话描述这个方法的作用)  
	* @param @param request
	* @param @return    参数  
	* @return String    返回类型  
	* @throws  
	*/  
	@RequestMapping("/queryStaff.do")
	public String queryStaff(HttpServletRequest request) {
		request.setAttribute("staffList", staffservice.queryAllStaff());
		return "/view/StaffManagement/Staff_List.jsp";
	}
	
	@RequestMapping("queryPos.do")
	public String queryPos(HttpServletRequest request) {
		
		
		
		return null;
		
	}
	
}
