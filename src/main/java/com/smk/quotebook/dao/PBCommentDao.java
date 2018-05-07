package com.smk.quotebook.dao;

import java.util.List;

import com.smk.quotebook.model.PBComment;
import com.smk.quotebook.model.PublicQBook;

public interface PBCommentDao {
	public List<PBComment> getComments(int pbid);
	public int getCommentCnt(int pbid);
	public int insertStep0(PBComment step0comment);
	public int insertStep1(PBComment step1comment);
	public int modifyComment(PBComment modifiedcomment);
	public int ifhasReply(int pbcid);
	public int deleteComment(int pbcid);
	public String gettoWhom(int pbcid);
	public int giveHeart(int pbcid);
	public int takeHeart(int pbcid);
	public int getHeartCnt(int pbid);
	public String getCommentWriter(int pbcid);
	public List<PBComment> getmyComments(PublicQBook mycomments);
	public List<PBComment> getmyheartComments(PublicQBook mycomments);
	public int getMaxPbcid();
	public PBComment getComment(int pbcid);
}
