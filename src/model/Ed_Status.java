package model;

public class Ed_Status {
	private int edStNo;
	private String edStNm;
	public int getEdStNo() {
		return edStNo;
	}
	public void setEdStNo(int edStNo) {
		this.edStNo = edStNo;
	}
	public String getEdStNm() {
		return edStNm;
	}
	public void setEdStNm(String edStNm) {
		this.edStNm = edStNm;
	}
	@Override
	public String toString() {
		return "Ed_Status [edStNo=" + edStNo + ", edStNm=" + edStNm + "]";
	}
	
	
}
