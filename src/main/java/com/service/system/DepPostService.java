package com.service.system;

import java.util.List;
import com.model.system.DepPost;
public interface DepPostService {

	List<DepPost> queryPost(String depId);
	List<DepPost> queryAllDep();
	DepPost queryStaffInfo(String staId);
	

	
	

}
