package com.smk.quotebook.service;

import com.smk.quotebook.model.Admin;

public interface AdminService {
	public int aidChk(String aid);
	public Admin getAdmin(String aid);
	public int adminloginChk(Admin admin);
}
