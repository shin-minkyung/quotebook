package com.smk.quotebook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smk.quotebook.dao.RankingsDao;
import com.smk.quotebook.model.Rankings;

@Service
public class RankingsServiceImpl implements RankingsService{
	@Autowired
	private RankingsDao rankingsdao;
	
	@Override
	public List<Rankings> top5() {
		// TODO Auto-generated method stub
		return rankingsdao.top5();
	}

	@Override
	public int getmyHeartCnt(String mid) {
		// TODO Auto-generated method stub
		return rankingsdao.getmyHeartCnt(mid);
	}

}
