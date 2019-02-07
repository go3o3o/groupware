package service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import dao.IEmployeeDao;
import model.Attendance;
import model.Department;
import model.Employee;
import model.Family;
import model.Job;
import model.Position;
import model.Record;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private IEmployeeDao employeeDao;

	@Override
	public int login(String empNo, String empPw) throws Exception {
		System.out.println("<< EmployeeService.login() 진입 >>");
		// System.out.println("empNo : " + empNo + ", empPw : " + empPw);
		Employee empCk = null;

		try {
			empCk = employeeDao.selectEmpNo(empNo);
			System.out.println("empCk :: " + empCk);

			if (empCk == null) {
				return 1;
			}
			if (!empPw.equals(empCk.getEmpPw())) {
				return 2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public Employee getEmployeeInfo(String empNo) throws Exception {
		System.out.println(" << EmployeeService.getEmployeeInfo() 진입 >> ");

		Employee employee = null;
		try {
			employee = employeeDao.selectEmpNo(empNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employee;
	}
	@Override
	public boolean inAttendance(String empNo, String ipAddr, Date onTime) {
		//record no excists today, input success : return true
		//if record aleady excists, input fail : return false
		try {
			if(employeeDao.checkAttendance(empNo)==null){
				Attendance at_Record = new Attendance();
				at_Record.setEmpNo(empNo);
				at_Record.setIpAddr(ipAddr);
				at_Record.setAtdOnTime(onTime);	
				employeeDao.insertAttendance(at_Record);
				return true;
			}else{				
				return false;
			}
		} catch (Exception e) {
			System.out.println("서비스임플 예외"+e);
		}
		return false;
	}
	@Override
	public boolean outAttendance(String empNo, Date offTime) {
		Attendance at_Record = new Attendance();
		at_Record.setEmpNo(empNo);
		at_Record.setAtdOffTime(offTime);
		if(employeeDao.selectEmpNo(empNo)!=null){
			employeeDao.updateAttendance(at_Record);			
			return true;
		}else{
			return false;
		}
	}
	@Override
	public Attendance getOneAttendance(String empNo){
		Object empNoObj=empNo;
		Attendance ar = null;
		try {
			ar = employeeDao.getAttendance(empNoObj);
		} catch (NullPointerException e) {
			System.out.println(e);
		}
		return ar;
	}
	@Override
	public List<Attendance> getAttendanceList(String empNo) {
		return employeeDao.selectAttendanceList(empNo);
	}
	@Override
	public int findPasswordByEmail(String empNo, String email) throws Exception {
		//0 - OK, 1 - no matching employee , 2 - no matching email
		Employee employee = employeeDao.selectEmpNo(empNo);
		if(employee==null){
			return 1;
		}
		if(!email.equals(employee.getEmpEmail())){
			return 2;
		}
		return 0;
	}
	@Override
	public void changePassword(String empNo, String changedPassword) {
		HashMap<String, Object> passwordMap = new HashMap<>();
		passwordMap.put("empNo", empNo);
		passwordMap.put("changedPassword", changedPassword);
		employeeDao.updateEmployeePassword(passwordMap);
	}
	
	
	//////////////////////////////////////////////////////
	
	@Override
	public HashMap<String, Object> checkAuthority(String empNo) throws Exception {
		System.out.println(" << EmployeeService.checkAuthority() 진입 >> ");
		HashMap<String, Object> aut = null;

		try {
			aut = new HashMap<>();
			aut = employeeDao.checkAuthority(empNo);

			System.out.println(aut.get("AUTNOTICE"));
			System.out.println(aut.get("AUTHR"));
			System.out.println(aut.get("AUTDEPT"));

		} catch (Exception e) {
			System.out.println(" >> EmployeeService.checkAuthority() Error >> " + e);
		}

		return aut;
	}

	@Override
	public Employee selectEmp(String empNo) throws Exception {

		System.out.println(" << EmployeeService.selectEmp() 진입 >> ");

		Employee employee = null;
		try {
			employee = employeeDao.selectEmpNo(empNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employee;
	}
	
	@Override
	public Department selectDept(String deptNo) throws Exception {
		Department department = employeeDao.selectDept(deptNo);
		return department;
	}

	@Override
	public Position selectPos(int posNo) throws Exception {
		Position position = employeeDao.selectPos(posNo);
		System.out.println(position.getPosNm());
		return position;
	}

	@Override
	public Job selectJob(int jobNo) throws Exception {
		Job job = employeeDao.selectJob(jobNo);
		System.out.println(job.getJobNm());
		return job;
	}	
	
	@Override
	public Family selectFam(String empNo) throws Exception {
		return null;
	}

	@Override
	public List<Employee> searchEmp(Employee employee) throws Exception {
		List<Employee> empList = null;
		try {
			empList = employeeDao.searchEmployee(employee);
		} catch (Exception e) {
			System.out.println("Service.searchEmp ERROR :: " + e);
		}
		
		return empList;
	}

	@Override
	public Record selectRec(String empNo) throws Exception {
		return null;
	}

	@Transactional
	@Override
	public int insertEmp(List<Map<String, Object>> empList) throws Exception {
		Employee employee = new Employee();
		Record record = new Record();
		int check = -1;
		String empNo_ = null;
		String empId_ = null;
		String empPw_ = null;
		String empNm_ = null;
		int jobNo_ = 0;
		int posNo_ = 0;
		String deptNo_ = null;
		String empEmail_ = null;
		String empAddr_ = null;
		String empBirth_ = null;
		String empJoinDt_ = null;
		String empJoinDoc_ = null;

		for (int i = 0; i < empList.size(); i++) {
			try {
				empNo_ = String.valueOf(empList.get(i).get("empNo"));
				empId_ = String.valueOf(empList.get(i).get("empId"));
				empPw_ = String.valueOf(empList.get(i).get("empPw"));
				empNm_ = String.valueOf(empList.get(i).get("empNm"));
				jobNo_ = Integer.parseInt((String) empList.get(i).get("jobNo"));
				posNo_ = Integer.parseInt((String) empList.get(i).get("posNo"));
				deptNo_ = String.valueOf(empList.get(i).get("deptNo"));
				empEmail_ = String.valueOf(empList.get(i).get("empEmail"));
				empAddr_ = String.valueOf(empList.get(i).get("empAddr"));
				empBirth_ = String.valueOf(empList.get(i).get("empBirth"));
				empJoinDt_ = String.valueOf(empList.get(i).get("empJoinDt"));
				empJoinDoc_ = String.valueOf(empList.get(i).get("empJoinDoc"));

				employee.setEmpNo(empNo_);
				employee.setEmpId(empId_);
				employee.setEmpPw(empPw_);
				employee.setEmpNm(empNm_);
				employee.setJobNo(jobNo_);
				employee.setPosNo(posNo_);
				employee.setDeptNo(deptNo_);
				employee.setEmpEmail(empEmail_);
				employee.setEmpAddr(empAddr_);
				employee.setEmpBirth(empBirth_);
				employee.setEmpJoinDt(empJoinDt_);
				employee.setEmpJoinDoc(empJoinDoc_);
				employee.setEmpStatus(0);
				employee.setEmpImg("user-shape.png");
				
				record.setRempNo(empNo_);
				record.setRempId(empId_);
				record.setRempPw(empPw_);
				record.setRempNm(empNm_);
				record.setRjobNo(jobNo_);
				record.setRposNo(posNo_);
				record.setRdeptNo(deptNo_);
				record.setRempDuty("");
				record.setRempEmail(empEmail_);
				record.setRcomPhone("");
				record.setRempPhone("");
				record.setRempEmrPhone("");
				record.setRempAddr(empAddr_);
				record.setRempBirth(empBirth_);
				record.setRempJoinDt(empJoinDt_);
				record.setRempJoinDoc(empJoinDoc_);
				record.setRempStatus(0);
				record.setRempRecDt("");
				record.setRempRecDoc("");
				record.setRempRecEU("");
				record.setRecDt(empJoinDt_);
				record.setRtNo(1);
				record.setRempIp("");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		        Calendar c1 = Calendar.getInstance();
		        String strToday = sdf.format(c1.getTime());
				record.setRempIn(strToday);
				record.setRempDe("");

				employeeDao.insertEmployee(employee);
				employeeDao.insertAuthority(employee);
				employeeDao.insertRecord(record);

			} catch (Exception e) {
				System.out.println(" >> EmployeeService.insertEmp() Error >> " + e);
				return i;
			}
		}
		return check;
	}

	@Override
	public String makeChabun(String empJoinDts) throws Exception {
		String[] commJoinDts = null;
		String ms 			= "MS";
		String commYEAR 	= "";
		String commMONTH 	= "";
		String commDAY 		= "";
		String commJoinDt	= "";
		int commNO_ 		= 0;
		String commNO 		= "";
		String empNo 		= "";

		try {
			commJoinDts = empJoinDts.split("-");
			commYEAR = commJoinDts[0];
			commMONTH = commJoinDts[1];
			commDAY = commJoinDts[2];

			System.out.println(" commYEAR :: " + commYEAR);
			System.out.println(" commMONTH :: " + commMONTH);
			System.out.println(" commDAY :: " + commDAY);

			commJoinDt = commYEAR + commMONTH + commDAY;

			// 20180226(입사일자) 개수 확인
			commNO_ = employeeDao.checkChabun(commJoinDt);

			// 테이블에 해당 일자에 입사한 사원이 없을 경우
			if (commNO_ == 0) {
				commNO = "0001";
			} else {
				commNO_ += 1;
				commNO = String.valueOf(commNO_);

				if (1 == commNO.length()) {
					commNO = "000" + commNO;
				}
				if (2 == commNO.length()) {
					commNO = "00" + commNO;
				}
				if (3 == commNO.length()) {
					commNO = "0" + commNO;
				}
			}

			employeeDao.insertChabun(commJoinDt + commNO);
			System.out.println(" commNO :: " + commNO);

			// MS201802260001
			empNo = ms + commJoinDt + commNO;

			System.out.println("empNo :: " + empNo);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return empNo;
	}

	@Override
	public File getImgFile(String empNo) throws Exception {
		Employee employee = null;
		String fileName = null;
		String path = null;

		File file = null;

		try {
			employee = employeeDao.selectEmpNo(empNo);
			fileName = employee.getEmpImg();
			path = "/Users/yoni/Documents/workspace/hrsystem/EmployeeImg/";

			file = new File(path + fileName);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return file;
	}

	@Override
	public void updateEmp(Employee employee, MultipartFile file) throws Exception {
		String path = null;
		File dir = null;
		String fileName = null;
		File attachFile = null;

		try {
			path = "/Users/yoni/Documents/workspace/hrsystem/EmployeeImg/";
			dir = new File(path);

			if (!dir.exists()) {
				// path에 해당 폴더가 없으면 make directory
				dir.mkdirs();
			}
			
			fileName = file.getOriginalFilename();
			attachFile = new File(path + fileName);
			
			try {

				file.transferTo(attachFile);
				employee.setEmpImg(fileName);

			} catch (IllegalStateException e2) {
				e2.printStackTrace();
			} catch (IOException e2) {
				e2.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}



}
