package com.smk.quotebook.service;

import java.util.List;

import com.smk.quotebook.model.Langlist;
import com.smk.quotebook.model.PublicQBook;

public interface PublicQBookService {
	public List<Langlist> getlanglist();
	public List<PublicQBook> getPBlist(PublicQBook lang);
	public int getEachlangPBCnt(String mqlang);
	public int insertPB(PublicQBook publicbook);
	public PublicQBook getPB(int pbid);
	public List<PublicQBook> getMostRead3list(PublicQBook lang);
	public List<PublicQBook> getMostRecent3list(PublicQBook lang);
	public int upHit(int pbid);
	public int like(int pbid);
	public int unlike(int pbid);
	public int insertLike(PublicQBook like);
	public int deleteLike(PublicQBook like);
	public int ifliked(PublicQBook like);
	public List<PublicQBook> searchPBtitle(PublicQBook pbtitle);
	public int searchPBtitleCnt(String keyword);
	public List<PublicQBook> searchPBquote(PublicQBook pbquote);
	public int searchPBquoteCnt(String keyword);
	public List<PublicQBook> searchPBcontent(PublicQBook pbcontent);
	public int searchPBcontentCnt(String keyword);
	public List<PublicQBook> searchPBname(PublicQBook pbmname);
	public int searchPBnameCnt(String keyword);
	public int getmyPBCnt(String mid);
	public List<PublicQBook> getmyPBlist(PublicQBook mypbook);
	public List<PublicQBook> getIlikedlist(PublicQBook mypbook);
	public int deletePB(int pbid);
	public int modifyPB(PublicQBook modifiedPB);
}
