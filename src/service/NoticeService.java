package service;

import java.util.HashMap;
import java.util.List;

import model.Authority;
import model.Notice;

public interface NoticeService{
	public List<Notice> selectAll();
	public Notice selectOne(int notiSeq);
	public Authority selectAut(String empNo);
	public void insertNotice(Notice notice);
	public void updateNotice(Notice notice);
	public void deleteNotice(int notiSeq);
	public void insertCnt(int notiSeq);
	public Authority takeAut(String empNo);
	
	public int totalPage();
	public List<Notice> selectPageNotice(int offset, int noOfRecords);
}
