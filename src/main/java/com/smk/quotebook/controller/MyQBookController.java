package com.smk.quotebook.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smk.quotebook.dao.PublicQBookDao;
import com.smk.quotebook.model.Langlist;
import com.smk.quotebook.model.Members;
import com.smk.quotebook.model.MyQBook;
import com.smk.quotebook.model.PublicQBook;
import com.smk.quotebook.model.WordCard;
import com.smk.quotebook.service.MembersService;
import com.smk.quotebook.service.MyQBookService;
import com.smk.quotebook.service.MySqlPaging;
import com.smk.quotebook.service.Paging;
import com.smk.quotebook.service.PublicQBookService;

@Controller
public class MyQBookController {
	@Autowired
	private MyQBookService myqbookservice;
	@Autowired
	private PublicQBookService pbservice;
	@Autowired
	private MembersService memberservice;
	
	@RequestMapping(value="myQuoteView")
	public String myQuoteView(HttpSession session, Model model, String pageNum, String mqlang, String important) {
		//System.out.println("mqlang "+mqlang);		
		String mid = (String) session.getAttribute("mid");
		ArrayList<String> mylangs = (ArrayList<String>) myqbookservice.getmylanglist(mid);
		ArrayList<Langlist> mylanglist= new ArrayList<>();
		for(int i=0; i<mylangs.size();i++) {
			mylanglist.add(i, new Langlist(i, mylangs.get(i)));
		}		
		ArrayList<Langlist> langlist = (ArrayList<Langlist>) pbservice.getlanglist();
		ArrayList<ArrayList> myquotelist = new ArrayList<ArrayList>();
		ArrayList<MySqlPaging> paginglist = new ArrayList<MySqlPaging>();
		ArrayList<MyQBook> importantlist = new ArrayList<>();
		
		int lang_idx=0;
		for(int i=0; i<mylanglist.size(); i++) {
			if(mylanglist.get(i).getLname()==mqlang || mylanglist.get(i).getLname().equals(mqlang)) {
				lang_idx=i;
				//System.out.println("lang idx :"+i);
			}			
		}
		int importantQCnt=0;
		ArrayList<WordCard> raw_word1list = (ArrayList<WordCard>) myqbookservice.getWord1(mid);
		ArrayList<WordCard> raw_word2list = (ArrayList<WordCard>) myqbookservice.getWord2(mid);
		ArrayList<WordCard> raw_word3list = (ArrayList<WordCard>) myqbookservice.getWord3(mid);
		ArrayList<WordCard> raw_word4list = (ArrayList<WordCard>) myqbookservice.getWord4(mid);
		ArrayList<WordCard> wordlist=new ArrayList<>();
		for(int i=0; i<raw_word1list.size(); i++) {
			if(raw_word1list.get(i)!=null) {
				wordlist.add(raw_word1list.get(i));
			}
		}
		for(int i=0; i<raw_word2list.size(); i++) {
			if(raw_word2list.get(i)!=null) {
				wordlist.add(raw_word2list.get(i));
			}
		}
		for(int i=0; i<raw_word3list.size(); i++) {
			if(raw_word3list.get(i)!=null) {
				wordlist.add(raw_word3list.get(i));
			}
		}
		for(int i=0; i<raw_word4list.size(); i++) {
			if(raw_word4list.get(i)!=null) {
				wordlist.add(raw_word4list.get(i));
			}
		}
		//System.out.println("wordlist : "+wordlist);
		model.addAttribute("wordlist", wordlist);
		
		MyQBook midlang = new MyQBook();
		midlang.setMid(mid);
		if(pageNum==null) {
			for(int i=0; i<mylanglist.size(); i++) {
				midlang.setMqlang(mylanglist.get(i).getLname());
				int eachLangQCnt = myqbookservice.getEachlangCnt(midlang);
				mylanglist.get(i).setLangCnt(eachLangQCnt);
				//System.out.println("eachLangQcnt"+eachLangQCnt);
				MySqlPaging paging = new MySqlPaging(eachLangQCnt, "1", 5);
				midlang.setStartRow(paging.getStartRow());
				midlang.setPageSize(5);
				paginglist.add(paging);
				ArrayList<MyQBook> thelanglist= (ArrayList<MyQBook>) myqbookservice.getmyQuotelist(midlang);
				for(int j=0; j<thelanglist.size(); j++) {
					int mqid= thelanglist.get(j).getMqid();
					int wordsCnt = myqbookservice.getWordsCnt(mqid);
					//System.out.println("wordsCnt of"+mqid+" :"+wordsCnt);
					thelanglist.get(j).setWordsCnt(wordsCnt);
				}			
				myquotelist.add(thelanglist);
			}
			MyQBook midstartRow= new MyQBook();
			midstartRow.setMid(mid);
			importantQCnt=myqbookservice.getimportantQCnt(mid);
			MySqlPaging paging_im=new MySqlPaging(importantQCnt, "1", 5);
			midstartRow.setStartRow(paging_im.getStartRow());
			midstartRow.setPageSize(5);
			importantlist = (ArrayList<MyQBook>) myqbookservice.getimportantQs(midstartRow);
			model.addAttribute("paging_im", paging_im);
		}else {			
			for(int i=0; i<mylanglist.size(); i++) {
				midlang.setMqlang(mylanglist.get(i).getLname());
				int eachLangQCnt = myqbookservice.getEachlangCnt(midlang);
				mylanglist.get(i).setLangCnt(eachLangQCnt);
				if(lang_idx==i) {
					MySqlPaging paging = new MySqlPaging(eachLangQCnt, pageNum, 5);
					midlang.setStartRow(paging.getStartRow());
					midlang.setPageSize(5);
					paginglist.add(paging);
				}else {
					MySqlPaging paging = new MySqlPaging(eachLangQCnt, "1", 5);
					midlang.setStartRow(paging.getStartRow());
					midlang.setPageSize(5);
					paginglist.add(paging);
				}
				ArrayList<MyQBook> thelanglist= (ArrayList<MyQBook>) myqbookservice.getmyQuotelist(midlang);
				for(int j=0; j<thelanglist.size(); j++) {
					int mqid= thelanglist.get(j).getMqid();
					int wordsCnt = myqbookservice.getWordsCnt(mqid);
					//System.out.println("wordsCnt of"+mqid+" :"+wordsCnt);
					thelanglist.get(j).setWordsCnt(wordsCnt);
				}			
				myquotelist.add(thelanglist);
			}
			
			if(important!=null) {
				MyQBook midstartRow= new MyQBook();
				midstartRow.setMid(mid);
				importantQCnt=myqbookservice.getimportantQCnt(mid);
				MySqlPaging paging_im=new MySqlPaging(importantQCnt, pageNum, 5);
				midstartRow.setStartRow(paging_im.getStartRow());
				midstartRow.setPageSize(5);
				importantlist = (ArrayList<MyQBook>) myqbookservice.getimportantQs(midstartRow);
				model.addAttribute("paging_im", paging_im);
			}else {
				MyQBook midstartRow= new MyQBook();
				midstartRow.setMid(mid);
				importantQCnt=myqbookservice.getimportantQCnt(mid);
				MySqlPaging paging_im=new MySqlPaging(importantQCnt, "1", 5);
				midstartRow.setStartRow(paging_im.getStartRow());
				midstartRow.setPageSize(5);
				importantlist = (ArrayList<MyQBook>) myqbookservice.getimportantQs(midstartRow);
				model.addAttribute("paging_im", paging_im);
			}
		}
		//System.out.println("mylanglist "+mylanglist);
		//System.out.println("myquotelist"+myquotelist);	
		//System.out.println("importantlist "+importantlist);
		model.addAttribute("paging", paginglist);
		model.addAttribute( "myquotelist", myquotelist);
		model.addAttribute("mylanglist", mylanglist);
		model.addAttribute("langlist", langlist);
		model.addAttribute("myQCnt", myqbookservice.getmyQCnt(mid));
		model.addAttribute("mylangCnt", mylanglist.size());
		model.addAttribute("myWordCnt", myqbookservice.getmyWordCnt(mid));
		model.addAttribute("myPhraseCnt", myqbookservice.getmyPhaseCnt(mid));
		model.addAttribute("importantlist", importantlist);
		model.addAttribute("importantQCnt", importantQCnt);
		
		return "mybook/mybook_view";
	}
	
