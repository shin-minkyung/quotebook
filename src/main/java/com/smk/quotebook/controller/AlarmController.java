package com.smk.quotebook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smk.quotebook.model.Alarm;
import com.smk.quotebook.service.AlarmService;
import com.smk.quotebook.service.MySqlPaging;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService alarmservice;
	
	@RequestMapping(value="getAlarmList")
	public String getAlarm(String mid, Model model) {
		ArrayList<Alarm> alarmlist=(ArrayList<Alarm>) alarmservice.getmyAlarm(mid);
		
		model.addAttribute("alarmlist", alarmlist);	
		return "main/alarmView";
	}
	
	@RequestMapping(value="getAlarmCnt")
	public String getAlarmCnt(String mid, Model model) {
		int alarmCnt=alarmservice.getAlarmCnt(mid);
		model.addAttribute("alarmCnt", alarmCnt);
		return "main/alarmCnt";
	}
	
	@RequestMapping(value="chkAlarm")
	public String chkAlarm(int alid, Model model) {
		int result = alarmservice.checkAlarm(alid);
		model.addAttribute("chkAlarm", result);
		return "main/alarmCnt";
	}
	
	@RequestMapping(value="alarmHistory")
	public String alarmHistory(HttpSession session, Model model, String pageNum) {
		String mid = (String) session.getAttribute("mid");
		int alarmHistoryCnt= alarmservice.getAlarmHistoryCnt(mid);
		Alarm midstartRow= new Alarm();
		midstartRow.setMid(mid);
		MySqlPaging paging = new MySqlPaging(alarmHistoryCnt, pageNum, 10);
		midstartRow.setStartRow(paging.getStartRow());
		midstartRow.setPageSize(10);
		ArrayList<Alarm> alarmlist=(ArrayList<Alarm>) alarmservice.getmyAlarmHistory(midstartRow);
		model.addAttribute("alarmlist", alarmlist);
		model.addAttribute("paging", paging);
		return "member/alarmlist";
	}
	
}
