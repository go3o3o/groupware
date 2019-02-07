package dao;

import java.util.HashMap;
import java.util.List;

import model.Attendance;
import model.Department;
import model.Employee;
import model.Job;
import model.Position;
import model.Record;


public interface IEmployeeDao {

	public Employee selectEmpNo(String empNo);
	public Department selectDept(String deptNo);
	public Position selectPos(int posNo);
	public Job selectJob(int jobNo);
	
	public void insertAttendance(Attendance ar);
	public int updateAttendance(Attendance ar);
	public int deleteAttendance(String empNo);
	public Object checkAttendance(String empNo);	
	public Attendance getAttendance(Object empNo);
	public List<Attendance> selectAttendanceList(String empNo);
	
	public void updateEmployeePassword(HashMap<String, Object> passwordMap);
	
	//////////////////////////////////////////////////
	
	public List<Employee> searchEmployee(Employee employee);
	
	public void insertChabun(String commJoinDt);
	public int checkChabun(String commJoinDt);
	public void insertEmployee(Employee employee);
	public void insertAuthority(Employee employee);
	
	public HashMap<String, Object> checkAuthority(String empNo);
	
	public void updateEmployee(Employee employee);
	public void deleteEmployee(Employee employee);

	public void insertRecord(Record record);
	public void updateRecord(Record record);
	
	/////////////////////////////////////////////////
	
	public HashMap<String, Object> findBranch(String br_No);
	public HashMap<String, Object> findDept(String dept_no);
	
	
		
}
