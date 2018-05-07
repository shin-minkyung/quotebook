package com.smk.quotebook.dao;

import com.smk.quotebook.model.Admin;

public interface AdminDao {
	public int adminIdChk(String aid);
	public Admin getAdmin(String aid);
	
}
