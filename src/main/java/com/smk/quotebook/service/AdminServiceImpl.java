package com.smk.quotebook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smk.quotebook.dao.AdminDao;
import com.smk.quotebook.model.Admin;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	@Override
	public int aidChk(String aid) {
		// TODO Auto-generated method stub
		return adminDao.adminIdChk(aid);
	}

	@Override
	public Admin getAdmin(String aid) {
		// TODO Auto-generated method stub		
		return adminDao.getAdmin(aid);
	}

	@Override
	public int adminloginChk(Admin admin) {
		// TODO Auto-generated method stub
		int result=0;
		String aid=admin.getAid();
		String apw=admin.getApw();
		int aidCnt=adminDao.adminIdChk(aid);
		if(aidCnt==1) {
			Admin adminDB = adminDao.getAdmin(aid);
			if(apw.equals(adminDB.getApw())) {
				result=1;
			}else if(!apw.equals(adminDB.getApw())){
				result=0;
			}
		}else if(aidCnt==0) {
			result=-1;
		}
		return result;
	}

}
