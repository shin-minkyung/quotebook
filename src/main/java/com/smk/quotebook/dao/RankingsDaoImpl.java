package com.smk.quotebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smk.quotebook.model.Rankings;

@Repository
public class RankingsDaoImpl implements RankingsDao{
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public List<Rankings> top5() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("top5members");
	}

	@Override
	public int getmyHeartCnt(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getmyHeartCnt", mid);
	}

}
