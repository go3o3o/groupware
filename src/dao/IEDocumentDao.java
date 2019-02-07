package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import model.Document;


public interface IEDocumentDao {

	public int insertEDocument(Document document);

	public int insertTmpEDocument(Document document);

	public int updateEDocument(Document document);
	
	public int deleteEDocument(String ED_NO);
	
	public Document selectOne(String ED_NO);
	
	// 문서목록 가저오기 - 기안자, 문서번호
	public ArrayList<Document> docList(HashMap<String, Object>params);
	
	// params 넘길 레코드 갯수와 조회할 레코드의 갯수
	public List<Document> selectEDocumentPage(HashMap<String,Object> params);

	// params: 제목
	public List<Document> selectSearchTitleContent(HashMap<String, Object> params);

	// params 넘길 레코드 갯수와 조회할 레코드의 갯수
	public List<Document> selectSearchName(Document params);

	// params: 작성일
	public List<Document> selectSearchPeriod(HashMap<String, Object> params);

	// 전자문서 레코드 갯수 조회
	public int getCount(HashMap<String, Object> params);
	
	//문서번호 시퀀스 가져오기
	public int getDocSeq();
}
