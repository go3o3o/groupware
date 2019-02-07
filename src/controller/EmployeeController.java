package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import model.Attendance;
import model.Department;
import model.Employee;
import model.Family;
import model.Job;
import model.Notice;
import model.Paging;
import model.Position;
import net.sf.json.JSONArray;
import service.DownloadFile;
import service.EmployeeService;
import service.MailService;
import service.NoticeService;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	@Autowired
	MailService mailService;

	@Autowired
	NoticeService noticeService;

	@RequestMapping("main.do")
	public ModelAndView mainPage(HttpSession session,
			@RequestParam(defaultValue="1") int currentPageNo,
			@RequestParam(defaultValue="0") int recordsPerPage
			)
	{
		String empNo = null;
		ModelAndView mav = null;
		Employee employee = null;
		List<Notice> noticeList = null;

		try {
			empNo = (String) session.getAttribute("empNo");			
			mav = new ModelAndView();

			if (empNo == null) {
				mav.setViewName("login/loginForm");
			} else {
				//1.Main employee Info
				//-----------------------
				employee = employeeService.getEmployeeInfo(empNo);				
				mav.addObject("employee", employee);
				
				//2.Main Notice List				
				//-----------------------
				Paging paging = new Paging(currentPageNo,4);
				int offset= (currentPageNo-1)*paging.getRecordsPerPage();
				if(currentPageNo != 1){
					offset++;
				}
				if(offset == 0){
				paging.setNoOfRecords(offset+paging.getRecordsPerPage());
				}
				else{
					paging.setNoOfRecords(offset+paging.getRecordsPerPage()-1);
				}
				List<Notice> notice = noticeService.selectPageNotice(offset,paging.getNoOfRecords());
				paging.setNumberOfRecords(noticeService.totalPage());
				paging.makePaging();
				if(notice !=null){
					mav.addObject("notice",notice);
					mav.addObject("paging",paging);
				}
				int possible=0;//권한 받아오기
				
				mav.addObject("possible", possible);
				//--------------------------				
				mav.setViewName("login/main");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}


	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "login/loginForm";
	}

	@RequestMapping("login.do")
	public ModelAndView login(HttpSession session, String empNo, String empPw) {
		System.out.println(" << EmployeeController.login() 진입 >> ");
		System.out.println("empNo :: " + empNo);
		System.out.println("empPw :: " + empPw);

		ModelAndView mav = null;
		// RedirectView rv = null;
		Employee employee = null;
		int ck = 0;

		try {
			mav = new ModelAndView();
			ck = employeeService.login(empNo, empPw);
			
			// for문 돌리는 게 더 빠름
			if (ck == 0) {
				employee = employeeService.getEmployeeInfo(empNo);
				session.setAttribute("empNo", empNo);
				session.setAttribute("empName",employee.getEmpNm());
				session.setAttribute("empDuty",employee.getEmpDuty());
				mav.setView(new RedirectView("main.do", true));
			}
			if (ck == 1) {
				mav.addObject("msg", "해당 아이디가 존재하지 않습니다.");
				mav.setViewName("login/loginForm");
			}			
			if (ck == 2) {
				mav.addObject("msg", "비밀번호가 일치하지 않습니다.");
				mav.setViewName("login/loginForm");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		
		session.removeAttribute("empNo");
		return "redirect:loginForm.do";
	}	
	@RequestMapping("onTime.do")
	public void onTime(HttpServletResponse resp, HttpSession session, HttpServletRequest request){	
		
		//1. Get user empNo from session
		String empNo=(String)session.getAttribute("empNo");

		//2. Get user ip
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}
		//3. Get attendance Time
		Date onTime = new Date();
		
		//4. Try input DB
		boolean result = employeeService.inAttendance(empNo,ip,onTime);

		//5. Result json message return
		JSONObject jObj = new JSONObject();
		resp.setContentType("text/html;charset=UTF-8"); 
		System.out.println(result);
		String attmsg ="";
		if(result==false){//inTime false
			attmsg="출근을 이미 기록했습니다.";
		}else{//inTime true
			attmsg="출근기록이 완료되었습니다.";
		}
		jObj.put("attmsg", attmsg);
		PrintWriter pr;	
			try {
				pr = resp.getWriter();
				pr.print(jObj);
				pr.flush();		
			} catch (IOException e) {
				System.out.println("in Time Exception >> :"+e);
			}
	}

	@RequestMapping("offTime.do")
	public void offTime(HttpServletResponse resp, HttpSession session){
		//1. Get attendance Time
		Date Time = new Date();

		//2. Try Input DB
		String EmpNo = (String)session.getAttribute("empNo");	

		//3. Result json message return
		JSONObject jObj = new JSONObject();	
		resp.setContentType("text/html;charset=UTF-8"); 
		boolean result = employeeService.outAttendance(EmpNo, Time);
		String attmsg="";
		if(result==false){//input false
			attmsg="아직 출근기록이 없습니다.";
		}else{//input success
			attmsg="퇴근기록이 완료되었습니다.";	
		}
		jObj.put("attmsg", attmsg);
		PrintWriter pr;
			try {
				pr = resp.getWriter();
				pr.print(jObj);
				pr.flush();		
			} catch (IOException e) {
				System.out.println("out Time Exception >> :"+e);
			}	
	}
	@RequestMapping("getEmpNo.do")
	public String getEmpNo(HttpSession session){
		String EmpNo = (String)session.getAttribute("empNo");
		return "redirect:mainContents.jsp?="+EmpNo;
	}
	//Get one day's record for check whether employee clicked 'inTime' button or not today
	@RequestMapping("getAttendanceRecord.do")
	public void getAttendanceRecord(HttpServletResponse resp,HttpSession session){
		//0.HANGUL ENCODING
		resp.setContentType("text/plain;charset=UTF-8");
		
		//1.세션의 empNo로 출퇴근시간을 갖고옴
		Attendance atr = null;
		String empNo = (String)session.getAttribute("empNo");
		atr = employeeService.getOneAttendance(empNo);
		String onTime;
		String offTime;
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		if(atr.getAtdOnTime()!=null){
			onTime=sdFormat.format(atr.getAtdOnTime());
		}else{
			onTime="아직 출근 기록이 없습니다.";
		}
		if(atr.getAtdOffTime()!=null){
			offTime=sdFormat.format(atr.getAtdOffTime());
		}else{
			offTime="아직 퇴근 기록이 없습니다.";
		}
		//2.json에 담아서 전송
		JSONObject jObj = new JSONObject();
		jObj.put("onTime", onTime);
		jObj.put("offTime", offTime);
		
		PrintWriter pr;	
			try {
				pr = resp.getWriter();
				pr.print(jObj);
				pr.flush();		
			} catch (IOException e) {
				System.out.println("Exception >> :"+e);
			}
	}
	//Get all list of one employee's daily attendance record
	@RequestMapping("getAttendanceRecordList.do")
	public ModelAndView getAttendanceRecordList(HttpServletResponse resp,HttpSession session){
		//0.HANGUL ENCODING
		resp.setContentType("text/plain;charset=UTF-8");
		
		ModelAndView mav = new ModelAndView();
		
		//1.Get required elements
		String empNo = (String)session.getAttribute("empNo");
		String empName = (String)session.getAttribute("empName");
		List<Attendance> result = employeeService.getAttendanceList(empNo);		
		
		mav.addObject("empNo", empNo);
		mav.addObject("empName", empName);
		mav.addObject("result",result);
		mav.setViewName("login/attendanceList");

		//2.return mav
		return mav;
	}
	
	@RequestMapping("findPasswordForm.do")
	public String findPasswordForm() {
		return "login/findPasswordForm";
	}

	@RequestMapping("findPassword.do")
	public String sendMailPassword(@RequestParam String empNo, @RequestParam String email, RedirectAttributes ra){
        int empCk;
        System.out.println(empNo +"입력한 사번");
        System.out.println(email +"입력한 메일");


        try {
			empCk = employeeService.findPasswordByEmail(empNo, email);

			if (empCk == 1) {
                ra.addFlashAttribute("resultMsg", "입력하신 사원번호로 조회되는사원이 없습니다.");
                return "redirect:findPasswordForm.do";
            }
			if (empCk == 2) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일과 등록된 이메일이 일치하지 않습니다.");
                return "redirect:findPasswordForm.do";
            }
			if(empCk==0){
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            employeeService.changePassword(empNo, password); // 해당 유저의 DB정보 변경
 
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            mailService.send(subject, sb.toString(), "0223.msgroup.test@gmail.com", email);
            ra.addFlashAttribute("resultMsg", "입력하신 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        }
        
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
        
        return "redirect:findPasswordForm.do";
	}

	//////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping("mainDuty.do")
	public ModelAndView mainDuty(HttpSession session) {
		System.out.println(" << EmployeeController.mainDuty() 진입 >> ");
		
		ModelAndView mav = null;
		String empNo = null;
		Employee employee = null;
		HashMap<String, Object> authority = null;
		
		try {
			mav = new ModelAndView();
			empNo = (String) session.getAttribute("empNo");
			
			if (empNo == null) {
				mav.setViewName("login/loginForm");
			} else {
				authority = new HashMap<>();
				employee = employeeService.getEmployeeInfo(empNo);
				authority = employeeService.checkAuthority(empNo);				
				
				mav.addObject("authority", authority);
				mav.addObject("employee", employee);
				mav.setViewName("login/mainDuty");		
			}
			
		} catch (Exception e) {
			
		}
		System.out.println(" << EmployeeController.mainDuty() 종료 >> ");
		return mav;
	}

	@RequestMapping("hrSystemForm2.do")
	public ModelAndView hrSystemForm2(HttpSession session, String searchEmpNo) {
		ModelAndView mav = null;
		Employee employee = null;
		
		String empNo = null;
		String empNm = null;
		System.out.println("searchEmpNo :: "+searchEmpNo);
		
		try {
			mav = new ModelAndView();
			empNo = (String) session.getAttribute("empNo");
			employee = employeeService.selectEmp(searchEmpNo);
			empNm = employeeService.selectEmp(empNo).getEmpNm();
			mav.addObject("empNm", empNm);
			mav.addObject("employee", employee);
			mav.setViewName("hrSystem/hrSystemForm2");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("hrSystemForm.do")
	public ModelAndView hrSystemForm(HttpSession session) {
		System.out.println(" << EmployeeController.hrSystemForm() 진입 >> ");
		ModelAndView mav = null;
		String empNo = null;
		Employee employee = null;
		HashMap authority = null;
		
		try {
			mav = new ModelAndView();
			empNo = (String) session.getAttribute("empNo");
			
			employee = employeeService.selectEmp(empNo);
			authority = employeeService.checkAuthority(empNo);
			
			mav.addObject("employee", employee);
			mav.addObject("authority", authority);
			mav.setViewName("hrSystem/hrSystemForm");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(" << EmployeeController.hrSystemForm() 종료 >> ");
		return mav;
	}
	
	@RequestMapping("empImg.do")
	public View empImg(String empNo) {
		View view = null;
		
		try {
			view = new DownloadFile(employeeService.getImgFile(empNo));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return view;
	}
	
	
	@RequestMapping("manageForm.do")
	public ModelAndView manageForm(HttpSession session, String searchEmpNo) {
		System.out.println(" << EmployeeController.manageForm() 진입 >> ");

		ModelAndView mav = null;
		String empNo = null;
		Employee employee = null;
		Position position = null;
		Job job = null;

		try {
			
			mav = new ModelAndView();
			if (searchEmpNo != null) {
				empNo = searchEmpNo;

			} else {
				empNo = (String) session.getAttribute("empNo");
			}
			
			employee = employeeService.selectEmp(empNo);
			position = employeeService.selectPos(employee.getPosNo());
			job = employeeService.selectJob(employee.getJobNo());

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.addObject("employee", employee);
		mav.addObject("position", position);
		mav.addObject("job", job);
		mav.setViewName("hrSystem/manageForm");

		System.out.println(" << EmployeeController.manageForm() 종료 >> ");
		return mav;

	}

	@RequestMapping("manageEmpForm.do")
	public ModelAndView manageEmpForm(HttpSession session, String searchEmpNo) {
		System.out.println(" << EmployeeController.manageEmpForm() 진입 >> ");

		ModelAndView mav = new ModelAndView();
		Employee employee = null;
		Department department = null;
		Position position = null;
		HashMap<String, Object> authority = null;
		Job job = null;
		String empNo = null;
		
		System.out.println("searchEmpNo :: " + searchEmpNo);

		try {
			// 사원 검색했을 경우
			if (searchEmpNo != null) {
				empNo = searchEmpNo;

			} else {
				empNo = (String) session.getAttribute("empNo");
			}
			
			employee = employeeService.selectEmp(empNo);
			position = employeeService.selectPos(employee.getPosNo());
			job = employeeService.selectJob(employee.getJobNo());
			authority = employeeService.checkAuthority(String.valueOf(session.getAttribute("empNo")));				
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("employee", employee);
		mav.addObject("authority", authority);
		mav.addObject("position", position);
		mav.addObject("job", job);
		mav.setViewName("hrSystem/manageEmpForm");

		System.out.println(" << EmployeeController.manageEmpForm() 종료 >> ");

		return mav;
	}
	
	@RequestMapping("manageFamForm.do")
	public String manageFamForm(HttpSession session, String searchEmpNo) {
		System.out.println(" << EmployeeController.manageFamForm() 진입 >> ");
		
		Employee employee = null;
		Family family = null;
		HashMap<String, Object> authority = null;
		String empNo = null;
		try {
			// 사원 검색했을 경우
			if (searchEmpNo != null) {
				empNo = searchEmpNo;

			} else {
				empNo = (String) session.getAttribute("empNo");
			}
			
			employee = employeeService.selectEmp(empNo);
			
			authority = employeeService.checkAuthority(String.valueOf(session.getAttribute("empNo")));				
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(" << EmployeeController.manageFamForm() 종료 >> ");
		return "manageFamForm";
	}
	
	@RequestMapping("manageRecordForm.do")
	public String manageRecordForm(HttpSession session, String searchEmpNo) {
		return "manageRecordForm";
	}
	
	////2018.03.12 Employee Information Update//////////////////////////////////////////////////////////////
	@RequestMapping(value = "updateEmp.do", method = RequestMethod.POST)
	public void updateEmp(HttpServletResponse resp, HttpServletRequest req) {
		System.out.println(" << EmployeeController.updateEmp() 진입 >> ");
		
		Employee employee = null;

		String empNo = req.getParameter("empNo");
		String empNm = req.getParameter("empNm");
		String empId = req.getParameter("empId");
		String empPw = req.getParameter("empPw");
		String jobNo = req.getParameter("jobNo");
		String posNo = req.getParameter("posNo");
		String deptNo = req.getParameter("deptNo");
		String empEmail = req.getParameter("empEmail");
		String empAddr = req.getParameter("empAddr");
		String empBirth = req.getParameter("empBirth");


		Map<String, Object> empValue = new HashMap<>();

		empValue.put("empNo", empNo);
		empValue.put("empId", empId);
		empValue.put("empPw", empPw);
		empValue.put("empNm", empNm);
		empValue.put("jobNo", jobNo);
		empValue.put("posNo", posNo);
		empValue.put("deptNo", deptNo);
		empValue.put("empEmail", empEmail);
		empValue.put("empAddr", empAddr);
		empValue.put("empBirth", empBirth);
		
		JSONObject jObj = new JSONObject();
		resp.setContentType("text/html;charset=UTF-8"); 
		

		
	}

	@RequestMapping("searchEmpForm.do")
	public String searchEmpForm() {
		return "hrSystem/searchEmpForm";
	}

	/////2018.03.09 Employee Search//////////////////////////////////////////////////////////////////
	@RequestMapping("searchEmp.do")
	public void searchEmp(@RequestParam(defaultValue = "0") int empStatus, @RequestParam(required=false) String empNm,
			HttpServletResponse resp) {
		System.out.println(" << EmployeeController.searchEmp() 진입 >> ");
		System.out.println("empStatus :: "+empStatus);
		System.out.println("empNm :: "+empNm);
	
		Model m = null;
		Employee employee = null;
		Department department = null;
		Job job = null;
		Position pos = null;
		
		List<Employee> empList = null;
		
		resp.setContentType("text/html; charset=UTF-8;");
		
		try {
			employee = new Employee();
			employee.setEmpStatus(empStatus);
			employee.setEmpNm(empNm);

			empList = employeeService.searchEmp(employee);
			
			for(int i = 0 ; i < empList.size(); i++) {
				pos = employeeService.selectPos(empList.get(i).getPosNo());
				job = employeeService.selectJob(empList.get(i).getJobNo());
				empList.get(i).setPosition(pos);
				empList.get(i).setJob(job);
			}

			net.sf.json.JSONArray jArr = net.sf.json.JSONArray.fromObject(empList);
			
			PrintWriter pr;
			try {
				pr = resp.getWriter();
				pr.print(jArr);
				pr.flush();
			} catch (IOException e2) {
				System.out.println("Controller.searchEmp() IOException :: "+e2);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(" << EmployeeController.searchEmp() 종료 >> ");
	}

	////insertEmpFormNext.jsp 에서 뒤로가기 눌렀을 경우로, session or cookie에 내용 저장해 놓기 ///////
	@RequestMapping("insertEmpForm.do")
	public String insertEmpForm(HttpSession session) {
		return "hrSystem/insertEmpForm";
	}

	@SuppressWarnings("unchecked")
	public static JSONObject getJsonStringFromMap(Map<String, Object> map) {
		JSONObject json = new JSONObject();
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			String key = entry.getKey();
			Object value = entry.getValue();
			json.put(key, value);
		}

		return json;
	}

	@RequestMapping(value = "insertEmpFormNext.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView insertEmpFormNext(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println(" << EmployeeController.insertEmpFormNext() 진입 >> ");
		ModelAndView mav = new ModelAndView();
		Map<String, String[]> map = req.getParameterMap();
		List<Map<String, Object>> empList = new ArrayList<Map<String, Object>>();

		int mapSize = map.size();

		String[] empIds = map.get("empIds[]");
		String[] empPws = map.get("empPws[]");
		String[] empNms = map.get("empNms[]");
		String[] jobNos = map.get("jobNos[]");
		String[] posNos = map.get("posNos[]");
		String[] deptNos = map.get("deptNos[]");
		String[] empEmails = map.get("empEmails[]");
		String[] empAddrs = map.get("empAddrs[]");
		String[] empBirths = map.get("empBirths[]");
		String[] empJoinDts = map.get("empJoinDts[]");

		String[] empNos = new String[mapSize];

		Position position = null;
		Job job = null;
		Department department = null;
		
		if (mapSize > 0) {

			for (int j = 0; j < empIds.length; j++) {
				Map<String, Object> empValue = new HashMap<>();

				empNos[j] = employeeService.makeChabun(empJoinDts[j]);
				position = employeeService.selectPos(Integer.parseInt(posNos[j]));
				job = employeeService.selectJob(Integer.parseInt(jobNos[j]));
				
				empValue.put("empNo", empNos[j]);
				empValue.put("empId", empIds[j]);
				empValue.put("empPw", empPws[j]);
				empValue.put("empNm", empNms[j]);

				empValue.put("jobNo", jobNos[j]);
				empValue.put("jobNm", job.getJobNm());
				
				empValue.put("posNo", posNos[j]);
				empValue.put("posNm", position.getPosNm());
				
				empValue.put("deptNo", deptNos[j]);
				empValue.put("empEmail", empEmails[j]);
				empValue.put("empAddr", empAddrs[j]);
				empValue.put("empBirth", empBirths[j]);
				empValue.put("empJoinDt", empJoinDts[j]);

				empList.add(empValue);
			}

			org.json.simple.JSONArray jsonArray = new org.json.simple.JSONArray();
			for (Map<String, Object> jsonMap : empList) {
				jsonArray.add(getJsonStringFromMap(jsonMap));
			}

			System.out.println(jsonArray);

			mav.addObject("empList", jsonArray);
			mav.setViewName("hrSystem/insertEmpFormNext");

		} else {
			mav.addObject("msg", "정보를 입력해 주세요.");
			mav.setViewName("hrSystem/insertEmpForm");
		}
		
		System.out.println(" << EmployeeController.insertEmpFormNext() 종료 >> ");
		return mav;
	}

	@RequestMapping(value = "insertEmp.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView insertEmp(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println(" << EmployeeController.insertEmp() 진입 >> ");
		ModelAndView mav = new ModelAndView();
		int check = 0;

		Map<String, String[]> map = req.getParameterMap();
		List<Map<String, Object>> empList = new ArrayList<Map<String, Object>>();

		int mapSize = map.size();

		String[] empNos = map.get("empNos[]");
		String[] empIds = map.get("empIds[]");
		String[] empPws = map.get("empPws[]");
		String[] empNms = map.get("empNms[]");
		String[] jobNos = map.get("jobNos[]");
		String[] posNos = map.get("posNos[]");
		String[] deptNos = map.get("deptNos[]");
		String[] empEmails = map.get("empEmails[]");
		String[] empAddrs = map.get("empAddrs[]");
		String[] empBirths = map.get("empBirths[]");
		String[] empJoinDts = map.get("empJoinDts[]");
		String[] empJoinDocs = map.get("empJoinDocs[]");

		if (mapSize > 0) {

			for (int j = 0; j < empIds.length; j++) {
				Map<String, Object> empValue = new HashMap<String, Object>();

				empValue.put("empNo", empNos[j]);
				empValue.put("empId", empIds[j]);
				empValue.put("empPw", empPws[j]);
				empValue.put("empNm", empNms[j]);
				empValue.put("jobNo", jobNos[j]);
				empValue.put("posNo", posNos[j]);
				empValue.put("deptNo", deptNos[j]);
				empValue.put("empEmail", empEmails[j]);
				empValue.put("empAddr", empAddrs[j]);
				empValue.put("empBirth", empBirths[j]);
				empValue.put("empJoinDt", empJoinDts[j]);
				empValue.put("empJoinDoc", empJoinDocs[j]);

				empList.add(empValue);
				System.out.println(j + " : " + empList.get(j));
			}

			try {
				check = employeeService.insertEmp(empList);
						
				if(check == -1) {
					mav.setViewName("hrSystem/insertEmpForm");
					System.out.println("성공");
				} else {
					mav.addObject("msg", (check+1)+"번째 사원 입사 과정에서 오류가 발생하였습니다.");
					System.out.println(check + "번째 사원 입사 과정에서 오류 발생");					
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {

			mav.setViewName("hrSystem/insertEmpForm");
		}

		return mav;
	}
}