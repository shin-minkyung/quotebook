package com.smk.quotebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smk.quotebook.model.Alarm;

@Repository
public class AlarmDaoImpl implements AlarmDao{
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public List<Alarm> getmyAlarm(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getmyAlarm", mid);
	}

	@Override
	public int insertPBalarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertPBalarm", alarm);
	}

	@Override
	public int insertPBCalarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertPBCalarm", alarm);
	}

	@Override
	public int insertHeartalarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertHeartalarm", alarm);
	}

	@Override
	public int insertAlarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertAlarm", alarm);
	}

	@Override
	public int checkAlarm(int alid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("checkAlarm", alid);
	}

	@Override
	public int getAlarmCnt(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getAlarmCnt", mid);
	}

	@Override
	public List<Alarm> getmyAlarmHistory(Alarm midstartRow) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getmyAlarmHistory", midstartRow);
	}

	@Override
	public int getAlarmHistoryCnt(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getAlarmHistoryCnt", mid);
	}
	
	

}
