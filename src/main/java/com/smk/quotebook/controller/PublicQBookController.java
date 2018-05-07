package com.smk.quotebook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smk.quotebook.model.Alarm;
import com.smk.quotebook.model.Langlist;
import com.smk.quotebook.model.Members;
import com.smk.quotebook.model.MyQBook;
import com.smk.quotebook.model.PBComment;
import com.smk.quotebook.model.PublicQBook;
import com.smk.quotebook.service.AlarmService;
import com.smk.quotebook.service.MembersService;
import com.smk.quotebook.service.MyQBookService;
import com.smk.quotebook.service.MySqlPaging;
import com.smk.quotebook.service.PBCommentService;
import com.smk.quotebook.service.PublicQBookService;
import com.smk.quotebook.service.RankingsService;

@Controller
public class PublicQBookController {
	@Autowired
	private PublicQBookService pbservice;
	@Autowired
	private MembersController membercontroller;
	@Autowired
	private PBCommentService pbcservice;
	@Autowired
	private MembersService memberservice;
	@Autowired
	private RankingsService rankingservice;
	@Autowired
	private MyQBookService myqbookservice;
	@Autowired
	private AlarmService alarmservice;
	
	@RequestMapping(value="main")
	public String main(Model model) {
		ArrayList<Langlist> langlist= (ArrayList<Langlist>) pbservice.getlanglist();
		ArrayList<ArrayList<PublicQBook>> topreadlist = new ArrayList<>();
		ArrayList<ArrayList<PublicQBook>> topnewlist = new ArrayList<>();
		topreadlist=membercontroller.getoplists("pop");
		topnewlist=membercontroller.getoplists("new");
		for(int i=0; i<topreadlist.size(); i++) {
			for(int j=0; j<topreadlist.get(i).size(); j++) {
				int pbid= topreadlist.get(i).get(j).getPbid();
				int commentCnt = pbcservice.getCommentCnt(pbid);
				topreadlist.get(i).get(j).setCommentCnt(commentCnt);
				int heartCnt = pbcservice.getHeartCnt(pbid);
				topreadlist.get(i).get(j).setHeartCnt(heartCnt);
			}
		}
		for(int i=0; i<topnewlist.size(); i++) {
			for(int j=0; j<topnewlist.get(i).size(); j++) {
				int pbid= topnewlist.get(i).get(j).getPbid();
				int commentCnt = pbcservice.getCommentCnt(pbid);
				topnewlist.get(i).get(j).setCommentCnt(commentCnt);
				int heartCnt = pbcservice.getHeartCnt(pbid);
				topnewlist.get(i).get(j).setHeartCnt(heartCnt);
			}
		}
		
		
		model.addAttribute("new3", topnewlist);
		model.addAttribute("pop3", topreadlist);
		model.addAttribute("langlist", langlist);
		return "main/main";
	}
	
	@RequestMapping(value="list")
	public String myQuoteView(String mqlang, Model model, String pageNum) {
		PublicQBook lang = new PublicQBook();		
		ArrayList<Langlist> langlist= (ArrayList<Langlist>) pbservice.getlanglist();
		//System.out.println("langlist "+langlist);		
		lang.setMqlang(mqlang);
		int eachlangPBcnt = pbservice.getEachlangPBCnt(lang.getMqlang());
		MySqlPaging paging = new MySqlPaging(eachlangPBcnt, pageNum, 5);
		lang.setStartRow(paging.getStartRow());
		lang.setPageSize(5);	
		
		ArrayList<PublicQBook> pblist= (ArrayList<PublicQBook>) pbservice.getPBlist(lang);
		for(int i=0; i<pblist.size(); i++) {
			int pbid= pblist.get(i).getPbid();
			int commentCnt = pbcservice.getCommentCnt(pbid);
			int heartCnt = pbcservice.getHeartCnt(pbid);
			pblist.get(i).setCommentCnt(commentCnt);
			pblist.get(i).setHeartCnt(heartCnt);
		}
		////System.out.println("langno "+langno);
		model.addAttribute("langlist", langlist);
		//model.addAttribute("langno", langno);
		model.addAttribute("mqlang", mqlang);
		model.addAttribute("paging", paging);
		model.addAttribute("pblist", pblist);
		return "publicbook/list";
	}
	
	
	@RequestMapping(value="contentView")
	public String contentView(String pbid, Model model) {		
		int pbidnum=Integer.parseInt(pbid);		
		PublicQBook pbook= pbservice.getPB(pbidnum);
		if(pbook.getPbdel()==0) {
			pbservice.upHit(pbidnum);
			ArrayList<Langlist> langlist= (ArrayList<Langlist>) pbservice.getlanglist();
			ArrayList<PBComment> commentlist = (ArrayList<PBComment>) pbcservice.getComments(pbidnum);
			for(int i=0;i<commentlist.size();i++) {
				if(commentlist.get(i).getCindent()==0) {
					int pbcid =commentlist.get(i).getPbcid();
					int cgroupCnt = pbcservice.ifhasReply(pbcid);
					System.out.println("pbcid"+pbcid);
					System.out.println("cgroupCnt "+cgroupCnt);
					commentlist.get(i).setCgroupCnt(cgroupCnt);
				}else if(commentlist.get(i).getCindent()==1) {
					int pbcid =commentlist.get(i).getPbcid();
					int cgroupCnt = pbcservice.ifhasReply(pbcid);
					System.out.println("pbcid"+pbcid);
					System.out.println("cgroupCnt "+cgroupCnt);				
					String toWhom=pbcservice.gettoWhom(pbcid);
					commentlist.get(i).setToWhom(toWhom);
				}
			}
			int undeletedCommentCnt = pbcservice.getCommentCnt(pbidnum);
			
			model.addAttribute("commentCnt", undeletedCommentCnt);
			model.addAttribute("commentlist", commentlist);
			model.addAttribute("langlist", langlist);
			model.addAttribute("pbook", pbook);
			return "publicbook/content_view";
		}else {
			
			return "publicbook/content_view_del";
		}
		
	}
	
