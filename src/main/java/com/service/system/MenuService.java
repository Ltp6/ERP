package com.service.system;


import javax.servlet.http.HttpServletRequest;


public interface MenuService {

	void querySelfMenuByLoginName(HttpServletRequest request);

	String queryAllMenu(HttpServletRequest request);

	String getAllMenuPage(HttpServletRequest request);


}
