package model;

public class Ed_Type {
	private int dtNo;
	private String dtNm;
	public int getDtNo() {
		return dtNo;
	}
	public void setDtNo(int dtNo) {
		this.dtNo = dtNo;
	}
	public String getDtNm() {
		return dtNm;
	}
	public void setDtNm(String dtNm) {
		this.dtNm = dtNm;
	}
	@Override
	public String toString() {
		return "Ed_Type [dtNo=" + dtNo + ", dtNm=" + dtNm + "]";
	}
	
}
