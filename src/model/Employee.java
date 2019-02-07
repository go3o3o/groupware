package model;

import java.io.File;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Employee {
	private String empNo; // 사원번호 MS20180220001
	private String empId; // 계정ID hoyeon.kim
	private String empPw; // 패스워드
	private String empNm; // 사원명
	private String deptNo; // 부서번호
	// private String deptNm;
	private int posNo; // 직위번호
	// private String posNm;
	private int jobNo; // 직무번호
	// private String jobNm;
	private String empDuty;
	private String empEmail;
	private String comPhone;
	private String empPhone;
	private String empEmrPhone;
	private String empAddr;
	private String empBirth;
	private String empJoinDt;
	private String empJoinDoc;
	private MultipartFile empJoinDocPath;
	private String empImg;
	private MultipartFile empImgPath;

	private String empIp;
	private int empStatus; // 근무상태

	private String empCondition;
	private Department department;
	private Position position;
	private Job job;
	public String getEmpNo() {
		return empNo;
	}
	public String getEmpId() {
		return empId;
	}
	public String getEmpPw() {
		return empPw;
	}
	public String getEmpNm() {
		return empNm;
	}
	public String getDeptNo() {
		return deptNo;
	}
	public int getPosNo() {
		return posNo;
	}
	public int getJobNo() {
		return jobNo;
	}
	public String getEmpDuty() {
		return empDuty;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public String getComPhone() {
		return comPhone;
	}
	public String getEmpPhone() {
		return empPhone;
	}
	public String getEmpEmrPhone() {
		return empEmrPhone;
	}
	public String getEmpAddr() {
		return empAddr;
	}
	public String getEmpBirth() {
		return empBirth;
	}
	public String getEmpJoinDt() {
		return empJoinDt;
	}
	public String getEmpJoinDoc() {
		return empJoinDoc;
	}
	public MultipartFile getEmpJoinDocPath() {
		return empJoinDocPath;
	}
	public String getEmpImg() {
		return empImg;
	}
	public MultipartFile getEmpImgPath() {
		return empImgPath;
	}
	public String getEmpIp() {
		return empIp;
	}
	public int getEmpStatus() {
		return empStatus;
	}
	public String getEmpCondition() {
		return empCondition;
	}
	public Department getDepartment() {
		return department;
	}
	public Position getPosition() {
		return position;
	}
	public Job getJob() {
		return job;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public void setEmpPw(String empPw) {
		this.empPw = empPw;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}
	public void setJobNo(int jobNo) {
		this.jobNo = jobNo;
	}
	public void setEmpDuty(String empDuty) {
		this.empDuty = empDuty;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public void setComPhone(String comPhone) {
		this.comPhone = comPhone;
	}
	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}
	public void setEmpEmrPhone(String empEmrPhone) {
		this.empEmrPhone = empEmrPhone;
	}
	public void setEmpAddr(String empAddr) {
		this.empAddr = empAddr;
	}
	public void setEmpBirth(String empBirth) {
		this.empBirth = empBirth;
	}
	public void setEmpJoinDt(String empJoinDt) {
		this.empJoinDt = empJoinDt;
	}
	public void setEmpJoinDoc(String empJoinDoc) {
		this.empJoinDoc = empJoinDoc;
	}
	public void setEmpJoinDocPath(MultipartFile empJoinDocPath) {
		this.empJoinDocPath = empJoinDocPath;
	}
	public void setEmpImg(String empImg) {
		this.empImg = empImg;
	}
	public void setEmpImgPath(MultipartFile empImgPath) {
		this.empImgPath = empImgPath;
	}
	public void setEmpIp(String empIp) {
		this.empIp = empIp;
	}
	public void setEmpStatus(int empStatus) {
		this.empStatus = empStatus;
	}
	public void setEmpCondition(String empCondition) {
		this.empCondition = empCondition;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	

}
