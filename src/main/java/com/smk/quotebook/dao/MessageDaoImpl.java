package com.smk.quotebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smk.quotebook.model.Message;

@Repository
public class MessageDaoImpl implements MessageDao{
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public int insertMsg(Message msg) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertMsg", msg);
	}

	@Override
	public List<Message> getMsgIgot(Message midstartRow) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getMsgIgot", midstartRow);
	}

	@Override
	public List<Message> getMsgIsent(Message midstartRow) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getMsgIsent", midstartRow);
	}

	@Override
	public int deleteMsg(int msgid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("deleteMsg", msgid);
	}

	@Override
	public int getMsgIgotCnt(String msgto) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getMsgIgotCnt", msgto);
	}

	@Override
	public int getMsgIsentCnt(String msgfrom) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getMsgIsentCnt", msgfrom);
	}

	@Override
	public Message theMsgIgot(int msgid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("theMsgIgot", msgid);
	}

	@Override
	public Message theMsgIsent(int msgid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("theMsgIsent", msgid);
	}

	@Override
	public int msgChecked(int msgid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("msgChecked", msgid);
	}

	@Override
	public int getMaxMsgid() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getMaxMsgid");
	}
}
