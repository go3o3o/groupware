<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
	
<script type="text/javascript">
$(document).ready(function(){
	
	$('#emp_bottom').load('manageEmpForm.do?searchEmpNo='+'${employee.getEmpNo() }');
	
	$('button[name=hr_manage]').on('click', function(){
		
		// 1 : manageEmpForm.jsp	
		if($(this).attr('value') == 1) {
			$('#emp_bottom').load('manageEmpForm.do?searchEmpNo='+'${employee.getEmpNo() }');
		}
	
		// 2 : manageFamForm.jsp
		if($(this).attr('value') == 2) {
			$('#emp_bottom').load('manageFamForm.do?searchEmpNo='+'${employee.getEmpNo() }');
		}
		// 3 : manageRecordForm.jsp
		if($(this).attr('value') == 3) {
			$('#emp_bottom').load('manageRecordForm.do?searchEmpNo='+'${employee.getEmpNo() }');
		}
	});
});

function searchEmp(w, h) {
	var x = (screen.availWidth - w) / 2;
	var y = (screen.availHeight - h) / 2;

	window.open('searchEmpForm.do', 'window', 'width='+w+', height='+h+', left='+x+', top='+y);

}

</script>

<style type="text/css">

#img {
   width: 150px; height: 150px;
   object-fit: cover;
   object-position: top;
   border-radius: 50%;
   
}
#emp_infos {
	disploay : inline;
	width : 100%;
	height: 160px;
	margin: 20px;
}

#emp_img {
	display:inline;
	float: left;
	width: 15%;
	height: 160px;
}

#emp_info {
	display:inline;
	float: left;
	width: 80%;
	height: 120px;
	margin-left : 20px;
	margin-top: 30px;
}

.title1 {
	display: inline-block;
	font-weight: bold;
	width: 180px;
}

#emp_info > p {
	margin-bottom : 5px;
}

</style>


</head>
<body>

	<div id="emp_infos">
	<div id="emp_img">
	<input type="hidden" value="${employee.getEmpImg() }" name="empImg">
	<img id="img" src="empImg.do?empNo=${employee.getEmpNo() }">
	<a></a> <!-- 사진 수정 -->
	</div>
	
	<div id="emp_info">
	<p>
		<span class="title1">사원번호 | 근무상태</span>
		<input type="hidden" value="${employee.getEmpNo() }" name="empNo">
		
		${employee.getEmpNo() } | 
		<input type="hidden" value="${employee.getEmpStatus() }" name="empStatus">
		<c:if test="${employee.getEmpStatus() == 0 }">재직</c:if>
		<c:if test="${employee.getEmpStatus() == 1 }">휴직</c:if>
		<c:if test="${employee.getEmpStatus() == 2 }">퇴직</c:if>
	</p>
	<p>
		<span class="title1">이름</span>
		<input type="text" value="${employee.getEmpNm() }" name="empNm">
		<!-- 검색기능 -->
		<a href="javascript:searchEmp(800, 300)">
			<img src="jsp/hrSystem/img/search.png">
		</a>
	</p>
	<p>
		<span class="title1">원소속부서(직위 | 직책)</span>
			
		<input type="hidden" value="${employee.getDeptNo() }">
		<input type="hidden" value="${employee.getPosNo() }">
		<input type="hidden" value="${employee.getJobNo()}">

		${employee.getDeptNo() } (${position.getPosNm() } | ${job.getJobNm() })
	</p>
	<p>
		<span class="title1">직무</span>
		<input type="hidden" value="${employee.getEmpDuty() }">
		${employee.getEmpDuty() }
	</p>
	</div>
	
	</div>
	
	<div style="margin: 10px;">
		<button type="button" class="btn" name="hr_manage" value="1">사원정보</button>
		<button type="button" class="btn" name="hr_manage" value="2">가족정보</button>
		<button type="button" class="btn" name="hr_manage" value="3">발령이력</button>
	</div>
	<div id="emp_bottom">
		
	</div>
	

</body>
</html>