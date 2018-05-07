package com.smk.quotebook.model;

import java.sql.Timestamp;

public class PBComment {
	 private int pbcid;
	 private int pbid;
	 private String mid;
	 private String mname;
	 private String mphoto;
	 private String pbccontent;
	 private int cgroup;
	 private int cindent;
	 private int rcid;
	 private Timestamp cdate;
	 private int cdel;
	 private int commentCnt;
	 private int cgroupCnt;
	 private String toWhom;
	 private int heart;
	 
	public PBComment() {
		super();
	}
	
	
	public int getHeart() {
		return heart;
	}


	public void setHeart(int heart) {
		this.heart = heart;
	}


	public String getToWhom() {
		return toWhom;
	}


	public void setToWhom(String toWhom) {
		this.toWhom = toWhom;
	}


	public int getCgroupCnt() {
		return cgroupCnt;
	}


	public void setCgroupCnt(int cgroupCnt) {
		this.cgroupCnt = cgroupCnt;
	}


	public int getCommentCnt() {
		return commentCnt;
	}


	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}


	public int getPbcid() {
		return pbcid;
	}
	public void setPbcid(int pbcid) {
		this.pbcid = pbcid;
	}
	public int getPbid() {
		return pbid;
	}
	public void setPbid(int pbid) {
		this.pbid = pbid;
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
	public String getMphoto() {
		return mphoto;
	}
	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}
	public String getPbccontent() {
		return pbccontent;
	}
	public void setPbccontent(String pbccontent) {
		this.pbccontent = pbccontent;
	}
	public int getCgroup() {
		return cgroup;
	}
	public void setCgroup(int cgroup) {
		this.cgroup = cgroup;
	}
	public int getCindent() {
		return cindent;
	}
	public void setCindent(int cindent) {
		this.cindent = cindent;
	}
	public int getRcid() {
		return rcid;
	}
	public void setRcid(int rcid) {
		this.rcid = rcid;
	}
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}
	public int getCdel() {
		return cdel;
	}
	public void setCdel(int cdel) {
		this.cdel = cdel;
	}


	@Override
	public String toString() {
		return "PBComment [pbcid=" + pbcid + ", pbid=" + pbid + ", mid=" + mid + ", mname=" + mname + ", mphoto="
				+ mphoto + ", pbccontent=" + pbccontent + ", cgroup=" + cgroup + ", cindent=" + cindent + ", rcid="
				+ rcid + ", cdate=" + cdate + ", cdel=" + cdel + ", commentCnt=" + commentCnt + "]";
	}
	
	
	 	
}
