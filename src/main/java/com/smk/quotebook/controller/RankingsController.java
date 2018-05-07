package com.smk.quotebook.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smk.quotebook.model.Rankings;
import com.smk.quotebook.service.MembersService;
import com.smk.quotebook.service.MyQBookService;
import com.smk.quotebook.service.PBCommentService;
import com.smk.quotebook.service.RankingsService;

@Controller
public class RankingsController {
	@Autowired
	private MembersService memberservice;
	@Autowired
	private PBCommentService pbcservice;
	@Autowired
	private MyQBookService myqbookservice;
	@Autowired
	private RankingsService rankingservice;
	
	@RequestMapping(value="rankings")
	public String rankingView(Model model) {
		ArrayList<Rankings> top5=(ArrayList<Rankings>) rankingservice.top5();
		for(int i=0; i<top5.size(); i++) {
			String mid = top5.get(i).getMid();
			int quoteCnt = myqbookservice.getmyQCnt(mid);
			int heartCnt = rankingservice.getmyHeartCnt(mid);
			top5.get(i).setQuoteCnt(quoteCnt);
			top5.get(i).setHeartCnt(heartCnt);			
		}
		
		model.addAttribute("top5", top5);
		return "member/rankings";
	}
	
}
