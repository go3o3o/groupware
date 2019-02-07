package model;

import java.util.List;

public class Document {
	private String edNo;		//문서번호 - fw1321321321321
	private String empNo;		//기안자 사원번호 - ms012301923012930
	private int dtNo;			//문서구분번호 - 품의서, 휴가신청서...
	private int edStNo;			//상태번호 - 작성중 진행중 완료...
	private String edTitle;		//보고서 제목
	private String edContent;	//보고서 내용
	private String edFile;		//첨부파일
	private int edEmer;			//긴급여부
	private int edDirect;		//전결여부
	private int edOpen;			//공개구분
	private int perLineCnt;		//전체결재수
//	private List<String> empList;//결재자리스트
	private int perCurNo;		//현재결재라인
	private String edIn;		//작성일자
	private int isPer;			//승인요청여부-제출, 미제출
	
		
	public Document(String empNo, int dtNo, String edTitle, int edOpen,String edContent) {
		this.empNo = empNo;
		this.dtNo = dtNo;
		this.edTitle = edTitle;
		this.edOpen = edOpen;
		this.edContent = edContent;
	}
	
	public Document() {
	}

	@Override
	public String toString() {
		return "Document [edNo=" + edNo + ", empNo=" + empNo + ", dtNo=" + dtNo + ", edStNo=" + edStNo + ", edTitle="
				+ edTitle + ", edContent=" + edContent + ", edFile=" + edFile + ", edEmer=" + edEmer + ", edDirect="
				+ edDirect + ", edOpen=" + edOpen + ", perLineCnt=" + perLineCnt + ", perCurNo=" + perCurNo + ", edIn="
				+ edIn + ", isPer=" + isPer + "]";
	}
	public String getEdNo() {
		return edNo;
	}
	public void setEdNo(String edNo) {
		this.edNo = edNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public int getDtNo() {
		return dtNo;
	}
	public void setDtNo(int dtNo) {
		this.dtNo = dtNo;
	}
	public int getEdStNo() {
		return edStNo;
	}
	public void setEdStNo(int edStNo) {
		this.edStNo = edStNo;
	}
	public String getEdTitle() {
		return edTitle;
	}
	public void setEdTitle(String edTitle) {
		this.edTitle = edTitle;
	}
	public String getEdContent() {
		return edContent;
	}
	public void setEdContent(String edContent) {
		this.edContent = edContent;
	}
	public String getEdFile() {
		return edFile;
	}
	public void setEdFile(String edFile) {
		this.edFile = edFile;
	}

	public int getEdEmer() {
		return edEmer;
	}
	public void setEdEmer(int edEmer) {
		this.edEmer = edEmer;
	}
	public int getEdDirect() {
		return edDirect;
	}
	public void setEdDirect(int edDirect) {
		this.edDirect = edDirect;
	}
	public int getEdOpen() {
		return edOpen;
	}
	public void setEdOpen(int edOpen) {
		this.edOpen = edOpen;
	}
	public int getPerLineCnt() {
		return perLineCnt;
	}
	public void setPerLineCnt(int perLineCnt) {
		this.perLineCnt = perLineCnt;
	}
	public int getPerCurNo() {
		return perCurNo;
	}
	public void setPerCurNo(int perCurNo) {
		this.perCurNo = perCurNo;
	}
	public String getEdIn() {
		return edIn;
	}
	public void setEdIn(String edIn) {
		this.edIn = edIn;
	}
	public int getIsPer() {
		return isPer;
	}
	public void setIsPer(int isPer) {
		this.isPer = isPer;
	}
	
}
