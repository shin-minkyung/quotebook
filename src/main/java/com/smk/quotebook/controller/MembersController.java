package com.smk.quotebook.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.smk.quotebook.model.Alarm;
import com.smk.quotebook.model.Langlist;
import com.smk.quotebook.model.Members;
import com.smk.quotebook.model.Message;
import com.smk.quotebook.model.MyQBook;
import com.smk.quotebook.model.PBComment;
import com.smk.quotebook.model.PublicQBook;
import com.smk.quotebook.model.Rankings;
import com.smk.quotebook.service.AlarmService;
import com.smk.quotebook.service.MembersService;
import com.smk.quotebook.service.MessageService;
import com.smk.quotebook.service.MyQBookService;
import com.smk.quotebook.service.MySqlPaging;
import com.smk.quotebook.service.PBCommentService;
import com.smk.quotebook.service.PublicQBookService;
import com.smk.quotebook.service.RankingsService;

@Controller
public class MembersController {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MembersService mService;
	@Autowired
	private PublicQBookService pbservice;
	@Autowired
	private MyQBookService myqbookservice;
	@Autowired
	private PBCommentService pbcservice;
	@Autowired
	private RankingsService rankingservice;
	@Autowired
	private MessageService msgservice;
	@Autowired
	private AlarmService alarmservice;
	
	@RequestMapping(value="joinView")
	public String joinView() {		
		return "member/join";
	}	
	@RequestMapping(value="idChk")
	public String idChk(String mId, Model model) {
		int result = mService.idChk(mId);
		model.addAttribute("idChk", result);
		return "member/confirmResult";
	}
	@RequestMapping(value="nameChk")
	public String nameChk(String mName, Model model) {
		int result = mService.nameChk(mName);
		model.addAttribute("nameChk", result);
		return "member/confirmResult";
	}
	@RequestMapping(value="confirmRequest")
	public String sendMail(String mId, Model model) throws FileNotFoundException, URISyntaxException {
		 try{		
		/*  final int randomNum = (int)((Math.random()*899999)+100000);
		  final String numCode = String.valueOf(randomNum);
		  char ch1 = (char) ((Math.random() * 26) + 65);
		  char ch2 = (char) ((Math.random() * 26) + 65);
		  String code =ch1+""+ch2+numCode;	too simple*/
			 String  code = "";
			 StringBuffer sb = new StringBuffer();
			 StringBuffer sc = new StringBuffer("!@#$%^&*-=?~");  
			 sb.append((char)((Math.random() * 26)+65)); 
			 for( int i = 0; i<3; i++) {
			    sb.append((char)((Math.random() * 26)+65)); 
			 } 
			 for( int i = 0; i<4; i++) {
			     sb.append((char)((Math.random() * 26)+97));
			 }  
			 for( int i = 0; i<2; i++) {
			     sb.append((char)((Math.random() * 10)+48));
			 }
			 sb.setCharAt(((int)(Math.random()*3)+1), sc.charAt((int)(Math.random()*sc.length()-1))); //대문자3개중 하나   
			 sb.setCharAt(((int)(Math.random()*4)+4), sc.charAt((int)(Math.random()*sc.length()-1))); //소문자4개중 하나
			 code = sb.toString();	 
		  System.out.println("The Code ("+code+") has sent to "+mId);
		  String mailText="E-mail Validation Code from Quotebook.com: "+code;
		  String from ="choryon2@gmail.com";
		  String subject ="The Validation Code You Requested";		
		  SimpleMailMessage message = new SimpleMailMessage();		
		  message.setFrom(from);		
		  message.setTo(mId);		
		  message.setSubject(subject);		
		  message.setText(mailText);		
		  mailSender.send(message);
		  model.addAttribute("code", code);
		 }catch(Exception e){
		  e.printStackTrace();
		 }		 
		 return "member/confirmResult";
	}
	
	@RequestMapping(value="join")
	public String join(MultipartHttpServletRequest mRequest) {
		int joinResult=mService.memberInsert(mRequest);
		return "redirect:main.do?joinResult="+joinResult;
	}
	
		
	@RequestMapping(value="loginChk")
	public String loginChk(Members loginmember, Model model) {
		int result=mService.loginChk(loginmember);
		model.addAttribute("loginChk", result);
		return "member/confirmResult";
	}
	
