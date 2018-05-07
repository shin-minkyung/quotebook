package com.smk.quotebook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smk.quotebook.model.Admin;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public int adminIdChk(String aid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("adminIdChk", aid);
	}

	@Override
	public Admin getAdmin(String aid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getAdmin", aid);
	}

}
