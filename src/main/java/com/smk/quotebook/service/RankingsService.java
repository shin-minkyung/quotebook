package com.smk.quotebook.service;

import java.util.List;

import com.smk.quotebook.model.Rankings;

public interface RankingsService {
	public List<Rankings> top5();
	public int getmyHeartCnt(String mid);
}
