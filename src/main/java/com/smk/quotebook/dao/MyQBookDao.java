package com.smk.quotebook.dao;

import java.util.ArrayList;
import java.util.List;

import com.smk.quotebook.model.Langlist;
import com.smk.quotebook.model.MyQBook;
import com.smk.quotebook.model.WordCard;

public interface MyQBookDao {
	public List<String> getmylanglist(String mid);
	public int getmyQCnt(String mid);
	public int getmyWordCnt(String mid);
	public int getmyPhaseCnt(String mid);
	public int getEachlangCnt(MyQBook midlang);
	public List<MyQBook> getmyQuotelist(MyQBook midlang);
	public int insertMyQBook(MyQBook myQBook);
	public int insertSource(MyQBook myQBook);
	public int insertVoca(MyQBook myQBook);
	public MyQBook getQuote(int mqid);
	public MyQBook getWords(int mqid);
	public int modifyMeaning1(MyQBook modifiedMeaning);
	public int modifyMeaning2(MyQBook modifiedMeaning);
	public int modifyMeaning3(MyQBook modifiedMeaning);
	public int modifyMeaning4(MyQBook modifiedMeaning);
	public int deleteQuote1(int mqid);
	public int deleteQuote2(int mqid);
	public int deleteQuote3(int mqid);
	public int addword1(MyQBook newWord);
	public int addword2(MyQBook newWord);
	public int addword3(MyQBook newWord);
	public List<MyQBook> getmyrecent10Q(String mid);
	public List<MyQBook> searchMBquote(MyQBook searchquote);
	public List<MyQBook> searchMBmeaning(MyQBook searchmeaning);
	public int searchMBquoteCnt(MyQBook searchquote);
	public int searchMBmeaningCnt(MyQBook searchmeaning);
	public List<String> searchMBquotelanglist(MyQBook searchquote);
	public List<String> searchMBmeaninglanglist(MyQBook searchquote);
	public List<MyQBook> getimportantQs(MyQBook midstartRow);
	public int getimportantQCnt(String mid);
	public List<WordCard> getWord1(String mid);
	public List<WordCard> getWord2(String mid);
	public List<WordCard> getWord3(String mid);
	public List<WordCard> getWord4(String mid);
}

