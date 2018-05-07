package com.smk.quotebook.model;

import java.sql.Timestamp;

public class Message {
	private int msgid;
	private String msgcontent;
	private Timestamp msgdate;
	private int msgchk;
	private String msgfrom;
	private String msgto;
	private int msgdel;
	private int startRow;
	private int pageSize;
	private String mphoto;
	private String mname;
	
	public Message() {
		super();
	}
	
	
	public String getMphoto() {
		return mphoto;
	}


	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public int getMsgid() {
		return msgid;
	}
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	public String getMsgcontent() {
		return msgcontent;
	}
	public void setMsgcontent(String msgcontent) {
		this.msgcontent = msgcontent;
	}
	public Timestamp getMsgdate() {
		return msgdate;
	}
	public void setMsgdate(Timestamp msgdate) {
		this.msgdate = msgdate;
	}
	public int getMsgchk() {
		return msgchk;
	}
	public void setMsgchk(int msgchk) {
		this.msgchk = msgchk;
	}
	public String getMsgfrom() {
		return msgfrom;
	}
	public void setMsgfrom(String msgfrom) {
		this.msgfrom = msgfrom;
	}
	public String getMsgto() {
		return msgto;
	}
	public void setMsgto(String msgto) {
		this.msgto = msgto;
	}
	public int getMsgdel() {
		return msgdel;
	}
	public void setMsgdel(int msgdel) {
		this.msgdel = msgdel;
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


	@Override
	public String toString() {
		return "Message [msgid=" + msgid + ", msgcontent=" + msgcontent + ", msgdate=" + msgdate + ", msgchk=" + msgchk
				+ ", msgfrom=" + msgfrom + ", msgto=" + msgto + ", msgdel=" + msgdel + ", startRow=" + startRow
				+ ", pageSize=" + pageSize + ", mphoto=" + mphoto + ", mname=" + mname + "]";
	}
	
	
	
}
