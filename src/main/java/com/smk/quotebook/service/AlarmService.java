package com.smk.quotebook.service;

import java.util.List;

import com.smk.quotebook.model.Alarm;

public interface AlarmService {
	public List<Alarm> getmyAlarm(String mid);
	public int insertPBalarm(Alarm alarm);
	public int insertPBCalarm(Alarm alarm);
	public int insertHeartalarm(Alarm alarm);
	public int insertAlarm(Alarm alarm);
	public int checkAlarm(int alid);
	public int getAlarmCnt(String mid);
	public List<Alarm> getmyAlarmHistory(Alarm midstartRow);
	public int getAlarmHistoryCnt(String mid);
}
