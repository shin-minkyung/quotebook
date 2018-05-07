package com.smk.quotebook.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smk.quotebook.dao.PublicQBookDao;
import com.smk.quotebook.model.Langlist;
import com.smk.quotebook.model.PublicQBook;

@Service
public class PublicQBookServiceImpl implements PublicQBookService{
	@Autowired
	private PublicQBookDao pbdao;
	
	@Override
	public List<Langlist> getlanglist() {
		// TODO Auto-generated method stub
		return pbdao.getlanglist();
	}

	@Override
	public List<PublicQBook> getPBlist(PublicQBook lang) {
		// TODO Auto-generated method stub
		return pbdao.getPBlist(lang);
	}

	@Override
	public int getEachlangPBCnt(String mqlang) {
		// TODO Auto-generated method stub
		return pbdao.getEachlangPBCnt(mqlang);
	}

	@Override
	public int insertPB(PublicQBook publicbook) {
		// TODO Auto-generated method stub
		return pbdao.insertPB(publicbook);
	}

	@Override
	public PublicQBook getPB(int pbid) {
		// TODO Auto-generated method stub
		return pbdao.getPB(pbid);
	}

	@Override
	public List<PublicQBook> getMostRead3list(PublicQBook lang) {
		// TODO Auto-generated method stub
		return pbdao.getMostRead3list(lang);
	}

	@Override
	public List<PublicQBook> getMostRecent3list(PublicQBook lang) {
		// TODO Auto-generated method stub
		return pbdao.getMostRecent3list(lang);
	}

	@Override
	public int upHit(int pbid) {
		// TODO Auto-generated method stub
		return pbdao.upHit(pbid);
	}

	@Override
	public int like(int pbid) {
		// TODO Auto-generated method stub
		return pbdao.like(pbid);
	}

	@Override
	public int unlike(int pbid) {
		// TODO Auto-generated method stub
		return pbdao.unlike(pbid);
	}

	@Override
	public int insertLike(PublicQBook like) {
		// TODO Auto-generated method stub
		return pbdao.insertLike(like);
	}

	@Override
	public int deleteLike(PublicQBook like) {
		// TODO Auto-generated method stub
		return pbdao.deleteLike(like);
	}

	@Override
	public int ifliked(PublicQBook like) {
		// TODO Auto-generated method stub
		return pbdao.ifliked(like);
	}

	@Override
	public List<PublicQBook> searchPBtitle(PublicQBook pbtitle) {
		// TODO Auto-generated method stub
		return pbdao.searchPBtitle(pbtitle);
	}

	@Override
	public int searchPBtitleCnt(String keyword) {
		// TODO Auto-generated method stub
		return pbdao.searchPBtitleCnt(keyword);
	}

	@Override
	public List<PublicQBook> searchPBquote(PublicQBook pbquote) {
		// TODO Auto-generated method stub
		return pbdao.searchPBquote(pbquote);
	}

	@Override
	public int searchPBquoteCnt(String keyword) {
		// TODO Auto-generated method stub
		return pbdao.searchPBquoteCnt(keyword);
	}

	@Override
	public List<PublicQBook> searchPBcontent(PublicQBook pbcontent) {
		// TODO Auto-generated method stub
		return pbdao.searchPBcontent(pbcontent);
	}

	@Override
	public int searchPBcontentCnt(String keyword) {
		// TODO Auto-generated method stub
		return pbdao.searchPBcontentCnt(keyword);
	}

	@Override
	public List<PublicQBook> searchPBname(PublicQBook pbmname) {
		// TODO Auto-generated method stub
		return pbdao.searchPBname(pbmname);
	}

	@Override
	public int searchPBnameCnt(String keyword) {
		// TODO Auto-generated method stub
		return pbdao.searchPBnameCnt(keyword);
	}

	@Override
	public int getmyPBCnt(String mid) {
		// TODO Auto-generated method stub
		return pbdao.getmyPBCnt(mid);
	}

	@Override
	public List<PublicQBook> getmyPBlist(PublicQBook mypbook) {
		// TODO Auto-generated method stub
		return pbdao.getmyPBlist(mypbook);
	}

	@Override
	public List<PublicQBook> getIlikedlist(PublicQBook mypbook) {
		// TODO Auto-generated method stub
		return pbdao.getIlikedlist(mypbook);
	}

	@Override
	public int deletePB(int pbid) {
		// TODO Auto-generated method stub
		return pbdao.deletePB(pbid);
	}

	@Override
	public int modifyPB(PublicQBook modifiedPB) {
		// TODO Auto-generated method stub
		return pbdao.modifyPB(modifiedPB);
	}

	

}
