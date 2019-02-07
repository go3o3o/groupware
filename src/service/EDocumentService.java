package service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import model.Document;
import model.Employee;

public interface EDocumentService {
		//문서작성 1
		public int writeEDocument(Document document);
		//문서수정 2
		public int modifyEDocument(Document document);

		//문서삭제4
		public int deleteEDocument(String ED_NO);
		//문서승인
		public List<Document> acceptEDocument(String ED_NO);
		//문서반려
		public List<Document> reEDocument(String ED_NO);
		//페이징  5
		public HashMap<String, Object> getDocumentListPage(HashMap<String, Object>params, String page);
		//문서검색-기안자 6
		public List<Document> getEDocumentListSearch(String EMP_NO );
		//문서검색-제목 7
		public List<Document> getEDocumentListPageSearchTitle(String ED_TITLE);
		//문서검색-기간 8
		public List<Document> getEDocumentListPageSearchPeriod(Date ED_IN);
		
		
		public int getStartPage(String ED_NO);
		public int getEndPage(String ED_NO);
		public int getLastPage(HashMap<String, Object>params);
		public int getSkip(String ED_NO);
		
		//문서 읽어들이기(문서번호를 통한)
		public Document getEDocument(String ED_NO);
		//부서별 사원정보 뽑기
		public HashMap<String, Object> getEmployees(String dept_no);
		//문서 전송시 DB로 보내기??
//		public void sendEDocument(ArrayList<Document> docVal);

		//		지사 검색
		public HashMap<String, Object> getDepts(String br_No);
		
		public Document readDoc(String ED_NO);

}

