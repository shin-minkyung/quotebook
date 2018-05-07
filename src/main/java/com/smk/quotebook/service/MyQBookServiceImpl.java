package com.smk.quotebook.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smk.quotebook.dao.MyQBookDao;
import com.smk.quotebook.model.Langlist;
import com.smk.quotebook.model.MyQBook;
import com.smk.quotebook.model.WordCard;

@Service
public class MyQBookServiceImpl implements MyQBookService{
	@Autowired
	private MyQBookDao myqbookdao;
	
	@Override
	public List<String> getmylanglist(String mid) {
		// TODO Auto-generated method stub
		return myqbookdao.getmylanglist(mid);
	}

	@Override
	public int getmyQCnt(String mid) {
		// TODO Auto-generated method stub
		return myqbookdao.getmyQCnt(mid);
	}

	@Override
	public int getmyWordCnt(String mid) {
		// TODO Auto-generated method stub
		return myqbookdao.getmyWordCnt(mid);
	}

	@Override
	public int getmyPhaseCnt(String mid) {
		// TODO Auto-generated method stub
		return myqbookdao.getmyPhaseCnt(mid);
	}

	@Override
	public int getEachlangCnt(MyQBook midlang) {
		// TODO Auto-generated method stub
		return myqbookdao.getEachlangCnt(midlang);
	}

	@Override
	public List<MyQBook> getmyQuotelist(MyQBook midlang) {
		// TODO Auto-generated method stub
		return myqbookdao.getmyQuotelist(midlang);
	}

	@Override
	public int insertMyQBook(MyQBook myQBook) {
		// TODO Auto-generated method stub
		return myqbookdao.insertMyQBook(myQBook);
	}

	@Override
	public int insertSource(MyQBook myQBook) {
		// TODO Auto-generated method stub
		return myqbookdao.insertSource(myQBook);
	}

	@Override
	public int insertVoca(MyQBook myQBook) {
		// TODO Auto-generated method stub
		return myqbookdao.insertVoca(myQBook);
	}

	@Override
	public MyQBook getQuote(int mqid) {
		// TODO Auto-generated method stub
		return myqbookdao.getQuote(mqid);
	}

	@Override
	public MyQBook getWords(int mqid) {
		// TODO Auto-generated method stub
		return myqbookdao.getWords(mqid);
	}

	@Override
	public int getWordsCnt(int mqid) {
		// TODO Auto-generated method stub		
		int wordsCnt=0;
		MyQBook words= myqbookdao.getWords(mqid);
		//System.out.println("words "+words);
		/*System.out.println("word1: "+words.getWord1());
		System.out.println("word2: "+words.getWord2());
		System.out.println("word3: "+words.getWord3());*/
		if(words!=null) {
			if(words.getWord1()!=null) {
				wordsCnt=wordsCnt+1;
				if(words.getWord2()!=null) {
					wordsCnt=wordsCnt+1;
					if(words.getWord3()!=null) {
						wordsCnt=wordsCnt+1;
					}
				}
			}
		}else if(words==null) {
			wordsCnt=0;
		}		
		//System.out.println("wordsCnt"+wordsCnt);
		return wordsCnt;
	}

	@Override
	public int modifyMeaning1(MyQBook modifiedMeaning) {
		// TODO Auto-generated method stub
		return myqbookdao.modifyMeaning1(modifiedMeaning);
	}

	@Override
	public int modifyMeaning2(MyQBook modifiedMeaning) {
		// TODO Auto-generated method stub
		return myqbookdao.modifyMeaning2(modifiedMeaning);
	}

	@Override
	public int modifyMeaning3(MyQBook modifiedMeaning) {
		// TODO Auto-generated method stub
		return myqbookdao.modifyMeaning3(modifiedMeaning);
	}

	@Override
	public int modifyMeaning4(MyQBook modifiedMeaning) {
		// TODO Auto-generated method stub
		return myqbookdao.modifyMeaning4(modifiedMeaning);
	}

	@Override
	public int deleteQuote1(int mqid) {
		// TODO Auto-generated method stub
		return myqbookdao.deleteQuote1(mqid);
	}

	@Override
	public int deleteQuote2(int mqid) {
		// TODO Auto-generated method stub
		return myqbookdao.deleteQuote2(mqid);
	}

	@Override
	public int deleteQuote3(int mqid) {
		// TODO Auto-generated method stub
		return myqbookdao.deleteQuote3(mqid);
	}

	@Override
	public int addword1(MyQBook newWord) {
		// TODO Auto-generated method stub
		return myqbookdao.addword1(newWord);
	}

	@Override
	public int addword2(MyQBook newWord) {
		// TODO Auto-generated method stub
		return myqbookdao.addword2(newWord);
	}

	@Override
	public int addword3(MyQBook newWord) {
		// TODO Auto-generated method stub
		return myqbookdao.addword3(newWord);
	}

	@Override
	public List<MyQBook> getmyrecent10Q(String mid) {
		// TODO Auto-generated method stub
		return myqbookdao.getmyrecent10Q(mid);
	}

	@Override
	public List<MyQBook> searchMBquote(MyQBook searchquote) {
		// TODO Auto-generated method stub
		return myqbookdao.searchMBquote(searchquote);
	}

	@Override
	public List<MyQBook> searchMBmeaning(MyQBook searchmeaning) {
		// TODO Auto-generated method stub
		return myqbookdao.searchMBmeaning(searchmeaning);
	}

	@Override
	public int searchMBquoteCnt(MyQBook searchquote) {
		// TODO Auto-generated method stub
		return myqbookdao.searchMBquoteCnt(searchquote);
	}

	@Override
	public int searchMBmeaningCnt(MyQBook searchmeaning) {
		// TODO Auto-generated method stub
		return myqbookdao.searchMBmeaningCnt(searchmeaning);
	}

	@Override
	public List<String> searchMBquotelanglist(MyQBook searchquote) {
		// TODO Auto-generated method stub
		return myqbookdao.searchMBquotelanglist(searchquote);
	}

	@Override
	public List<String> searchMBmeaninglanglist(MyQBook searchquote) {
		// TODO Auto-generated method stub
		return myqbookdao.searchMBmeaninglanglist(searchquote);
	}

	@Override
	public List<MyQBook> getimportantQs(MyQBook midstartRow) {
		// TODO Auto-generated method stub
		return myqbookdao.getimportantQs(midstartRow);
	}

	@Override
	public int getimportantQCnt(String mid) {
		// TODO Auto-generated method stub
		return myqbookdao.getimportantQCnt(mid);
	}
	
	@Override
	public List<WordCard> getWord1(String mid) {
		// TODO Auto-generated method stub
		return myqbookdao.getWord1(mid);
	}

	@Override
	public List<WordCard> getWord2(String mid) {
		// TODO Auto-generated method stub
		return myqbookdao.getWord2(mid);
	}

	@Override
	public List<WordCard> getWord3(String mid) {
		// TODO Auto-generated method stub
		return myqbookdao.getWord3(mid);
	}

	@Override
	public List<WordCard> getWord4(String mid) {
		// TODO Auto-generated method stub
		return myqbookdao.getWord4(mid);
	}

}
