package com.smk.quotebook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smk.quotebook.model.Members;

@Repository
public class MembersDaoImpl implements MembersDao{
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public int idChk(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("idChk", mid);
	}

	@Override
	public int nameChk(String mName) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("nameChk", mName);
	}

	@Override
	public int memberInsert(Members joinmember) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertMember", joinmember);
	}

	@Override
	public int testUpload(String filename) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("testUpload", filename);
	}

	@Override
	public Members getMember(String mId) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getMember1", mId);
	}

	@Override
	public Members getMember2(String mId) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getMember2", mId);
	}

	@Override
	public int pointUp(Members member) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("pointUp", member);
	}

	@Override
	public int updateMphotoAboutme(Members member) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("updateMphotoAboutme", member);
	}

	@Override
	public int updateMphoto(Members member) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("updateMphoto", member);
	}

	@Override
	public int updateAboutme(Members member) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("updateAboutme", member);
	}

	@Override
	public int updateMpw(Members member) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("updateMpw", member);
	}

	@Override
	public int updateMdrop(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("updateMdrop", mid);
	}

	@Override
	public int profileHide(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("updateProfileHide", mid);
	}

	@Override
	public int profileShow(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("updateProfileShow", mid);
	}

	@Override
	public int getDrop(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getDrop", mid);
	}

	@Override
	public int setPoint0(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("setPoint0", mid);
	}

}
