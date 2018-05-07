package com.smk.quotebook.model;

public class Rankings {
	private String mid;
	private String mname;
	private String mlname;
	private String mphoto;
	private int mlevel;
	private int mpoint;
	private int quoteCnt;
	private int heartCnt;
	public Rankings() {
		super();
	}
	
	
	
	public String getMphoto() {
		return mphoto;
	}



	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}



	public String getMlname() {
		return mlname;
	}


	public void setMlname(String mlname) {
		this.mlname = mlname;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMlevel() {
		return mlevel;
	}
	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}
	public int getMpoint() {
		return mpoint;
	}
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	public int getQuoteCnt() {
		return quoteCnt;
	}
	public void setQuoteCnt(int quoteCnt) {
		this.quoteCnt = quoteCnt;
	}
	public int getHeartCnt() {
		return heartCnt;
	}
	public void setHeartCnt(int heartCnt) {
		this.heartCnt = heartCnt;
	}
	
	
}