	@RequestMapping(value="commentView")
	public String commentView(String pbcid, Model model) {
		PBComment comment= pbcservice.getComment(Integer.parseInt(pbcid));
		int pbid=comment.getPbid();		
		PublicQBook pbook= pbservice.getPB(pbid);
		if(pbook.getPbdel()==0) {
			pbservice.upHit(pbid);
			ArrayList<Langlist> langlist= (ArrayList<Langlist>) pbservice.getlanglist();
			ArrayList<PBComment> commentlist = (ArrayList<PBComment>) pbcservice.getComments(pbid);
			for(int i=0;i<commentlist.size();i++) {
				if(commentlist.get(i).getCindent()==0) {
					int pbcid2 =commentlist.get(i).getPbcid();
					int cgroupCnt = pbcservice.ifhasReply(pbcid2)-1;
					commentlist.get(i).setCgroupCnt(cgroupCnt);
				}else if(commentlist.get(i).getCindent()==1) {
					int pbcid2=commentlist.get(i).getPbcid();
					String toWhom=pbcservice.gettoWhom(pbcid2);
					commentlist.get(i).setToWhom(toWhom);
				}
			}
			int undeletedCommentCnt = pbcservice.getCommentCnt(pbid);
			
			model.addAttribute("commentCnt", undeletedCommentCnt);
			model.addAttribute("commentlist", commentlist);
			model.addAttribute("langlist", langlist);
			model.addAttribute("pbook", pbook);		
			return "publicbook/content_view";			
		}else {
			
			return "publicbook/content_view_del";
		}
		
	}
	
	@RequestMapping(value="like")
	public String like(int pbid, HttpSession session, Model model) {
		int result=0;
		int result1=0;
		int result2=0;
		result1=pbservice.like(pbid);
		String mid = (String) session.getAttribute("mid");
		PublicQBook like= new PublicQBook();
		like.setMid(mid);
		like.setPbid(pbid);
		//System.out.println("this is like.do "+like);		
		result2= pbservice.insertLike(like);
		
		PublicQBook thePB = pbservice.getPB(pbid); //giving point to the writer
		String writerMid= thePB.getMid();
		int uppoint = 10;
		Members member = new Members();
		member.setMid(writerMid);
		member.setMpoint(uppoint);
		
		if(result1==1 && result2==1) {
			result=1;
			memberservice.pointUp(member);
			Alarm likealarm=new Alarm(writerMid, pbid, 0, memberservice.getMember2(mid).getMname(),memberservice.getMember2(mid).getMphoto(), "LikedYourPost");
			alarmservice.insertAlarm(likealarm);
		}
		model.addAttribute("likeResult",result);
		return "publicbook/resultAjax";
	}
	
	@RequestMapping(value="unlike")
	public String unlike(int pbid, HttpSession session, Model model) {
		int result=0;
		int result1=0;
		int result2=0;
		result1=pbservice.unlike(pbid);
		String mid = (String) session.getAttribute("mid");
		PublicQBook like= new PublicQBook();
		like.setMid(mid);
		like.setPbid(pbid);
		
		//System.out.println("this is unlike.do "+like);
		result2= pbservice.deleteLike(like);
		
		PublicQBook thePB = pbservice.getPB(pbid); //taking point from the writer
		String writerMid= thePB.getMid();
		int uppoint = -10;
		Members member = new Members();
		member.setMid(writerMid);
		member.setMpoint(uppoint);
		
		if(result1==1 && result2==1) {
			result=1;
			memberservice.pointUp(member);
		}
		model.addAttribute("unlikeResult",result);		
		return "publicbook/resultAjax";
	}
	
	@RequestMapping(value="checkifliked")
	public String checkifliked(PublicQBook like, Model model) {
		int result = pbservice.ifliked(like);
		//System.out.println(like);
		model.addAttribute("alreadyLiked", result);
		return "publicbook/resultAjax";
	}
	
