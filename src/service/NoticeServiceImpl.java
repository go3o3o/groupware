package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.INoticeDao;
import model.Authority;
import model.Notice;
import model.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private INoticeDao iNoticeDao;

	@Override
	public List<Notice> selectAll() {
		// TODO Auto-generated method stub
		return iNoticeDao.selectAll();
	}

	@Override
	public Notice selectOne(int notiSeq) {
		// TODO Auto-generated method stub
		return iNoticeDao.selectOne(notiSeq);
	}

	@Override
	public Authority selectAut(String empNo) {
		// TODO Auto-generated method stub
		return iNoticeDao.selectAut(empNo);
	}

	@Override
	public void insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		int checkSuccess = iNoticeDao.insertNotice(notice);
		if (checkSuccess == 1) {
			System.out.println("ok");
		} else {
			System.out.println("no");
		}
	}

	@Override
	public List<Notice> selectPageNotice(int offset, int noOfRecords) {
		//offset,noOfRecords
		System.out.println("of : "+offset);
		System.out.println("no : "+noOfRecords);
		Paging page = new Paging();
		page.setOffset(offset);
		page.setNoOfRecords(noOfRecords);

		return iNoticeDao.selectAllPage(page);
	}


	@Override
	public int totalPage() {
		// TODO Auto-generated method stub
		return iNoticeDao.totalPageCount();
	}

	@Override
	public void updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		iNoticeDao.updateOne(notice);
	}

	@Override
	public void deleteNotice(int notiSeq) {
		// TODO Auto-generated method stub
		iNoticeDao.deleteOne(notiSeq);
	}

	@Override
	public void insertCnt(int notiSeq) {
		// TODO Auto-generated method stub
		iNoticeDao.addCnt(notiSeq);
	}

	@Override
	public Authority takeAut(String empNo) {
		// TODO Auto-generated method stub
		return iNoticeDao.selectAut(empNo);
	}
	

}
