package model;

import java.io.File;
import java.util.Date;

public class Notice {
	private int notiSeq;
	private String empNo;
	private int ntNo;//notice type
	private String notiTitle;
	private String notiContent;
	private int notiCnt;
	private String notiFile;
	private String notiIn;
	private String notiUp;
	private String notiDe;
	
	
	
	public String getNotiIn() {
		return notiIn;
	}
	public void setNotiIn(String notiIn) {
		this.notiIn = notiIn;
	}
	public String getNotiUp() {
		return notiUp;
	}
	public void setNotiUp(String notiUp) {
		this.notiUp = notiUp;
	}
	public String getNotiDe() {
		return notiDe;
	}
	public void setNotiDe(String notiDe) {
		this.notiDe = notiDe;
	}
	public int getNotiSeq() {
		return notiSeq;
	}
	public void setNotiSeq(int notiSeq) {
		this.notiSeq = notiSeq;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public int getNtNo() {
		return ntNo;
	}
	public void setNtNo(int ntNo) {
		this.ntNo = ntNo;
	}
	public String getNotiTitle() {
		return notiTitle;
	}
	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}
	public String getNotiContent() {
		return notiContent;
	}
	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}
	public int getNotiCnt() {
		return notiCnt;
	}
	public void setNotiCnt(int notiCnt) {
		this.notiCnt = notiCnt;
	}
	public String getNotiFile() {
		return notiFile;
	}
	public void setNotiFile(String notiFile) {
		this.notiFile = notiFile;
	}
		
}
