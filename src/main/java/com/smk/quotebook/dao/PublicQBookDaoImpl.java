package com.smk.quotebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smk.quotebook.model.Langlist;
import com.smk.quotebook.model.PublicQBook;

@Repository
public class PublicQBookDaoImpl implements PublicQBookDao{
	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public List<Langlist> getlanglist() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getLanglist");
	}

	@Override
	public List<PublicQBook> getPBlist(PublicQBook lang) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getPBlist", lang);
	}

	@Override
	public int getEachlangPBCnt(String mqlang) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getCntEachlangPB", mqlang);
	}

	@Override
	public int insertPB(PublicQBook publicbook) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertPBook", publicbook);
	}

	@Override
	public PublicQBook getPB(int pbid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("contentView1", pbid);
	}

	@Override
	public List<PublicQBook> getMostRead3list(PublicQBook lang) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("mostRead3list", lang);
	}

	@Override
	public List<PublicQBook> getMostRecent3list(PublicQBook lang) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("mostRecent3list", lang);
	}

	@Override
	public int upHit(int pbid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("pBookUphit", pbid);
	}

	@Override
	public int like(int pbid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("like", pbid);
	}

	@Override
	public int unlike(int pbid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("unlike", pbid);
	}

	@Override
	public int insertLike(PublicQBook like) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertLike", like);
	}

	@Override
	public int deleteLike(PublicQBook like) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("deleteLike", like);
	}

	@Override
	public int ifliked(PublicQBook like) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("ifliked", like);
	}

	@Override
	public List<PublicQBook> searchPBtitle(PublicQBook pbtitle) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchPBtitle", pbtitle);
	}

	@Override
	public int searchPBtitleCnt(String keyword) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("searchPBtitleCnt", keyword);
	}

	@Override
	public List<PublicQBook> searchPBquote(PublicQBook pbquote) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchPBquote", pbquote);
	}

	@Override
	public int searchPBquoteCnt(String keyword) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("searchPBquoteCnt", keyword);
	}

	@Override
	public List<PublicQBook> searchPBcontent(PublicQBook pbcontent) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchPBcontent", pbcontent);
	}

	@Override
	public int searchPBcontentCnt(String keyword) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("searchPBcontentCnt", keyword);
	}

	@Override
	public List<PublicQBook> searchPBname(PublicQBook pbmname) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchPBname", pbmname);
	}

	@Override
	public int searchPBnameCnt(String keyword) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("searchPBnameCnt", keyword);
	}

	@Override
	public int getmyPBCnt(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getmyPBCnt", mid);
	}

	@Override
	public List<PublicQBook> getmyPBlist(PublicQBook mypbook) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getmyPBlist", mypbook);
	}

	@Override
	public List<PublicQBook> getIlikedlist(PublicQBook mypbook) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getILikedlist", mypbook);
	}

	@Override
	public int deletePB(int pbid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("deletePB", pbid);
	}

	@Override
	public int modifyPB(PublicQBook modifiedPB) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("modifyPB", modifiedPB);
	}

}
