package com.smk.quotebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smk.quotebook.model.PBComment;
import com.smk.quotebook.model.PublicQBook;
@Repository
public class PBCommentDaoImpl implements PBCommentDao{
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public List<PBComment> getComments(int pbid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getComments", pbid);
	}

	@Override
	public int getCommentCnt(int pbid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getCommentCnt", pbid);
	}

	@Override
	public int insertStep0(PBComment step0comment) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertStep0", step0comment);
	}

	@Override
	public int insertStep1(PBComment step1comment) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertStep1", step1comment);
	}

	@Override
	public int modifyComment(PBComment modifiedcomment) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("modifyComment", modifiedcomment);
	}

	@Override
	public int ifhasReply(int pbcid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("ifhasReply", pbcid);
	}

	@Override
	public int deleteComment(int pbcid) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("deleteComment", pbcid);
	}

	@Override
	public String gettoWhom(int pbcid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("toWhom", pbcid);
	}

	@Override
	public int giveHeart(int pbcid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("giveHeart", pbcid);
	}

	@Override
	public int takeHeart(int pbcid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("takeHeart", pbcid);
	}

	@Override
	public int getHeartCnt(int pbid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getHeartCnt", pbid);
	}

	@Override
	public String getCommentWriter(int pbcid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getCommentWriter", pbcid);
	}

	@Override
	public List<PBComment> getmyComments(PublicQBook mycomments) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getmyComments", mycomments);
	}

	@Override
	public List<PBComment> getmyheartComments(PublicQBook mycomments) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getmyheartComments", mycomments);
	}

	@Override
	public int getMaxPbcid() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getMaxPbcid");
	}

	@Override
	public PBComment getComment(int pbcid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getComment", pbcid);
		
	}

}
