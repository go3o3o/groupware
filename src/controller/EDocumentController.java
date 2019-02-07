package controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.IEDocumentDao;
import model.Document;
import service.EDocumentService;
import service.EDocumentServiceImpl;

@Controller
public class EDocumentController {
	@Autowired
	EDocumentService edcoumentService;
	
	@RequestMapping("showEdocumentList.do")
	public ModelAndView showDocumentList(@RequestParam(required=false) String ED_NO,
										@RequestParam(defaultValue = "0") int type,
										@RequestParam(required=false)String keyword){
		
			ModelAndView mav= new ModelAndView();
			
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("keyword", keyword);
		params.put("type", type);
		if(type==1){
			params.put("content",  keyword);
		}
		HashMap<String, Object>result = edcoumentService.getDocumentListPage(params, ED_NO);
		
		System.out.println("문서쪽수>>"+result.toString());
		
		mav.addAllObjects(result);
		mav.addAllObjects(params);
		mav.setViewName("edocument/showEdocumentListForm");
		return mav;
	}
	
//	@RequestMapping("showDocumentOne.do")
//	public Document showDocumentOne(Document document){
		//------------------------------------------------------------
//		String ed_no=document.getEdNo();		
//	}
	
	@RequestMapping("view.do")
	public String view(Model model,@RequestParam(defaultValue="1")int page, String ED_NO) {
		model.addAttribute("board", edcoumentService.readDoc(ED_NO));
		model.addAttribute("page", page);
		System.out.println("모델 : "+model);
		return "view";
	}
	
	@RequestMapping("findApproverForm.do")
	public void findApproverForm(){
		//결재선 추가 시 행동
	}
	
//	@RequestMapping("findApprover.do")
//	public void findApprover(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
//		//결재자 검색
//		String findName = (String) session.getAttribute("EMP_NM");
//		atr = edcoumentService.get
//	} 	


	//기안자가 결재자 들을 추가하는 함수.
	//이게 document 모델에 private List<String> empList; 속성에 담길 것
	@RequestMapping("addApprover.do")
	public void addApprover(Document document,String ED_NO){
//		//결재자 추가
//		//-해당 인원이 등록한 이름 or 사원번호 정보들을 보관하는 변수에 담는다
//		List<String> approver = 결재자들
//				edcoumentService.getEDocument(ED_NO);
//		//-변수의 사원번호를 하단 arraylist에 담는다.
//		
//		//라인레벨 증가
//		int lineCnt=document.getPerLineCnt()+1;
//		document.setPerLineCnt(lineCnt);
//		//결재라인 구성(결재자의 사원번호를 배열로 담아두어야 함)
//		ArrayList<String>emp_nm=ArrayList<String>;
//		
//		emp_nm.add();
	}
	
	@RequestMapping("findCCForm.do")
	public void findCCForm(){
		//참조자 추가 시 행동
	}
	@RequestMapping("findCC.do")
	public void findCC(){
		//참조자 검색
	}
	@RequestMapping("addCC.do")
	public void addCC(){
		//참조자 추가
	}

	@RequestMapping("insertTempDocument.do")
	public void insertTempDocument(){
		//임시파일 저장하기
	}
	@RequestMapping("takeTempDocument.do")
	public void takeTempDocument(){
		//임시파일 불러오기
	}
	@RequestMapping("deleteTempDocument.do")
	public void deleteTempDocument(){
		//임시파일 파기
	}
	@RequestMapping("insertDocumentForm.do")
	public void insertDocumentForm(){
		//문서작성 폼 클릭시 행동
	}
	@RequestMapping("insertDocument.do")
	public void insertDocument(){
		//문서작성 폼 호출
	}
	@RequestMapping("approveDocument.do")
	public void approveDocument(){
		//문서승인
	}
	@RequestMapping("rejectDocument.do")
	public void rejectDocument(){
		//문서반려
	}

//	@RequestMapping("showEdocumentListForm.do")
//	public Document showEdocumentListForm(HttpSession session, Document document){
//		//받은문서이동
//			String userid=(String) session.getAttribute("empno");
//			Document doc_writer=edcoumentService.getEDocument(userid);
////			작성자의 id(userid)를 가지고, 해당 id를 결재자 라인에 등록한 문서들을 보여줘
//			//결재자 라인->arrayList에 담겨있음... 위쪽 함수
//			//addApprover(Document document)
//	}
//	
//	@RequestMapping("writeEdocumentForm.do")
//	public void writeEdocumentForm(){
//		//기안문서이동
//	}
//	
//	@RequestMapping("finishEdocumentForm.do")
//	public void finishEdocumentForm(){
//		//결재완료문서이동
//	}
	 
	@RequestMapping(value="findDept.do", method = RequestMethod.POST)
	@ResponseBody
	public void findDept(String dept_no, HttpServletResponse resp){
		org.json.JSONObject job = new org.json.JSONObject();
		
		job.append("deptno", edcoumentService.getEmployees(dept_no));
		try {
			resp.getWriter().print(job);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("showEdocumentForm.do")
	public String showEdocumentForm(HttpSession session, Model model){
		model.addAttribute("empNo", session.getAttribute("empNo"));
			return "edocument/showEdocumentForm";
		}
	//문서 등록
	@RequestMapping("docWrite.do")
	public String docWrite(@RequestParam("ufile")MultipartFile ufile,Document doc,String edEmers){
		System.out.println("글"+doc.toString());
		
		try {
			if(edEmers.equals("on")){
				doc.setEdEmer(1);	
			}	
		} catch (Exception e) {
			// TODO: handle exception
		}
		
//		System.out.println(doc.toString());
		int num = edcoumentService.writeEDocument(doc);
		return "redirect:showEdocumentList.do";

	}
	@RequestMapping("showView.do")
	public ModelAndView view(String edNo,@RequestParam(defaultValue="1")int page) {
		ModelAndView mav =new ModelAndView();
		mav.addObject(edcoumentService.readDoc(edNo));
		mav.addObject("page", page);
		mav.setViewName("edocument/showView");
		return mav;
	}
	@RequestMapping("tree.do")
	public String tree(String BR_NO, String ED_NO){
		
		return null;
	}
}