	@RequestMapping(value="login")
	public String login(Members member, Model model, HttpSession session) {
		System.out.println("member in login.do: "+member);
		System.out.println("mid:"+member.getMid());
		Members loginmember = mService.getMember2(member.getMid());	
		System.out.println("loginmember "+loginmember);
		session.setAttribute("mlevel", loginmember.getMlevel());
		session.setAttribute("mid", loginmember.getMid());
		session.setAttribute("mpw", loginmember.getMpw());
		session.setAttribute("mname", loginmember.getMname());
		session.setAttribute("mphoto", loginmember.getMphoto());				
		session.setAttribute("loginmember", loginmember);	
		return "redirect:memberMain.do";
	}
	
	@RequestMapping(value="memberMain")
	public String memberMain(HttpSession session, Model model) {
		if(session.getAttribute("mid")==null) {
			return "redirect:main.do";
		}
		PublicQBook toppbook = new PublicQBook();
		ArrayList<Langlist> langlist= (ArrayList<Langlist>) pbservice.getlanglist();
		ArrayList<ArrayList<PublicQBook>> topreadlist = new ArrayList<>();
		ArrayList<ArrayList<PublicQBook>> topnewlist = new ArrayList<>();
		topreadlist=getoplists("pop");
		topnewlist=getoplists("new");
		Members loginmember= getMemberInfo(session);
		String mid = loginmember.getMid();
		loginmember.setPostCnt(pbservice.getmyPBCnt(mid));
		//level infomation is directly from DB
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
		
		//my recent 10 quotes
		ArrayList<MyQBook> myrecent10Q= (ArrayList<MyQBook>) myqbookservice.getmyrecent10Q(mid);
		ArrayList<Rankings> top5=(ArrayList<Rankings>) rankingservice.top5();
		for(int i=0; i<top5.size(); i++) {
			String mid_ranking = top5.get(i).getMid();
			int quoteCnt = myqbookservice.getmyQCnt(mid_ranking);
			int heartCnt = rankingservice.getmyHeartCnt(mid_ranking);
			top5.get(i).setQuoteCnt(quoteCnt);
			top5.get(i).setHeartCnt(heartCnt);			
		}		
		model.addAttribute("top5", top5);		
		model.addAttribute("mynew10Q", myrecent10Q);
		model.addAttribute("new3", topnewlist);
		model.addAttribute("pop3", topreadlist);
		model.addAttribute("langlist", langlist);
		model.addAttribute("myQCnt", myqbookservice.getmyQCnt(loginmember.getMid()));
		model.addAttribute("loginmember", loginmember);	
		return "main/main_member";
	}
	public ArrayList<ArrayList<PublicQBook>> getoplists(String type){
		PublicQBook toppbook = new PublicQBook();
		ArrayList<Langlist> langlist= (ArrayList<Langlist>) pbservice.getlanglist();
		ArrayList<ArrayList<PublicQBook>> toplist = new ArrayList<>();
		ArrayList<PublicQBook> toplist_lang = new ArrayList<>();
		for(int i=0; i<langlist.size(); i++) {
			toppbook.setMqlang(langlist.get(i).getLname());
			toppbook.setStartRow(0);
			toppbook.setPageSize(3);			
			if(type=="pop") {
				toplist_lang = (ArrayList<PublicQBook>) pbservice.getMostRead3list(toppbook);
			}else if(type=="new") {
				toplist_lang = (ArrayList<PublicQBook>) pbservice.getMostRecent3list(toppbook);
			}
			toplist.add(toplist_lang);			
		}		
		return toplist;
	}
	
	
	public Members getMemberInfo(HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		Members loginmember = mService.getMember2(mid);
		int mpoint = loginmember.getMpoint();
		int mllowp = loginmember.getMllowp();
		int mlhighp = loginmember.getMlhighp();
		double progress = ((mpoint-mllowp)*100)/mlhighp;		
		loginmember.setProgress(progress);
		/*System.out.println("mpoint"+mpoint);
		System.out.println("mllowp"+mllowp);
		System.out.println("mlhighp"+mlhighp);
		System.out.println("progress"+progress);*/
		return loginmember;
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
	
	@RequestMapping(value="editprofile")
	public String editprofile(HttpSession session, Model model) {
		Members loginmember= getMemberInfo(session);
		model.addAttribute("loginmember", loginmember);
		return "member/editprofile";
	}
	
	@RequestMapping(value="settings")
	public String settings() {
		return "member/settings";
	}
	
	@RequestMapping(value="myprofile")
	public String myprofile(HttpSession session, Model model) {
		Members loginmember= getMemberInfo(session);
		String mid=loginmember.getMid();
		loginmember.setHeartCnt(rankingservice.getmyHeartCnt(mid));
		loginmember.setQuoteCnt(myqbookservice.getmyQCnt(mid));
		loginmember.setPostCnt(pbservice.getmyPBCnt(mid));
		
		PublicQBook midstartRow = new PublicQBook();
		midstartRow.setMid(mid);
		midstartRow.setStartRow(0);
		ArrayList<PublicQBook> myposts = (ArrayList<PublicQBook>) pbservice.getmyPBlist(midstartRow);
		ArrayList<PBComment> mycomments = (ArrayList<PBComment>) pbcservice.getmyComments(midstartRow);
		ArrayList<PublicQBook> ilikedposts = (ArrayList<PublicQBook>) pbservice.getIlikedlist(midstartRow);
		
		model.addAttribute("myposts", myposts);
		model.addAttribute("mycomments", mycomments);
		model.addAttribute("ilikedposts", ilikedposts);
		model.addAttribute("loginmember", loginmember);		
		return "member/myprofile";
	}
	
	@RequestMapping(value="mypost")
	public String mypost(HttpSession session, Model model, int startRow) {
		String mid = (String) session.getAttribute("mid");
		PublicQBook midstartRow = new PublicQBook();
		midstartRow.setMid(mid);
		midstartRow.setStartRow(startRow);
		ArrayList<PublicQBook> myposts = (ArrayList<PublicQBook>) pbservice.getmyPBlist(midstartRow);
		model.addAttribute("postlist", myposts);
		return "member/mypost";
	}	
	
	@RequestMapping(value="mycomment")
	public String mycomment(HttpSession session, Model model, int startRow) {
		String mid = (String) session.getAttribute("mid");
		PublicQBook midstartRow = new PublicQBook();
		midstartRow.setMid(mid);
		midstartRow.setStartRow(startRow);
		ArrayList<PBComment> mycomment = (ArrayList<PBComment>) pbcservice.getmyComments(midstartRow);
		model.addAttribute("mycomment", mycomment);
		return "member/mycomment";
	}
	
	@RequestMapping(value="ilikedpost")
	public String ilikedpost(HttpSession session, Model model, int startRow) {
		String mid = (String) session.getAttribute("mid");
		PublicQBook midstartRow = new PublicQBook();
		midstartRow.setMid(mid);
		midstartRow.setStartRow(startRow);
		ArrayList<PublicQBook> ilikedpost = (ArrayList<PublicQBook>) pbservice.getIlikedlist(midstartRow);
		model.addAttribute("postlist", ilikedpost);
		return "member/mypost";
	}
	
	@RequestMapping(value="msgView")
	public String msgView(HttpSession session, Model model, String pageNum, String tome) {	
		String mid = (String) session.getAttribute("mid");
		ArrayList<Message> msgIgot = new ArrayList<>();
		ArrayList<Message> msgIsent = new ArrayList<>();
		Message midstartRow1= new Message();
		midstartRow1.setMsgto(mid);	
		int msgIgotCnt = msgservice.getMsgIgotCnt(mid);
		
		Message midstartRow2 = new Message();
		midstartRow2.setMsgfrom(mid);
		int msgIsentCnt = msgservice.getMsgIsentCnt(mid);
		
		System.out.println("tome :"+tome);
		System.out.println("pageNum "+pageNum);
		if(pageNum==null) {	
			System.out.println("pageNum "+pageNum);
			MySqlPaging paging1 = new MySqlPaging(msgIgotCnt, pageNum, 3);
			midstartRow1.setStartRow(paging1.getStartRow());
			msgIgot= (ArrayList<Message>) msgservice.getMsgIgot(midstartRow1);
			
			MySqlPaging paging2 = new MySqlPaging(msgIsentCnt, "1", 3);
			midstartRow2.setStartRow(paging2.getStartRow());
			msgIsent = (ArrayList<Message>) msgservice.getMsgIsent(midstartRow2);
			
			model.addAttribute("paging1", paging1);
			model.addAttribute("paging2", paging2);
		}else {
			if(tome=="1" || tome.equals("1")) {
				System.out.println("tome=1");
				MySqlPaging paging1 = new MySqlPaging(msgIgotCnt, pageNum, 3);
				midstartRow1.setStartRow(paging1.getStartRow());
				msgIgot= (ArrayList<Message>) msgservice.getMsgIgot(midstartRow1);
			
				MySqlPaging paging2 = new MySqlPaging(msgIsentCnt, "1", 3);
				midstartRow2.setStartRow(paging2.getStartRow());
				msgIsent = (ArrayList<Message>) msgservice.getMsgIsent(midstartRow2);
				
				model.addAttribute("paging1", paging1);
				model.addAttribute("paging2", paging2);
			}else if(tome=="0" || tome.equals("0")) {
				System.out.println("tome=0");
				MySqlPaging paging1 = new MySqlPaging(msgIgotCnt, "1", 3);
				midstartRow1.setStartRow(paging1.getStartRow());
				msgIgot= (ArrayList<Message>) msgservice.getMsgIgot(midstartRow1);
				
				MySqlPaging paging2 = new MySqlPaging(msgIsentCnt, pageNum, 3);
				midstartRow2.setStartRow(paging2.getStartRow());
				msgIsent = (ArrayList<Message>) msgservice.getMsgIsent(midstartRow2);
				
				model.addAttribute("paging1", paging1);
				model.addAttribute("paging2", paging2);
			}
			
		}		
		
		model.addAttribute("tome", tome);
		model.addAttribute("msgIgotCnt", msgIgotCnt);
		model.addAttribute("msgIgot", msgIgot);
		model.addAttribute("msgIsent", msgIsent);		
		return "member/messageView";
	}
	
	@RequestMapping(value="sendMsg")
	public String sendMsg(Message msg, Model model) {
		//System.out.println("msg "+msg);
		String msgcontent = msg.getMsgcontent();
		msgcontent = msgcontent.replace("\n", "<br>");
		msg.setMsgcontent(msgcontent);
		int result = msgservice.insertMsg(msg);
		if(result==1) {
			int msgid=msgservice.getMaxMsgid();
			String msgfrom = msg.getMsgfrom();
			String msgto = msg.getMsgto();
			Alarm msgalarm= new Alarm(msgto,0,msgid, mService.getMember2(msgfrom).getMname(), mService.getMember2(msgfrom).getMphoto(),"MsgReceived");
			alarmservice.insertAlarm(msgalarm);
		}
		model.addAttribute("sendResult", result);
		return "redirect:msgView.do";
	}
	
	@RequestMapping(value="msgtomeContentView")
	public String msgContentView1(int msgid, Model model) {
		Message msg = msgservice.theMsgIgot(msgid);
		msgservice.msgChecked(msgid);
		model.addAttribute("msg", msg);
		model.addAttribute("tome", 1);
		return "member/messageDetail";
	}
	@RequestMapping(value="msgfrommeContentView")
	public String msgContentView2(int msgid, Model model) {
		Message msg = msgservice.theMsgIsent(msgid);
		model.addAttribute("msg", msg);
		model.addAttribute("tome", 0);
		return "member/messageDetail";
	}
	
	@RequestMapping(value="modifyMember")
	public String modifyMember(MultipartHttpServletRequest mRequest, HttpSession session) {		
		int result = mService.memberModify(mRequest);
		Members modifiedmember= getMemberInfo(session);
		if(result==1) {
			session.setAttribute("mphoto",modifiedmember.getMphoto());
			session.setAttribute("aboutme", modifiedmember.getAboutme());
		}
		System.out.println("modifyResult "+result);

		return "redirect:editprofile.do?modifyResult="+result;
	}
	
	@RequestMapping(value="changePw")
	public String changePw(Members member, HttpSession session) {
		System.out.println("member "+member);
		int result=mService.updateMpw(member);
		if(result==1) {
			session.setAttribute("mpw", member.getMpw());
		}
		return "redirect:settings.do?modifyResult="+result;
	}		
	
	@RequestMapping(value="drop")
	public String drop(Members member, HttpSession session) {		
		//System.out.println("mid "+member.getMid());
		//System.out.println("mphoto "+member.getMphoto());
		int result=mService.updateMdrop(member.getMid());
		int deletePhotoResult=mService.deleteMphoto(member.getMphoto());
		System.out.println("photo delete result "+deletePhotoResult);
		session.invalidate();
		
		return "redirect:main.do?dropResult="+result;
		//return "redirect:settings.do";
	}
}

















