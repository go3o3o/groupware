package service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import controller.EDocumentController;
import dao.IEDocumentDao;
import dao.IEmployeeDao;
import model.Document;
import model.Employee;

@Service
public class EDocumentServiceImpl implements EDocumentService{
	@Autowired
	private IEDocumentDao iEdocumentDao;

	

	@Autowired
	private IEmployeeDao iEmployeeDao;
	@Override //전자결재 작성
	public int writeEDocument(Document document) {
		// TODO Auto-generated method stub
		System.out.println("writeEDocument->"+document.toString());
		iEdocumentDao.insertEDocument(document);
		int nextDocSeq=iEdocumentDao.getDocSeq();
		return nextDocSeq-1;
	}

	@Override //수정
	public int modifyEDocument(Document document) {
		// TODO Auto-generated method stub
		Document originDoc=iEdocumentDao.selectOne(document.getEdNo());
		return iEdocumentDao.updateEDocument(document);
	}

	@Override //삭제
	public int deleteEDocument(String ED_SEQ) {
		// TODO Auto-generated method stub
		return iEdocumentDao.deleteEDocument(ED_SEQ);
	}

	@Override //승인....맞나모르것다
	public List<Document> acceptEDocument(String ED_NO) {
		// TODO Auto-generated method stub
		//1. PER_LINE_CNT == PER_CUR_NO 일 경우 ->상태를 승인완료 변경
		//2. PER_LINE_CNT > PER_CUR_NO 일 경우 -> PER_CUR_NO++ 화 / DOCUMENT에 담아서 리턴
		Document docList=iEdocumentDao.selectOne(ED_NO);
		int status=docList.getEdStNo();
		int curline=docList.getPerCurNo();
		int maxline=docList.getPerLineCnt();

		if(maxline>curline){
			status=02; //진행중 코드 02
			docList.setEdStNo(status);
			docList.setPerCurNo(curline+1);
//			iEdocumentDao.updateEDocument(docList);
			return (List<Document>)docList;
		}		
		else{
			//maxline<=curline의 경우.... 상태를 승인 완료로 변경한다.
			status=03; //완료코드 03
			docList.setEdStNo(status);
			docList.setPerCurNo(maxline);
//			iEdocumentDao.updateEDocument(docList);
			return (List<Document>) docList;
		}		
	}

	@Override //반려...얘도 마찬가지고...
	public List<Document> reEDocument(String ED_NO) {
		// TODO Auto-generated method stub
		//1. PER_CUR_NO==1일 경우 불가능 / PER_CUR_NO>1 일때 실행 하면 될듯???
		//1. PER_CUR_NO--화 / DOCUMNET에 담아서 리턴
		Document docList=iEdocumentDao.selectOne(ED_NO);
		int status=docList.getEdStNo();
		int curline=docList.getPerCurNo();
		
		if(curline<=1){
			return null;
		}else
		{
			status=05; //반려코드 05
			docList.setEdStNo(status);
			docList.setPerCurNo(curline-1);
//			iEdocumentDao.updateEDocument(docList);
			return (List<Document>)docList;
		}
	}

	@Override //페이징(ed_no이 문자형이라서..맞는지 모르것다~)
	public HashMap<String, Object> getDocumentListPage(HashMap<String, Object> params, String ED_NO) {
		// TODO Auto-generated method stub
	HashMap<String, Object> result = new HashMap<String,Object>();
	
	result.put("current", ED_NO);
	result.put("start", getStartPage(ED_NO));
	result.put("end", getEndPage(ED_NO));
	result.put("last", getLastPage(params));
	
	params.put("skip", getSkip(ED_NO));
	params.put("qty",10);
	System.out.println(iEdocumentDao.docList(params).toString());
	result.put("edocList", iEdocumentDao.docList(params));
		return result;		
	}

	@Override //문서검색-기안자
	public List<Document> getEDocumentListSearch(String EMP_NO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override //문서검색-제목
	public List<Document> getEDocumentListPageSearchTitle(String ED_TITLE) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override //문서검색-기간
	public List<Document> getEDocumentListPageSearchPeriod(Date ED_IN) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override //해당페이지의 시작 글번호
	public int getStartPage(String ED_NO) {
		// TODO Auto-generated method stub
		if(ED_NO !=null && ED_NO !=""){
		int int_ED_NO=Integer.parseInt(ED_NO);
		return int_ED_NO/10*10+1;
		}
		return 0;
	}

	@Override //해당페이지의 마지막 글번호
	public int getEndPage(String ED_NO) {
		// TODO Auto-generated method stub
		if(ED_NO !=null && ED_NO !=""){
		int int_ED_NO=Integer.parseInt(ED_NO);
		return (int_ED_NO/10+1)*10;
		}
		return 0;
	}

	@Override //해당 글번호가 들어갈 페이지번호
	public int getLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (iEdocumentDao.getCount(params)-1)/10+1;
	}

	@Override //다음 페이지의 시작 글번호   4일때 30  1~10 11~20 21~30 31~40 ???얘좀이상함
	public int getSkip(String ED_NO) {
		// TODO Auto-generated method stub
		if(ED_NO !=null && ED_NO !=""){
		int int_ED_NO=Integer.parseInt(ED_NO);
		return(int_ED_NO-1)*10;
		}
		return 0;
	}

	@Override	//문서 하나 클릭시 문서내용 읽어들이기
	public Document getEDocument(String ED_NO) {
		// TODO Auto-generated method stub
		return iEdocumentDao.selectOne(ED_NO);
	}
	
	
	//부서별 사원검색
		@Override
		public HashMap<String, Object> getEmployees(String dept_no) {
			// TODO Auto-generated method stub
			return iEmployeeDao.findDept(dept_no);
		}

		//지사별 부서검색
		@Override
		public HashMap<String, Object> getDepts(String br_No) {
			// TODO Auto-generated method stub
			return iEmployeeDao.findBranch(br_No);
		}

		@Override
		public Document readDoc(String ED_NO) {
			// TODO Auto-generated method stub
			return iEdocumentDao.selectOne(ED_NO);
					
		}

}