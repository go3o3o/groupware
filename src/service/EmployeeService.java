package service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import model.Attendance;
import model.Department;
import model.Employee;
import model.Family;
import model.Job;
import model.Position;
import model.Record;

public interface EmployeeService {
	
	// 로그인
	public int login(String empNo, String empPw) throws Exception;
	public Employee getEmployeeInfo(String empNo) throws Exception;
	
	// 비밀번호 찾기
	public int findPasswordByEmail(String empNo, String email) throws Exception;
	public void changePassword(String empNo, String changedPassword) throws Exception;
	
	// 출퇴근
	public boolean inAttendance(String empNo, String ip, Date attTime);
	public boolean outAttendance(String empNo, Date attTime);
	public Attendance getOneAttendance(String empNo);
	public List<Attendance> getAttendanceList(String empNo);
	
	// duty
	public HashMap<String, Object> checkAuthority(String empNo) throws Exception;
	
	/////////////////////////////////////////////////////////////
	// manageEmp
		
	public Employee selectEmp(String empNo) throws Exception;
	public Department selectDept(String deptNo) throws Exception;
	public Position selectPos(int posNo) throws Exception;
	public Job selectJob(int jobNo) throws Exception;
	public Family selectFam(String empNo) throws Exception;
	public Record selectRec(String empNo) throws Exception;
	
	public List<Employee> searchEmp(Employee employee) throws Exception;
	
	public int insertEmp(List<Map<String, Object>> empList) throws Exception;
	public String makeChabun(String empJoinDts) throws Exception;
	
	public void updateEmp(Employee employee, MultipartFile file) throws Exception;
	public File getImgFile(String empNo) throws Exception;
	
}

