package dao;

import java.util.List;

import model.Authority;
import model.Notice;
import model.Paging;

public interface INoticeDao {
	public List<Notice> selectAll();
	public Notice selectOne(int notiSeq);
	public Authority selectAut(String empNo);
	public int insertNotice(Notice notice);
	public int totalPageCount();
	
	public List<Notice> selectAllPage(Paging page);
	public int updateOne(Notice notice);
	public int deleteOne(int notice);
	public int addCnt(int notiSeq);
}
