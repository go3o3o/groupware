package model;

import java.util.Date;

public class Attendance {
	private int atdSeq;
	private String empNo;
	private Date atdDate;
	private Date atdOffTime;
	private Date atdOnTime;
	private String ipAddr;
	private String atdSt;
	public int getAtdSeq() {
		return atdSeq;
	}
	public void setAtdSeq(int atdSeq) {
		this.atdSeq = atdSeq;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public Date getAtdDate() {
		return atdDate;
	}
	public void setAtdDate(Date atdDate) {
		this.atdDate = atdDate;
	}
	public Date getAtdOffTime() {
		return atdOffTime;
	}
	public void setAtdOffTime(Date atdOffTime) {
		this.atdOffTime = atdOffTime;
	}
	public Date getAtdOnTime() {
		return atdOnTime;
	}
	public void setAtdOnTime(Date atdOnTime) {
		this.atdOnTime = atdOnTime;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public String getAtdSt() {
		return atdSt;
	}
	public void setAtdSt(String atdSt) {
		this.atdSt = atdSt;
	}
	
	
}
