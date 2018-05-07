package com.smk.quotebook.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smk.quotebook.model.Alarm;
import com.smk.quotebook.model.Members;
import com.smk.quotebook.model.PBComment;
import com.smk.quotebook.model.PublicQBook;
import com.smk.quotebook.service.AlarmService;
import com.smk.quotebook.service.MembersService;
import com.smk.quotebook.service.PBCommentService;
import com.smk.quotebook.service.PublicQBookService;

@Controller
public class PBCommentController {
	@Autowired
	private PBCommentService pbcservice;
	@Autowired
	private MembersService memberservice;
	@Autowired
	private PublicQBookService pbservice;
	@Autowired
	private AlarmService alarmservice;
	
	@RequestMapping(value="insertStep0")
	public String insertStep0(PBComment step0comment, Model model, HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		int uppoint = 3;
		Members member = new Members();
		member.setMid(mid);
		member.setMpoint(uppoint);
		
		int insertResult=0;
		System.out.println("step0comment "+step0comment);
		String pbccontent = step0comment.getPbccontent();
		pbccontent= pbccontent.replace("\n", "<br>");
		pbccontent=pbccontent.replace("\"", "'");
		step0comment.setPbccontent(pbccontent);
		insertResult= pbcservice.insertStep0(step0comment);
		if(insertResult==1) {
			memberservice.pointUp(member);
			//alarm insert to pb writer
			int last_pbcid=pbcservice.getMaxPbcid();
			PublicQBook pb= pbservice.getPB(step0comment.getPbid());
			Alarm pbalarm=new Alarm();
			pbalarm.setMid(pb.getMid());
			pbalarm.setMyid(pb.getPbid());
			pbalarm.setChkname(step0comment.getMname());
			pbalarm.setChkphoto(step0comment.getMphoto());
			pbalarm.setChkid(last_pbcid);
			alarmservice.insertPBalarm(pbalarm);
		}		
		model.addAttribute("insertResult", insertResult);
		return "publicbook/resultAjax";
	}
	
	@RequestMapping(value="insertStep1")
	public String insertStep1(PBComment step1comment, Model model, HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		int uppoint = 3;
		Members member = new Members();
		member.setMid(mid);
		member.setMpoint(uppoint);
		
		int insertResult=0;
		System.out.println("step1comment "+step1comment);
		String pbccontent = step1comment.getPbccontent();
		pbccontent= pbccontent.replace("\n", "<br>");
		pbccontent=pbccontent.replace("\"", "'");
		step1comment.setPbccontent(pbccontent);
		insertResult= pbcservice.insertStep1(step1comment);	
		if(insertResult==1) {
			memberservice.pointUp(member);
			int last_pbcid=pbcservice.getMaxPbcid();
			int rcid=step1comment.getRcid();
			PublicQBook pb = pbservice.getPB(step1comment.getPbid());
			String rcid_writer = pbcservice.getCommentWriter(rcid);
			Alarm pbalarm= new Alarm(pb.getMid(), pb.getPbid(), last_pbcid, step1comment.getMname(),step1comment.getMphoto());
			Alarm pbcalarm= new Alarm(rcid_writer, rcid, last_pbcid, step1comment.getMname(), step1comment.getMphoto());
			alarmservice.insertPBalarm(pbalarm);
			alarmservice.insertPBCalarm(pbcalarm);			
		}		
		model.addAttribute("insertResult", insertResult);
		return "publicbook/resultAjax";
	}
	
	@RequestMapping(value="editComment")
	public String editComment(PBComment modifiedComment, Model model) {
		int result=0;
		//System.out.println("modifiedComment: "+modifiedComment);
		String pbccontent = modifiedComment.getPbccontent();
		pbccontent= pbccontent.replace("\n", "<br>");
		pbccontent=pbccontent.replace("\"", "'");
		modifiedComment.setPbccontent(pbccontent);
		result=pbcservice.modifyComment(modifiedComment);
		
		model.addAttribute("modifyResult", result);
		return "publicbook/resultAjax";
	}
	
	@RequestMapping(value="deleteComment")
	public String deleteComment(int pbcid, Model model, HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		int uppoint = -1;
		Members member = new Members();
		member.setMid(mid);
		member.setMpoint(uppoint);
		
		int result=0;
		result = pbcservice.deleteComment(pbcid);
		if(result==1) {
			memberservice.pointUp(member);
		}
		model.addAttribute("deleteResult", result);
		return "publicbook/resultAjax";
	}
	
	@RequestMapping(value="giveHeart")
	public String giveHeart(int pbcid, Model model) {
		int result=0;
		
		String pbcidWriter = pbcservice.getCommentWriter(pbcid);
		int uppoint = 100;
		Members member = new Members();
		member.setMid(pbcidWriter);
		member.setMpoint(uppoint);
		
		result=pbcservice.giveHeart(pbcid);
		if(result==1) {
			memberservice.pointUp(member);
			int pbid=pbcservice.getComment(pbcid).getPbid();
			Alarm heartalarm= new Alarm(pbcidWriter, pbcid, pbid, pbservice.getPB(pbid).getMname(), pbservice.getPB(pbid).getMphoto(),"giveHeart");
			alarmservice.insertHeartalarm(heartalarm);
		}		
		model.addAttribute("heartResult", result);
		return "publicbook/resultAjax";
	}
	
	@RequestMapping(value="takeHeart")
	public String takeHeart(int pbcid, Model model) {
		int result=0;
		String pbcidWriter = pbcservice.getCommentWriter(pbcid);
		int uppoint = -100;
		Members member = new Members();
		member.setMid(pbcidWriter);
		member.setMpoint(uppoint);
		result=pbcservice.takeHeart(pbcid);
		if(result==1) {
			memberservice.pointUp(member);
			int mpoint = memberservice.getMember2(pbcidWriter).getMpoint();
			if(mpoint<0) {
				memberservice.setPoint0(pbcidWriter);
			}
			int pbid=pbcservice.getComment(pbcid).getPbid();
			Alarm heartalarm= new Alarm(pbcidWriter, pbcid, pbid, pbservice.getPB(pbid).getMname(), pbservice.getPB(pbid).getMphoto(),"takeHeart");
			alarmservice.insertHeartalarm(heartalarm);
		}	
		model.addAttribute("heartResult", result);
		return "publicbook/resultAjax";
	}
	
}
