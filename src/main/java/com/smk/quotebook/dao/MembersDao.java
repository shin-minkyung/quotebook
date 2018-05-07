package com.smk.quotebook.dao;

import com.smk.quotebook.model.Members;

public interface MembersDao {
	public int idChk(String mId);
	public int nameChk(String mName);
	public int memberInsert(Members joinmember);
	public int testUpload(String filename);
	public Members getMember(String mId);
	public Members getMember2(String mId);
	public int pointUp(Members member);
	public int updateMphotoAboutme(Members member);
	public int updateMphoto(Members member);
	public int updateAboutme(Members member);
	public int updateMpw(Members member);
	public int updateMdrop(String mid);
	public int profileHide(String mid);
	public int profileShow(String mid);
	public int getDrop(String mid);
	public int setPoint0(String mid);
}
