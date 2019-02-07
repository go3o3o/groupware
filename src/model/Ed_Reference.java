package model;

public class Ed_Reference {
	private int perSeq;
	private String edNo;
	private String perNo;
	private int perFocus;
	private int isPer;
	private int perResult;
	private String perDt;
	private String perComment;
	
	public int getPerSeq() {
		return perSeq;
	}
	public void setPerSeq(int perSeq) {
		this.perSeq = perSeq;
	}
	public String getedNo() {
		return edNo;
	}
	public void setedNo(String edNo) {
		this.edNo = edNo;
	}
	public String getPerNo() {
		return perNo;
	}
	public void setPerNo(String perNo) {
		this.perNo = perNo;
	}
	public int getPerFocus() {
		return perFocus;
	}
	public void setPerFocus(int perFocus) {
		this.perFocus = perFocus;
	}
	public int getIsPer() {
		return isPer;
	}
	public void setIsPer(int isPer) {
		this.isPer = isPer;
	}
	public int getPerResult() {
		return perResult;
	}
	public void setPerResult(int perResult) {
		this.perResult = perResult;
	}
	public String getPerDt() {
		return perDt;
	}
	public void setPerDt(String perDt) {
		this.perDt = perDt;
	}
	public String getPerComment() {
		return perComment;
	}
	public void setPerComment(String perComment) {
		this.perComment = perComment;
	}
	@Override
	public String toString() {
		return "Ed_Reference [perSeq=" + perSeq + ", edNo=" + edNo + ", perNo=" + perNo + ", perFocus=" + perFocus
				+ ", isPer=" + isPer + ", perResult=" + perResult + ", perDt=" + perDt + ", perComment=" + perComment
				+ "]";
	}
	
}