	@RequestMapping(value="askView")
	public String askView() {
		return "mybook/mybook_post";
	}
	
	@RequestMapping(value="addQuoteView")
	public String addQuoteView() {
		return "mybook/mybook_write";
	}
	
	@RequestMapping(value="addQuote")
	public String addQuote(MyQBook myqbook, HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		int uppoint = 20;
		Members member = new Members();
		member.setMid(mid);
		member.setMpoint(uppoint);
		
		String mqquote =myqbook.getMqquote();
		String word1=myqbook.getWord1();
		String word2=myqbook.getWord2();
		String word3=myqbook.getWord3();
		String phrase = myqbook.getPhrase();
		mqquote=mqquote.replace("\"","'");		
		myqbook.setMqquote(mqquote);
		int result=0;
		int result1 = myqbookservice.insertMyQBook(myqbook);
		int result2 = myqbookservice.insertSource(myqbook);
		int result3 = myqbookservice.insertVoca(myqbook);
		if(result1==1 && result2==1 && result3==1) {
			result=1;
			memberservice.pointUp(member);
		}		
		return "redirect:myQuoteView.do?insertresult="+result;
	}
	
	@RequestMapping(value="postQuoteView")
	public String postQuoteView(String mqid, Model model) {
		int mqid_num = Integer.parseInt(mqid);
		MyQBook quote = myqbookservice.getQuote(mqid_num);
		model.addAttribute("quote", quote);
		return "mybook/mybook_post";
	}
	
