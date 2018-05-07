package com.smk.quotebook.model;

import java.sql.Timestamp;

public class PublicQBook {
	private int pbid;
	private int mqid;
	private String mid;
	private String pbtitle;
	private String pbcontent;
	private Timestamp pbdate;
	private int pbhit;
	private int pbdel;
	private int pblike;
	private String mname;
	private String mphoto;
	private int mlevel;
	
	private String mqquote;
	private String mqlang;
	private String mqwhy;
	private String stitle;
	private String smaker;
	private String surl;
	private String syear;
	
	private int startRow;
	private int pageSize;
	
	private int commentCnt;
	private int heartCnt;
	
	public PublicQBook() {
		super();
	}

	
	public int getMlevel() {
		return mlevel;
	}


	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}


	public int getHeartCnt() {
		return heartCnt;
	}


	public void setHeartCnt(int heartCnt) {
		this.heartCnt = heartCnt;
	}


	public int getCommentCnt() {
		return commentCnt;
	}


	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}


	public String getSyear() {
		return syear;
	}


	public void setSyear(String syear) {
		this.syear = syear;
	}


	public int getPblike() {
		return pblike;
	}


	public void setPblike(int pblike) {
		this.pblike = pblike;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
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

	public int getPbid() {
		return pbid;
	}
	public void setPbid(int pbid) {
		this.pbid = pbid;
	}
	public int getMqid() {
		return mqid;
	}
	public void setMqid(int mqid) {
		this.mqid = mqid;
	}
	
	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getPbtitle() {
		return pbtitle;
	}
	public void setPbtitle(String pbtitle) {
		this.pbtitle = pbtitle;
	}
	public String getPbcontent() {
		return pbcontent;
	}
	public void setPbcontent(String pbcontent) {
		this.pbcontent = pbcontent;
	}
	public Timestamp getPbdate() {
		return pbdate;
	}
	public void setPbdate(Timestamp pbdate) {
		this.pbdate = pbdate;
	}
	public int getPbhit() {
		return pbhit;
	}
	public void setPbhit(int pbhit) {
		this.pbhit = pbhit;
	}
	public int getPbdel() {
		return pbdel;
	}
	public void setPbdel(int pbdel) {
		this.pbdel = pbdel;
	}
	public String getMphoto() {
		return mphoto;
	}
	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}
	public String getMqquote() {
		return mqquote;
	}
	public void setMqquote(String mqquote) {
		this.mqquote = mqquote;
	}
	public String getMqlang() {
		return mqlang;
	}
	public void setMqlang(String mqlang) {
		this.mqlang = mqlang;
	}
	public String getMqwhy() {
		return mqwhy;
	}
	public void setMqwhy(String mqwhy) {
		this.mqwhy = mqwhy;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getSmaker() {
		return smaker;
	}
	public void setSmaker(String smaker) {
		this.smaker = smaker;
	}
	public String getSurl() {
		return surl;
	}
	public void setSurl(String surl) {
		this.surl = surl;
	}


	@Override
	public String toString() {
		return "PublicQBook [pbid=" + pbid + ", mqid=" + mqid + ", mid=" + mid + ", pbtitle=" + pbtitle + ", pbcontent="
				+ pbcontent + ", pbdate=" + pbdate + ", pbhit=" + pbhit + ", pbdel=" + pbdel + ", pblike=" + pblike
				+ ", mname=" + mname + ", mphoto=" + mphoto + ", mqquote=" + mqquote + ", mqlang=" + mqlang + ", mqwhy="
				+ mqwhy + ", stitle=" + stitle + ", smaker=" + smaker + ", surl=" + surl + ", startRow=" + startRow
				+ ", pageSize=" + pageSize + "]\n";
	}
	
	
}
