package com.smk.quotebook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smk.quotebook.dao.AlarmDao;
import com.smk.quotebook.model.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{
	@Autowired
	private AlarmDao alarmdao;

	@Override
	public List<Alarm> getmyAlarm(String mid) {
		// TODO Auto-generated method stub
		return alarmdao.getmyAlarm(mid);
	}

	@Override
	public int insertPBalarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return alarmdao.insertPBalarm(alarm);
	}

	@Override
	public int insertPBCalarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return alarmdao.insertPBCalarm(alarm);
	}

	@Override
	public int insertHeartalarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return alarmdao.insertHeartalarm(alarm);
	}

	@Override
	public int insertAlarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return alarmdao.insertAlarm(alarm);
	}

	@Override
	public int checkAlarm(int alid) {
		// TODO Auto-generated method stub
		return alarmdao.checkAlarm(alid);
	}

	@Override
	public int getAlarmCnt(String mid) {
		// TODO Auto-generated method stub
		return alarmdao.getAlarmCnt(mid);
	}

	@Override
	public List<Alarm> getmyAlarmHistory(Alarm midstartRow) {
		// TODO Auto-generated method stub
		return alarmdao.getmyAlarmHistory(midstartRow);
	}

	@Override
	public int getAlarmHistoryCnt(String mid) {
		// TODO Auto-generated method stub
		return alarmdao.getAlarmHistoryCnt(mid);
	}
	
	
}