	@RequestMapping(value="postQuote")
	public String postQuote(PublicQBook publicbook, HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		publicbook.setMid(mid);
		int uppoint = 10;
		Members member = new Members();
		member.setMid(mid);
		member.setMpoint(uppoint);
		//System.out.println("publicbook from view "+publicbook);
		String pbcontent = publicbook.getPbcontent();
		pbcontent= pbcontent.replace("\n","<br>");
		publicbook.setPbcontent(pbcontent);
		int result=pbservice.insertPB(publicbook);
		if(result==1) {
			memberservice.pointUp(member);
		}
		String mqlang= publicbook.getMqlang();
		return "redirect:list.do?mqlang="+mqlang;
	}
	
	@RequestMapping(value="meaningModify")
	public String meaningModify(String no, MyQBook modifiedMeaning, HttpSession session,Model model) {
		String mid = (String) session.getAttribute("mid");
		int uppoint = 2;
		Members member = new Members();
		member.setMid(mid);
		member.setMpoint(uppoint);
		
		int num = Integer.parseInt(no);		
		int result=0;
		String meaning="failedfailed";
		if(num==1) {
			result =myqbookservice.modifyMeaning1(modifiedMeaning);
			meaning = modifiedMeaning.getMeaning1();
		}else if(num==2) {
			result = myqbookservice.modifyMeaning2(modifiedMeaning);
			meaning = modifiedMeaning.getMeaning2();
		}else if(num==3) {
			result =myqbookservice.modifyMeaning3(modifiedMeaning);
			meaning = modifiedMeaning.getMeaning3();
		}
		
		if(result==1) {
			int result2 =memberservice.pointUp(member);
			if(result2==1) {
				model.addAttribute("modifyResult", result);
				model.addAttribute("meaning", meaning);
			}
		}
		return "mybook/ajaxResult";
	}
	