	@RequestMapping(value="searchPB")
	public  String searchPB(String keyword, int cate, Model model, String pageNum) {		
		PublicQBook searchPB = new PublicQBook();
		ArrayList<PublicQBook> searchedPBlist= new ArrayList<>();		
		int resultCnt=0;
		if(cate==1) {
			resultCnt=pbservice.searchPBtitleCnt(keyword);
			MySqlPaging paging = new MySqlPaging(resultCnt,pageNum,5);
			searchPB.setPbtitle(keyword);
			searchPB.setStartRow(paging.getStartRow());
			searchPB.setPageSize(paging.getPageSize());
			searchedPBlist= (ArrayList<PublicQBook>) pbservice.searchPBtitle(searchPB);
			model.addAttribute("paging", paging);
		}else if(cate==2) {
			resultCnt=pbservice.searchPBquoteCnt(keyword);
			MySqlPaging paging = new MySqlPaging(resultCnt,pageNum,5);
			searchPB.setMqquote(keyword);
			searchPB.setStartRow(paging.getStartRow());
			searchPB.setPageSize(paging.getPageSize());
			searchedPBlist= (ArrayList<PublicQBook>) pbservice.searchPBquote(searchPB);
			model.addAttribute("paging", paging);
		}else if(cate==3) {
			resultCnt=pbservice.searchPBcontentCnt(keyword);
			MySqlPaging paging = new MySqlPaging(resultCnt,pageNum,5);
			searchPB.setPbcontent(keyword);
			searchPB.setStartRow(paging.getStartRow());
			searchPB.setPageSize(paging.getPageSize());
			searchedPBlist= (ArrayList<PublicQBook>) pbservice.searchPBcontent(searchPB);
			model.addAttribute("paging", paging);
		}else if(cate==4) {
			resultCnt=pbservice.searchPBnameCnt(keyword);
			MySqlPaging paging = new MySqlPaging(resultCnt,pageNum,5);
			searchPB.setMname(keyword);
			searchPB.setStartRow(paging.getStartRow());
			searchPB.setPageSize(paging.getPageSize());
			searchedPBlist= (ArrayList<PublicQBook>) pbservice.searchPBname(searchPB);
			model.addAttribute("paging", paging);
		}			
		model.addAttribute("langlist", pbservice.getlanglist());
		model.addAttribute("cate", cate);
		model.addAttribute("keyword", keyword);
		model.addAttribute("resultCnt", resultCnt);
		model.addAttribute("searchedlist", searchedPBlist);
		return "publicbook/searchResult";
	}
	
	@RequestMapping(value="memberProfileView")
	public String memberprofileView(Model model, String mid, HttpSession session) {
		Members profilemember = memberservice.getMember2(mid);
		profilemember.setHeartCnt(rankingservice.getmyHeartCnt(mid));
		profilemember.setQuoteCnt(myqbookservice.getmyQCnt(mid));
		profilemember.setPostCnt(pbservice.getmyPBCnt(mid));
		PublicQBook midstartRow = new PublicQBook();
		midstartRow.setMid(mid);
		midstartRow.setStartRow(0);
		ArrayList<PublicQBook> memberPBlist = (ArrayList<PublicQBook>) pbservice.getmyPBlist(midstartRow);
		ArrayList<PBComment> memberheartComments= (ArrayList<PBComment>) pbcservice.getmyheartComments(midstartRow);
		
		String visitor = (String) session.getAttribute("mid");
		Alarm visitAlarm = new Alarm(mid, 0, 0, memberservice.getMember2(visitor).getMname(), memberservice.getMember2(visitor).getMphoto(), "VisitedYourPage");
		alarmservice.insertAlarm(visitAlarm);
		
		model.addAttribute("memberpost", memberPBlist);
		model.addAttribute("memberheartComments", memberheartComments);
		model.addAttribute("member", profilemember);
		model.addAttribute("langlist", pbservice.getlanglist());
		
		return "publicbook/memberprofile";
	}
	
	@RequestMapping(value="deletePB")
	public String deletePB(Model model, int pbid) {
		int result = pbservice.deletePB(pbid);
		if(result==1) {
			model.addAttribute("deletePBresult", result);
		}
		return "publicbook/resultAjax";
	}
	
	@RequestMapping(value="editPBView")
	public String editPBView(Model model, String mqid, int pbid) {
		//MyQBook quote = myqbookservice.getQuote(Integer.parseInt(mqid));
		//System.out.println("quote "+quote);
		PublicQBook pbook = pbservice.getPB(pbid);
		String pbcontent= pbook.getPbcontent();
		pbcontent=pbcontent.replace("<br>", "\n");
	
		pbook.setPbcontent(pbcontent);
		//model.addAttribute("quote", quote);
		model.addAttribute("pbook", pbook);
		return "publicbook/pbook_edit";
	}
	
	@RequestMapping(value="editPB")
	public String editPB(PublicQBook modifiedPB, HttpSession session) {
		String pbcontent = modifiedPB.getPbcontent();
		pbcontent = pbcontent.replace("\n", "<br>");
		pbcontent=pbcontent.replace("\"", "'");
		modifiedPB.setPbcontent(pbcontent);
		int result = pbservice.modifyPB(modifiedPB);
		if(result==1) {
			
		}		
		return "redirect:contentView.do?pbid="+modifiedPB.getPbid();
	}
	
	@RequestMapping(value="guide")
	public String guide() {
		return "guide/guideMain";
	}
}
