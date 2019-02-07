package model;

public class Ed_Permission {
	private int refSeq;
	private String edNo;
	private String refNo;
	public int getRefSeq() {
		return refSeq;
	}
	public void setRefSeq(int refSeq) {
		this.refSeq = refSeq;
	}
	public String getedNo() {
		return edNo;
	}
	public void setedNo(String edNo) {
		this.edNo = edNo;
	}
	public String getRefNo() {
		return refNo;
	}
	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}
	@Override
	public String toString() {
		return "Ed_Permission [refSeq=" + refSeq + ", edNo=" + edNo + ", refNo=" + refNo + "]";
	}
	
	
}