	@RequestMapping(value="deleteQuote")
	public String deleteQuote(String mqid, Model model, HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		int uppoint = -20;
		Members member = new Members();
		member.setMid(mid);
		member.setMpoint(uppoint);
		
		int mqidNum = Integer.parseInt(mqid);
		int result =0;
		int result1 = myqbookservice.deleteQuote1(mqidNum);
		int result2 = myqbookservice.deleteQuote2(mqidNum);
		int result3 = myqbookservice.deleteQuote3(mqidNum);
		if(result1==1 && result2==1 && result3==1) {
			result=1;
			memberservice.pointUp(member);
		}
		model.addAttribute("deleteResult", result);
		return "mybook/ajaxResult";
	}
	
	@RequestMapping(value="addQuoteAjax")
	public String addQuoteAjax(MyQBook newVoca, Model model, HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		int uppoint = 2;
		Members member = new Members();
		member.setMid(mid);
		member.setMpoint(uppoint);
		
		int wordIdx = newVoca.getWordsCnt()+1;
		int result=0;
		switch (wordIdx) {
		case 1:
			result= myqbookservice.addword1(newVoca);
			break;
		case 2:
			result= myqbookservice.addword2(newVoca);
			break;
		case 3:
			result= myqbookservice.addword3(newVoca);
			break;
		default:
			break;
		}
		if(result==1) {
			memberservice.pointUp(member);
		}
		return "redirect:myQuoteView.do";
	}
	
