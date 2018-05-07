package com.smk.quotebook.service;

import javax.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.smk.quotebook.model.Members;


public interface MembersService {
	public int idChk(String mId);
	public int nameChk(String mName);
	public int memberInsert(MultipartHttpServletRequest mRequest);
	public int loginChk(Members loginmember);
	public Members getMember(String mid);
	public Members getMember2(String mid);
	public int pointUp(Members member);
	public int memberModify(MultipartHttpServletRequest mRequest);
	public int updateMphotoAboutme(Members member);
	public int updateMphoto(Members member);
	public int updateAboutme(Members member);
	public int updateMpw(Members member);
	public int updateMdrop(String mid);
	public int profileHide(String mid);
	public int profileShow(String mid);
	public int getDrop(String mid);
	public int deleteMphoto(String mphoto);
	public int setPoint0(String mid);
}
