package com.smk.quotebook.model;

import java.sql.Timestamp;

public class Admin {
	private String aid;
	private String aname;
	private String apw;
	private Timestamp adate;
	
	public Admin() {
		super();
	}
	public Admin(String aid, String aname, String apw, Timestamp adate) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.apw = apw;
		this.adate = adate;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getApw() {
		return apw;
	}
	public void setApw(String apw) {
		this.apw = apw;
	}
	public Timestamp getAdate() {
		return adate;
	}
	public void setAdate(Timestamp adate) {
		this.adate = adate;
	}
	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", aname=" + aname + ", apw=" + apw + ", adate=" + adate + "]";
	}	
	
	
}