	@RequestMapping(value="searchMB")
	public String searchMB(String keyword, int cate, Model model, HttpSession session, String pageNum, String mqlang) {
		System.out.println("keyword "+keyword);
		System.out.println("cate "+cate);
		String mid = (String) session.getAttribute("mid");
		int searchCnt;
		int resultCnt=0;
		ArrayList<String> searchlanglist = new ArrayList<>();
		ArrayList<Langlist> langlist = (ArrayList<Langlist>) pbservice.getlanglist();
		ArrayList<ArrayList> searchlist = new ArrayList<ArrayList>();
		ArrayList<MySqlPaging> paginglist = new ArrayList<MySqlPaging>();
		
		int lang_idx=0;
		for(int i=0; i<searchlanglist.size(); i++) {
			if(searchlanglist.get(i)==mqlang || searchlanglist.get(i).equals(mqlang)) {
				lang_idx=i;
				//System.out.println("lang idx :"+i);
			}			
		}
		System.out.println("cate+1="+(cate+1));
		MyQBook midsearch = new MyQBook();
		midsearch.setMid(mid);		
		if(cate==1) {
			if(pageNum==null) {
				midsearch.setMqquote(keyword);
				searchlanglist=(ArrayList<String>) myqbookservice.searchMBquotelanglist(midsearch);
				for(int i=0; i<searchlanglist.size(); i++) {
					midsearch.setMqlang(searchlanglist.get(i));
					searchCnt = myqbookservice.searchMBquoteCnt(midsearch);
					resultCnt+=searchCnt;
					MySqlPaging paging = new MySqlPaging(searchCnt, "1", 5);
					midsearch.setStartRow(paging.getStartRow());
					midsearch.setPageSize(5);
					paginglist.add(paging);
					ArrayList<MyQBook> thelangsearchlist= (ArrayList<MyQBook>) myqbookservice.searchMBquote(midsearch);
					for(int j=0; j<thelangsearchlist.size(); j++) {
						int mqid= thelangsearchlist.get(j).getMqid();
						int wordsCnt = myqbookservice.getWordsCnt(mqid);
						//System.out.println("wordsCnt of"+mqid+" :"+wordsCnt);
						thelangsearchlist.get(j).setWordsCnt(wordsCnt);
					}			
					searchlist.add(thelangsearchlist);
				}
			}else {
				midsearch.setMqquote(keyword);
				searchlanglist=(ArrayList<String>) myqbookservice.searchMBquotelanglist(midsearch);
				for(int i=0; i<searchlanglist.size(); i++) {
					midsearch.setMqlang(searchlanglist.get(i));
					searchCnt = myqbookservice.searchMBquoteCnt(midsearch);
					resultCnt+=searchCnt;
					if(i==lang_idx) {
						MySqlPaging paging = new MySqlPaging(searchCnt, pageNum, 5);
						midsearch.setStartRow(paging.getStartRow());
						midsearch.setPageSize(5);
						paginglist.add(paging);
					}else {
						MySqlPaging paging = new MySqlPaging(searchCnt, "1", 5);
						midsearch.setStartRow(paging.getStartRow());
						midsearch.setPageSize(5);
						paginglist.add(paging);
					}					
					ArrayList<MyQBook> thelangsearchlist= (ArrayList<MyQBook>) myqbookservice.searchMBquote(midsearch);
					for(int j=0; j<thelangsearchlist.size(); j++) {
						int mqid= thelangsearchlist.get(j).getMqid();
						int wordsCnt = myqbookservice.getWordsCnt(mqid);
						//System.out.println("wordsCnt of"+mqid+" :"+wordsCnt);
						thelangsearchlist.get(j).setWordsCnt(wordsCnt);
					}			
					searchlist.add(thelangsearchlist);
				}
			}		
		}else if(cate==2) {
			if(pageNum==null) {
				midsearch.setMeaning1(keyword);
				searchlanglist=(ArrayList<String>) myqbookservice.searchMBmeaninglanglist(midsearch);
				for(int i=0; i<searchlanglist.size(); i++) {
					midsearch.setMqlang(searchlanglist.get(i));
					searchCnt = myqbookservice.searchMBmeaningCnt(midsearch);
					resultCnt+=searchCnt;					
					MySqlPaging paging = new MySqlPaging(searchCnt, "1", 5);
					midsearch.setStartRow(paging.getStartRow());
					midsearch.setPageSize(5);
					paginglist.add(paging);
					//System.out.println("midsearch "+midsearch);
					ArrayList<MyQBook> thelangsearchlist= (ArrayList<MyQBook>) myqbookservice.searchMBmeaning(midsearch);
					for(int j=0; j<thelangsearchlist.size(); j++) {
						int mqid= thelangsearchlist.get(j).getMqid();
						int wordsCnt = myqbookservice.getWordsCnt(mqid);
						//System.out.println("wordsCnt of"+mqid+" :"+wordsCnt);
						thelangsearchlist.get(j).setWordsCnt(wordsCnt);
					}			
					searchlist.add(thelangsearchlist);
				}
			}else {
				midsearch.setMeaning1(keyword);
				searchlanglist=(ArrayList<String>) myqbookservice.searchMBmeaninglanglist(midsearch);
				for(int i=0; i<searchlanglist.size(); i++) {
					midsearch.setMqlang(searchlanglist.get(i));
					searchCnt = myqbookservice.searchMBmeaningCnt(midsearch);
					resultCnt+=searchCnt;
					if(i==lang_idx) {
						MySqlPaging paging = new MySqlPaging(searchCnt, pageNum, 5);
						midsearch.setStartRow(paging.getStartRow());
						midsearch.setPageSize(5);
						paginglist.add(paging);
					}else {
						MySqlPaging paging = new MySqlPaging(searchCnt, "1", 5);
						midsearch.setStartRow(paging.getStartRow());
						midsearch.setPageSize(5);
						paginglist.add(paging);
					}					
					ArrayList<MyQBook> thelangsearchlist= (ArrayList<MyQBook>) myqbookservice.searchMBmeaning(midsearch);
					for(int j=0; j<thelangsearchlist.size(); j++) {
						int mqid= thelangsearchlist.get(j).getMqid();
						int wordsCnt = myqbookservice.getWordsCnt(mqid);
						//System.out.println("wordsCnt of"+mqid+" :"+wordsCnt);
						thelangsearchlist.get(j).setWordsCnt(wordsCnt);
					}			
					searchlist.add(thelangsearchlist);
				}
			}		
		}
		System.out.println("searchlist "+searchlist);
		System.out.println("searchlanglist "+searchlanglist);
	
		model.addAttribute("cate", cate);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchlanglist", searchlanglist);
		model.addAttribute("searchlist", searchlist);
		model.addAttribute("paging", paginglist);
		model.addAttribute("langlist", langlist);
		model.addAttribute("resultCnt", resultCnt);
		return "mybook/search_view";
	}
	
}
