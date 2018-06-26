package com.service.system.impl;

import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.system.StaffPostMapper;
import com.model.system.StaffPost;
import com.service.system.StaffPostService;
@Service
public class StaffPostServiceImpl implements StaffPostService {
	@Resource
	private StaffPostMapper staffPostMapper;
	
	@Override
	public int insertStaffTransferInfo(String staId, String postId) {
		StaffPost sp=new StaffPost();
		staffPostMapper.deleteOldStaffInfo(staId);
		sp.setStaPostId(UUID.randomUUID().toString());
		sp.setStaId(staId);
		sp.setPostId(postId);
	int n=staffPostMapper.insertSelective(sp);
		return n;
	}

	

}
