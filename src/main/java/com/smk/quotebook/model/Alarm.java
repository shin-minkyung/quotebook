package com.smk.quotebook.model;

import java.sql.Timestamp;

public class Alarm {
	private int alid;
	private String mid;
	private int myid;
	private int chkid;
	private String chkname;
	private String chkphoto;
	private String myidtype;	
	private String chkidtype;
	private String almsg;
	private Timestamp aldate;
	private int alchk;
	private int startRow;
	private int pageSize;
	
	public Alarm() {
		super();
	}
	
	public Alarm(String mid, int myid, int chkid, String chkname, String chkphoto) {
		super();
		this.mid = mid;
		this.myid = myid;
		this.chkid = chkid;
		this.chkname = chkname;
		this.chkphoto = chkphoto;
	}
	

	public Alarm(String mid, int myid, int chkid, String chkname, String chkphoto, String almsg) {
		super();
		this.mid = mid;
		this.myid = myid;
		this.chkid = chkid;
		this.chkname = chkname;
		this.chkphoto = chkphoto;
		this.almsg = almsg;
	}
	
	

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getAlid() {
		return alid;
	}

	public void setAlid(int alid) {
		this.alid = alid;
	}

	public String getAlmsg() {
		return almsg;
	}

	public void setAlmsg(String almsg) {
		this.almsg = almsg;
	}

	public String getChkname() {
		return chkname;
	}


	public void setChkname(String chkname) {
		this.chkname = chkname;
	}


	public String getChkphoto() {
		return chkphoto;
	}


	public void setChkphoto(String chkphoto) {
		this.chkphoto = chkphoto;
	}


	public int getMyid() {
		return myid;
	}
	public void setMyid(int myid) {
		this.myid = myid;
	}
	public int getChkid() {
		return chkid;
	}
	public void setChkid(int chkid) {
		this.chkid = chkid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Timestamp getAldate() {
		return aldate;
	}
	public void setAldate(Timestamp aldate) {
		this.aldate = aldate;
	}
	public int getAlchk() {
		return alchk;
	}
	public void setAlchk(int alchk) {
		this.alchk = alchk;
	}
	public String getMyidtype() {
		return myidtype;
	}
	public void setMyidtype(String myidtype) {
		this.myidtype = myidtype;
	}
	public String getChkidtype() {
		return chkidtype;
	}
	public void setChkidtype(String chkidtype) {
		this.chkidtype = chkidtype;
	}
	
	
	
}
