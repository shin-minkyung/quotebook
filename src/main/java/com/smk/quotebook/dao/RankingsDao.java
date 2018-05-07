package com.smk.quotebook.dao;

import java.util.List;

import com.smk.quotebook.model.Rankings;

public interface RankingsDao {
	public List<Rankings> top5();
	public int getmyHeartCnt(String mid);
}
