package com.smk.quotebook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smk.quotebook.dao.PBCommentDao;
import com.smk.quotebook.model.PBComment;
import com.smk.quotebook.model.PublicQBook;
@Service
public class PBCommentServiceImpl implements PBCommentService{
	@Autowired
	private PBCommentDao pbdao;
	
	@Override
	public List<PBComment> getComments(int pbid) {
		// TODO Auto-generated method stub
		return pbdao.getComments(pbid);
	}

	@Override
	public int getCommentCnt(int pbid) {
		// TODO Auto-generated method stub
		return pbdao.getCommentCnt(pbid);
	}

	@Override
	public int insertStep0(PBComment step0comment) {
		// TODO Auto-generated method stub
		return pbdao.insertStep0(step0comment);
	}

	@Override
	public int insertStep1(PBComment step1comment) {
		// TODO Auto-generated method stub
		return pbdao.insertStep1(step1comment);
	}

	@Override
	public int modifyComment(PBComment modifiedcomment) {
		// TODO Auto-generated method stub
		return pbdao.modifyComment(modifiedcomment);
	}

	@Override
	public int ifhasReply(int pbcid) {
		// TODO Auto-generated method stub
		return pbdao.ifhasReply(pbcid);
	}

	@Override
	public int deleteComment(int pbcid) {
		// TODO Auto-generated method stub
		return pbdao.deleteComment(pbcid);
	}

	@Override
	public String gettoWhom(int pbcid) {
		// TODO Auto-generated method stub
		return pbdao.gettoWhom(pbcid);
	}

	@Override
	public int giveHeart(int pbcid) {
		// TODO Auto-generated method stub
		return pbdao.giveHeart(pbcid);
	}

	@Override
	public int takeHeart(int pbcid) {
		// TODO Auto-generated method stub
		return pbdao.takeHeart(pbcid);
	}

	@Override
	public int getHeartCnt(int pbid) {
		// TODO Auto-generated method stub
		return pbdao.getHeartCnt(pbid);
	}

	@Override
	public String getCommentWriter(int pbcid) {
		// TODO Auto-generated method stub
		return pbdao.getCommentWriter(pbcid);
	}

	@Override
	public List<PBComment> getmyComments(PublicQBook mycomment) {
		// TODO Auto-generated method stub
		return pbdao.getmyComments(mycomment);
	}

	@Override
	public List<PBComment> getmyheartComments(PublicQBook mycomment) {
		// TODO Auto-generated method stub
		return pbdao.getmyheartComments(mycomment);
	}

	@Override
	public int getMaxPbcid() {
		// TODO Auto-generated method stub
		return pbdao.getMaxPbcid();
	}

	@Override
	public PBComment getComment(int pbcid) {
		// TODO Auto-generated method stub
		return pbdao.getComment(pbcid);
	}

}
