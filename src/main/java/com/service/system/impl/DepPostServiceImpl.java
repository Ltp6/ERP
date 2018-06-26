package com.service.system.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.system.DepPostMapper;
import com.model.system.DepPost;
import com.service.system.DepPostService;
@Service
public class DepPostServiceImpl implements DepPostService {
	@Resource
	private DepPostMapper depPostMapper;
	@Override
	public List<DepPost> queryPost(String depId) {
		// TODO Auto-generated method stub
		return depPostMapper.queryPost(depId);
	}
	@Override
	public List<DepPost> queryAllDep() {
		// TODO Auto-generated method stub
		return depPostMapper.queryAllDep();
	}
	@Override
	public DepPost queryStaffInfo(String staId) {
		// TODO Auto-generated method stub
		return depPostMapper.queryStaffInfo(staId);
	}
	

}
