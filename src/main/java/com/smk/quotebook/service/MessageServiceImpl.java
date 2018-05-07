package com.smk.quotebook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smk.quotebook.dao.MessageDao;
import com.smk.quotebook.model.Message;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDao msgdao;

	@Override
	public int insertMsg(Message msg) {
		// TODO Auto-generated method stub
		return msgdao.insertMsg(msg);
	}

	@Override
	public List<Message> getMsgIgot(Message midstartRow) {
		// TODO Auto-generated method stub
		return msgdao.getMsgIgot(midstartRow);
	}

	@Override
	public List<Message> getMsgIsent(Message midstartRow) {
		// TODO Auto-generated method stub
		return msgdao.getMsgIsent(midstartRow);
	}

	@Override
	public int deleteMsg(int msgid) {
		// TODO Auto-generated method stub
		return msgdao.deleteMsg(msgid);
	}

	@Override
	public int getMsgIgotCnt(String msgto) {
		// TODO Auto-generated method stub
		return msgdao.getMsgIgotCnt(msgto);
	}

	@Override
	public int getMsgIsentCnt(String msgfrom) {
		// TODO Auto-generated method stub
		return msgdao.getMsgIsentCnt(msgfrom);
	}

	@Override
	public Message theMsgIgot(int msgid) {
		// TODO Auto-generated method stub
		return msgdao.theMsgIgot(msgid);
	}

	@Override
	public Message theMsgIsent(int msgid) {
		// TODO Auto-generated method stub
		return msgdao.theMsgIsent(msgid);
	}

	@Override
	public int msgChecked(int msgid) {
		// TODO Auto-generated method stub
		return msgdao.msgChecked(msgid);
	}

	@Override
	public int getMaxMsgid() {
		// TODO Auto-generated method stub
		return msgdao.getMaxMsgid();
	}
	
	
}
