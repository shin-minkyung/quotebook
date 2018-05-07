package com.smk.quotebook.dao;

import java.util.List;

import com.smk.quotebook.model.Message;

public interface MessageDao {
	public int insertMsg(Message msg);
	public List<Message> getMsgIgot(Message midstartRow); 
	public List<Message> getMsgIsent(Message midstartRow);
	public int deleteMsg(int msgid);
	public int getMsgIgotCnt(String msgto);
	public int getMsgIsentCnt(String msgfrom);
	public Message theMsgIgot(int msgid);
	public Message theMsgIsent(int msgid);
	public int msgChecked(int msgid);
	public int getMaxMsgid();
}
