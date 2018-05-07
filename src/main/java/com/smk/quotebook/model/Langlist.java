package com.smk.quotebook.model;

public class Langlist {
	private int lid;
	private String lname;
	private int langCnt;
	
	public Langlist() {
		super();
	}
	

	public Langlist(int lid, String lname) {
		super();
		this.lid = lid;
		this.lname = lname;
	}

	public int getLangCnt() {
		return langCnt;
	}

	public void setLangCnt(int langCnt) {
		this.langCnt = langCnt;
	}

	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}

	@Override
	public String toString() {
		return "Langlist [lid=" + lid + ", lname=" + lname + ", langCnt=" + langCnt + "]";
	}
	
	
	
}
