package com.smk.quotebook.model;

import java.sql.Timestamp;

public class Members {
	private String mid;
	private String mname;
	private String mpw;
	private Timestamp mdate;
	private String mphoto;
	private String aboutme;
	private int mlevel;
	private int mpoint;
	private int mdrop;
	private int melimi;
	private String mlname;
	private int mllowp;
	private int mlhighp;
	private double progress;
	private int heartCnt;
	private int quoteCnt;
	private int postCnt;
	
	
	public Members() {
		super();
	}

		
	

	public int getHeartCnt() {
		return heartCnt;
	}




	public void setHeartCnt(int heartCnt) {
		this.heartCnt = heartCnt;
	}




	public int getQuoteCnt() {
		return quoteCnt;
	}




	public void setQuoteCnt(int quoteCnt) {
		this.quoteCnt = quoteCnt;
	}




	public int getPostCnt() {
		return postCnt;
	}




	public void setPostCnt(int postCnt) {
		this.postCnt = postCnt;
	}




	public double getProgress() {
		return progress;
	}

	public void setProgress(double progress) {
		this.progress = progress;
	}

	public int getMllowp() {
		return mllowp;
	}

	public void setMllowp(int mllowp) {
		this.mllowp = mllowp;
	}

	public int getMlhighp() {
		return mlhighp;
	}

	public void setMlhighp(int mlhighp) {
		this.mlhighp = mlhighp;
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
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public Timestamp getMdate() {
		return mdate;
	}
	public void setMdate(Timestamp mdate) {
		this.mdate = mdate;
	}
	public String getMphoto() {
		return mphoto;
	}
	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}
	public String getAboutme() {
		return aboutme;
	}
	public void setAboutme(String aboutme) {
		this.aboutme = aboutme;
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
	public int getMdrop() {
		return mdrop;
	}
	public void setMdrop(int mdrop) {
		this.mdrop = mdrop;
	}
	public int getMelimi() {
		return melimi;
	}
	public void setMelimi(int melimi) {
		this.melimi = melimi;
	}
	@Override
	public String toString() {
		return "Members [mid=" + mid + ", mname=" + mname + ", mpw=" + mpw + ", mdate=" + mdate + ", mphoto=" + mphoto
				+ ", aboutme=" + aboutme + ", mlevel=" + mlevel + ", mpoint=" + mpoint + ", mdrop=" + mdrop
				+ ", melimi=" + melimi + "]";
	}
	
}
