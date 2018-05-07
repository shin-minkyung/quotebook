package com.smk.quotebook.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smk.quotebook.model.Langlist;
import com.smk.quotebook.model.MyQBook;
import com.smk.quotebook.model.WordCard;

@Repository
public class MyQBookDaoImpl implements MyQBookDao{	
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public List<String> getmylanglist(String mid) {
		// TODO Auto-generated method stub		
		return sessionTemplate.selectList("getmylanglist", mid);
	}

	@Override
	public int getmyQCnt(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getmyQCnt", mid);
	}

	@Override
	public int getmyWordCnt(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getWordCnt", mid);
	}

	@Override
	public int getmyPhaseCnt(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getPhaseCnt", mid);
	}

	@Override
	public int getEachlangCnt(MyQBook midlang) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getCntEachlang", midlang);
	}

	@Override
	public List<MyQBook> getmyQuotelist(MyQBook midlang) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getMyQlist", midlang);
	}

	@Override
	public int insertMyQBook(MyQBook myQBook) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertMyQBook", myQBook);
	}

	@Override
	public int insertSource(MyQBook myQBook) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertSourceInfo", myQBook);
	}

	@Override
	public int insertVoca(MyQBook myQBook) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertVocanote", myQBook);
	}

	@Override
	public MyQBook getQuote(int mqid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getQuote", mqid);
	}

	@Override
	public MyQBook getWords(int mqid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getWords", mqid);
	}

	@Override
	public int modifyMeaning1(MyQBook modifiedMeaning) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("modifyMeaning1", modifiedMeaning);
	}

	@Override
	public int modifyMeaning2(MyQBook modifiedMeaning) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("modifyMeaning2", modifiedMeaning);
	}

	@Override
	public int modifyMeaning3(MyQBook modifiedMeaning) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("modifyMeaning3", modifiedMeaning);
	}

	@Override
	public int modifyMeaning4(MyQBook modifiedMeaning) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("modifyMeaning4", modifiedMeaning);
	}

	@Override
	public int deleteQuote1(int mqid) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("deleteQuote1", mqid);
	}

	@Override
	public int deleteQuote2(int mqid) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("deleteQuote2", mqid);
	}

	@Override
	public int deleteQuote3(int mqid) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("deleteQuote3", mqid);
	}

	@Override
	public int addword1(MyQBook newWord) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("addWord1", newWord);
	}

	@Override
	public int addword2(MyQBook newWord) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("addWord2", newWord);
	}

	@Override
	public int addword3(MyQBook newWord) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("addWord3", newWord);
	}

	@Override
	public List<MyQBook> getmyrecent10Q(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getmyRecent10Q", mid);
	}

	@Override
	public List<MyQBook> searchMBquote(MyQBook searchquote) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchMBquote", searchquote);
	}

	@Override
	public List<MyQBook> searchMBmeaning(MyQBook searchmeaning) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchMBmeaning", searchmeaning);
	}

	@Override
	public int searchMBquoteCnt(MyQBook searchquote) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("searchMBquoteCnt", searchquote);
	}

	@Override
	public int searchMBmeaningCnt(MyQBook searchmeaning) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("searchMBmeaningCnt", searchmeaning);
	}

	@Override
	public List<String> searchMBquotelanglist(MyQBook searchquote) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchMBquotelanglist", searchquote);
	}

	@Override
	public List<String> searchMBmeaninglanglist(MyQBook searchmeaning) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchMBmeaninglanglist", searchmeaning);
	}

	@Override
	public List<MyQBook> getimportantQs(MyQBook midstartRow) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getimportantQ", midstartRow);
	}

	@Override
	public int getimportantQCnt(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getimportantQCnt", mid);
	}

	@Override
	public List<WordCard> getWord1(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getWord1", mid);
	}

	@Override
	public List<WordCard> getWord2(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getWord2", mid);
	}

	@Override
	public List<WordCard> getWord3(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getWord3", mid);
	}

	@Override
	public List<WordCard> getWord4(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getWord4", mid);
	}

}
