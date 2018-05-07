package com.smk.quotebook.model;

import java.sql.Timestamp;

public class MyQBook {
	   private int mqid;
	   private String mid;
	   private String mqquote;
	   private String mqlang;
	   private String mqmedia;
	   private String mqwhy;
	   private Timestamp mqdate;
	   private String mqnote;
	   private int mqimportant;
	   
	   private String stitle;
	   private String smaker;
	   private String surl;
	   private String syear;
	   
	   private String word1;
	   private String word2;
	   private String word3;
	   private String phrase;
	   private String meaning1;
	   private String meaning2;
	   private String meaning3;
	   private String meaning4;
	   
	   private int startRow;
	   private int pageSize;	 
	   private int wordsCnt;
	   
	   
	public MyQBook() {
		super();
	}

	public MyQBook(int mqid, String mid, String mqquote, String mqlang, String mqmedia, String mqwhy, Timestamp mqdate,
			String mqnote, int mqimportant, String stitle, String smaker, String surl, String syear, String word1,
			String word2, String word3, String phrase, String meaning1, String meaning2, String meaning3,
			String meaning4) {
		super();
		this.mqid = mqid;
		this.mid = mid;
		this.mqquote = mqquote;
		this.mqlang = mqlang;
		this.mqmedia = mqmedia;
		this.mqwhy = mqwhy;
		this.mqdate = mqdate;
		this.mqnote = mqnote;
		this.mqimportant = mqimportant;
		this.stitle = stitle;
		this.smaker = smaker;
		this.surl = surl;
		this.syear = syear;
		this.word1 = word1;
		this.word2 = word2;
		this.word3 = word3;
		this.phrase = phrase;
		this.meaning1 = meaning1;
		this.meaning2 = meaning2;
		this.meaning3 = meaning3;
		this.meaning4 = meaning4;
	}
	
	
	public int getWordsCnt() {
		return wordsCnt;
	}

	public void setWordsCnt(int wordsCnt) {
		this.wordsCnt = wordsCnt;
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
	public String getMqmedia() {
		return mqmedia;
	}
	public void setMqmedia(String mqmedia) {
		this.mqmedia = mqmedia;
	}
	public String getMqwhy() {
		return mqwhy;
	}
	public void setMqwhy(String mqwhy) {
		this.mqwhy = mqwhy;
	}
	public Timestamp getMqdate() {
		return mqdate;
	}
	public void setMqdate(Timestamp mqdate) {
		this.mqdate = mqdate;
	}
	public String getMqnote() {
		return mqnote;
	}
	public void setMqnote(String mqnote) {
		this.mqnote = mqnote;
	}
	public int getMqimportant() {
		return mqimportant;
	}
	public void setMqimportant(int mqimportant) {
		this.mqimportant = mqimportant;
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
	public String getSyear() {
		return syear;
	}
	public void setSyear(String syear) {
		this.syear = syear;
	}
	public String getWord1() {
		return word1;
	}
	public void setWord1(String word1) {
		this.word1 = word1;
	}
	public String getWord2() {
		return word2;
	}
	public void setWord2(String word2) {
		this.word2 = word2;
	}
	public String getWord3() {
		return word3;
	}
	public void setWord3(String word3) {
		this.word3 = word3;
	}
	public String getPhrase() {
		return phrase;
	}
	public void setPhrase(String phrase) {
		this.phrase = phrase;
	}
	public String getMeaning1() {
		return meaning1;
	}
	public void setMeaning1(String meaning1) {
		this.meaning1 = meaning1;
	}
	public String getMeaning2() {
		return meaning2;
	}
	public void setMeaning2(String meaning2) {
		this.meaning2 = meaning2;
	}
	public String getMeaning3() {
		return meaning3;
	}
	public void setMeaning3(String meaning3) {
		this.meaning3 = meaning3;
	}
	public String getMeaning4() {
		return meaning4;
	}
	public void setMeaning4(String meaning4) {
		this.meaning4 = meaning4;
	}

	@Override
	public String toString() {
		return "MyQBook [mqid=" + mqid + ", mid=" + mid + ", mqquote=" + mqquote + ", mqlang=" + mqlang + ", mqmedia="
				+ mqmedia + ", mqwhy=" + mqwhy + ", mqdate=" + mqdate + ", mqnote=" + mqnote + ", mqimportant="
				+ mqimportant + ", stitle=" + stitle + ", smaker=" + smaker + ", surl=" + surl + ", syear=" + syear
				+ ", word1=" + word1 + ", word2=" + word2 + ", word3=" + word3 + ", phrase=" + phrase + ", meaning1="
				+ meaning1 + ", meaning2=" + meaning2 + ", meaning3=" + meaning3 + ", meaning4=" + meaning4
				+ ", startRow=" + startRow + ", pageSize=" + pageSize + "]";
	}
	
	
	   
	   
}
