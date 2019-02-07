package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Authority;
import model.Notice;
import model.Paging;
import service.EmployeeService;
import service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	//MS20181212002
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping("showNoticeListForm.do")
	public ModelAndView showNoticeListForm(
			@RequestParam(defaultValue="1") int currentPageNo,
			@RequestParam(defaultValue="0") int recordsPerPage, HttpSession session) {
		
		
		
		ModelAndView mav = new ModelAndView();
		//-----------------------
		Paging paging = new Paging(currentPageNo,20);

		
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
		//--------------------------------------------------------------------------
		Authority aut = noticeService.takeAut((String)session.getAttribute("empNo"));
		
		
		
		mav.addObject("possible", aut.getAutNotice());
		//0 : user, 1: notice administrator
		//---------------------------------------------------------------------------
		
		
		mav.setViewName("notice/showNoticeListForm");
			
		return mav;
	}
	@RequestMapping("showNoticeForm.do")
	public ModelAndView showNoticeForm(int notiSeq, HttpSession session){
		ModelAndView mav = new ModelAndView();
		int possible=0;
		System.out.println(notiSeq);
		
		Notice notice = noticeService.selectOne(notiSeq);
		noticeService.insertCnt(notiSeq);//increasing count
		
		//--------------------------------------------------------------------------------
		Authority aut = noticeService.takeAut((String)session.getAttribute("empNo"));
				
		mav.addObject("possible", aut.getAutNotice());
		//0 : user, 1: notice administrator
		//---------------------------------------------------------------------------------
		
		mav.addObject("notice", notice);
		mav.setViewName("notice/showNoticeForm");
		
		return mav;
	}
	@RequestMapping("updateNoticeForm.do")
	public ModelAndView updateNoticeForm(int notiSeq, HttpSession session){
		ModelAndView mav = new ModelAndView();
		Notice notice = noticeService.selectOne(notiSeq);
		mav.addObject("notice",notice);
		String empNo = (String)session.getAttribute("empNo");
		
		Authority aut = noticeService.takeAut(empNo);
		if(aut.getAutNotice() == 1){			
			mav.setViewName("notice/updateNoticeForm");
		}
		else{
			mav.setViewName("redirect:showNoticeListForm.do");
		}
		
		return mav;
	}
	@RequestMapping("updateNotice.do")
	public String updateNotice(HttpServletRequest req ,HttpSession session){
		int ntNo = 1;
		String ntNoCheck=req.getParameter("ntNoCheck");
		if(ntNoCheck == null){
			ntNo=0;
		}
		
		Notice notice = new Notice();
		String empNo = (String)session.getAttribute("empNo");
		notice.setEmpNo(empNo);		
		notice.setNotiSeq(Integer.parseInt(req.getParameter("notiSeq")));
		
		notice.setNtNo(ntNo);
		notice.setNotiTitle(req.getParameter("notiTitle"));
		notice.setNotiContent(req.getParameter("notiContent"));
		System.out.println(notice.toString());
		
		noticeService.updateNotice(notice);
		return "redirect:showNoticeListForm.do";
	}
	
	@RequestMapping("writeNoticeForm.do")
	public String writeNoticeForm() {
		return "notice/writeNoticeForm";
	}

	@RequestMapping("writeNotice.do")
	public String writeNotice(HttpServletRequest req, HttpSession session) {
		
		int ntNo = 1;
		String ntNoCheck=req.getParameter("ntNoCheck");
		
		if(ntNoCheck == null){
			ntNo=0;
		}
		
		Notice notice = new Notice();
		String empNo = (String)session.getAttribute("empNo");
		
			notice.setEmpNo(empNo);
			notice.setNtNo(ntNo);		
			notice.setNotiTitle(req.getParameter("notiTitle"));
			notice.setNotiContent(req.getParameter("notiContent"));	
			noticeService.insertNotice(notice);			
		
		return "redirect:showNoticeListForm.do";
	}
	@RequestMapping("deleteNotice.do")
	public String deleteNotice(HttpServletRequest req,HttpSession session){
		String empNo = (String)session.getAttribute("empNo");
		
		Authority aut = noticeService.takeAut(empNo);
		
		if(aut.getAutNotice() == 1){			
			noticeService.deleteNotice(Integer.parseInt(req.getParameter("notiSeq")));
		}
		
		return "redirect:showNoticeListForm.do";
	}
}
