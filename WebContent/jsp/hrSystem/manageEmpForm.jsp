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

function updateEmp() {
	var empNo = $('#empNo');
	var empNm = $('#empNm');
	
	var empId = $('#empId');
	var empPw = $('#empPw');
	
	var deptNo = $('#deptNo');
	var posNo = $('#posNo');
	var jobNo = $('#jopNo');
	var empDuty = $('#empDuty');
	var empEmail = $('#empEmail');
	var comPhone = $('#comPhone');
	var empPhone = $('#empPhone');
	var empEmrPhone = $('#empEmrPhone');
	var empAddr = $('#empAddr');
	var empBirth = $('#empBirth');
	
	var empImg = $('#empImg');
	
	var data = {};
	data = {
			'empNo' : empNo.val(),
			'empNm' : empNm.val(),
			'deptNo' : deptNo.val(),
			'posNo' : posNo.val(),
			'jobNo' : jobNo.val(),
			'empDuty' : empDuty.val(),
			'comPhone' : comPhone.val(),
			'empPhone' : empPhone.val(),
			'empEmrPhone' : empEmrPhone.val(),
			'empEmail' : empEmail.val(),
			'empBirth' : empBirth.val(),
			'empAddr' : empAddr.val()			
	}
	
	
	
	$.ajax({
		url : 'updateEmp.do',
		success : function(data) {
			empNm.val(data.empNm);
			
		}
	})
	
	
	
}


$(document).ready(function() {
	var content_empNo = $('#content_empNo');
	var content_empNm = $('#content_empNm');
	var content_deptNm = $('#content_deptNm');
	var content_posNm = $('#content_posNm');
	var content_jobNm = $('#content_jobNm');
	
	var content_empDuty = $('#content_empDuty');
	var content_comPhone = $('#content_comPhone');
	var content_empPhone = $('#content_empPhone');
	var content_empEmrPhone = $('#content_empEmrPhone');
	var content_empEmail = $('#content_empEmail');
	
	var content_empBirth = $('#content_empBirth');
	var content_empAge = $('#content_empAge');
	var content_empAddr = $('#content_empAddr');
	
	var getEmpBirth = '${employee.getEmpBirth() }';
	var getEmpBirthYear = getEmpBirth.substr(0, 4);
	var getEmpBirthMonth = getEmpBirth.substr(5, 2);
	var getEmpBirthDay = getEmpBirth.substr(8, 2);
	var getEmpBirthDate = getEmpBirthYear+getEmpBirthMonth+getEmpBirthDay;
	
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	
	if(month < 10) {
		month = "0" + month;
	}
	if(day < 10) {
		day = "0" + day;
	}
	var today = year+""+month+""+day;
	
	
	var empBirth = (parseInt(today) - parseInt(getEmpBirthDate)) * 0.0001;
	
	// 1 : 읽기 권한
	if(${authority.get("AUTHR")} == 1) {
		content_empNm.text('${employee.getEmpNm()}');
		content_deptNm.text('${employee.getDeptNo()}');
		content_posNm.text('${position.getPosNm()}');
		content_jobNm.text('${job.getJobNm()}');
		
		content_empDuty.text('${employee.getEmpDuty()}');
		content_comPhone.text('${employee.getComPhone()}');
		content_empPhone.text('${employee.getEmpPhone()}');
		content_empEmrPhone.text('${employee.getEmpEmrPhone()}');
		content_empEmail.text('${employee.getEmpEmail()}');
		
		content_empBirth.text('${employee.getEmpBirth()}');
		content_empAge.text(Math.floor(empBirth));
		content_empAddr.text('${employee.getEmpAddr()}');
		
	}
	// 2 : 읽기/수정 권한
	if(${authority.get("AUTHR")} == 2) {
		
		$('#btns').append('<button type="button" class="btn" value="reset">리셋</button>'
				+'<button type="button" class="btn" id="modify" onclick="modifyEmp()">수정</button>');
		
		////////////////////////////////////////////////////////////////
		$('<input>').attr({
			'id' : 'empNm',
			'name' : 'empNm',
			'value' : '${employee.getEmpNm() }',
			'type' : 'text'
		}).appendTo(content_empNm);
		
		// 부서번호 = 회사번호 + 지사번호 만든 후 반영 ///////////////////////////////
		$('<input>').attr({
			'id' : 'deptNo',
			'name' : 'deptNo',
			'value' : '${employee.getDeptNo() }',
			'type' : 'text'
		}).text('${employee.getDeptNo()}').appendTo(content_deptNm);
	
		var inputDeptNo = $('#deptNo');

		
		$('#deptNo').after(function() {
			return $('<a>').attr({
				'id' :'deptSearch',
				'href' :'javascript:deptSearchFun()'
			}).append(
				$('<img>').attr({
				'src' : 'jsp/hrSystem/img/search.png'
				})	
			)
		});
		
		////////////////////////////////////////////////////////////////
				
		$('<select>').attr({
			'id' : 'posNo',
			'name' : 'posNo'
		}).html(
			'<option value=1>회장</option>'+
			'<option value=2>부회장</option>'+
			'<option value=3>사장</option>'+
			'<option value=4>부사장</option>'+
			'<option value=5>전무</option>'+
			'<option value=6>상무</option>'+
			'<option value=7>부장</option>'+
			'<option value=8>차장</option>'+
			'<option value=9>과장</option>'+
			'<option value=10>대리</option>'+
			'<option value=11>사원</option>'	
		).appendTo(content_posNm);
		// #posNo value값 == ${employee.getPosNo() }
		$('#posNo').val('${employee.getPosNo()}').attr('selected', 'selected');

		$('<select>').attr({
			'id' : 'jobNo',
			'name' : 'jobNo'
		}).html(
			'<option value=1>CEO</option>'+
			'<option value=2>CFO</option>'+
			'<option value=3>임원</option>'+
			'<option value=4>팀장</option>'+
			'<option value=5>본부장</option>'+
			'<option value=6>지점장</option>'+
			'<option value=7>PM장</option>'+
			'<option value=8>파트장</option>'+
			'<option value=9>팀원</option>'
		).appendTo(content_jobNm);
		// #jobNo value값 == ${employee.getJobNo()}
		$('#jobNo').val('${employee.getJobNo()}').attr('selected', 'selected');
		
		$('<input>').attr({
			'id' : 'empDuty',
			'name' : 'empDuty',
			'value' : '${employee.getEmpDuty()}',
			'type' : 'text'
		}).appendTo(content_empDuty);
		
		$('<input>').attr({
			'id' : 'comPhone',
			'name' : 'comPhone',
			'value' : '${employee.getComPhone()}',
			'type' : 'text'
		}).appendTo(content_comPhone);
		
		$('<input>').attr({
			'id' : 'empPhone',
			'name' : 'empPhone',
			'value' : '${employee.getEmpPhone()}',
			'type' : 'text'
		}).appendTo(content_empPhone);
		
		$('<input>').attr({
			'id' : 'empEmrPhone',
			'name' : 'empEmrPhone',
			'value' : '${employee.getEmpEmrPhone()}',
			'type' : 'text'
		}).appendTo(content_empEmrPhone);
		
		$('<input>').attr({
			'id' : 'empEmail',
			'name' : 'empEmail',
			'value' : '${employee.getEmpEmail()}',
			'type' : 'text'
		}).appendTo(content_empEmail);
		
		$('<input>').attr({
			'id' : 'empBirth',
			'name' : 'empBirth',
			'value' : '${employee.getEmpBirth()}',
			'type' : 'text'
		}).appendTo(content_empBirth);

		content_empAge.text(Math.floor(empBirth));
		
		$('<input>').attr({
			'id' : 'empAddr',
			'name' : 'empAddr',
			'value' : '${employee.getEmpAddr()}',
			'type' : 'text',
			'style' : 'width : 730px;'
		}).appendTo(content_empAddr);
		
	}
});

function deptSearchFun() {
		
}

function modifyEmp() {
	
	var empImg = $('#empImg').val();
	var empNo = $('#empNo').val();
	var empNm = $('#empNm').val();
	var empDuty = $('#empDuty').val();
	var deptNo = $('#deptNo').val();
	var posNo = $('#posNo').val();
	var comPhone = $('#comPhone').val();
	var empPhone = $('#empPhone').val();
	var empEmrPhone = $('#empEmrPhone').val();
	var empEmail = $('#empEmail').val();
	var empBirth = $('#empBirth').val();
	var empAddr = $('#empAddr').val();
	
}

</script>

<style type="text/css">

	#emp_bottom {
		margin: 10px;	
	}
	
	#emp1 {
		width: 100%;
	}
	
	#btns {
		position: relative;
		top : -50px;
		float:right;
	}
	
	.title {
		display: inline-block;
		font-weight: bold;
		width: 100px;
	}
	
	.emp_content {
		display: inline-block;
		width: 180px;
		height: 22px;
		margin-bottom: 5px;
	}
	.emp_content > input[type=text] {
		width : 150px;
	}
	
	#emp2 {
		width: 95%;
	}

	#empAddr {
		width : 850px;
	}
	
	
</style>

</head>
<body>

<div id="emp_bottom">

<div id="emp1">
	<div id="btns">
	</div>
	
	<div id="emp1_line1">

		<span class="title">사원번호</span>
		<span id="content_empNo" class="emp_content">
			<input type="hidden" id="empNo" name="empNo" value="${employee.getEmpNo() }">
			${employee.getEmpNo() }
			<input type="hidden" id="empId" name="empId" value="${employee.getEmpId() }">
		</span>


		<span class="title">원소속부서</span>
		<span id="content_deptNm" class="emp_content">
		</span>


		<span class="title">직위</span>
		<span id="content_posNm" >
		</span>
	
	</div>
		
	<div id="emp1_line2">
		<span class="title">사원명</span>
		<span id="content_empNm" class="emp_content">	
		</span>
		
		<span class="title">직무</span>
		<span id="content_empDuty" class="emp_content">
		</span>
		
		<span class="title">직책</span>
		<span id="content_jobNm" >
		</span>
	
	</div>
	
</div>

<hr>

<div id="emp2">

		<span class="title">사내번호</span>
		<span id="content_comPhone" class="emp_content">		
		</span>

		<span class="title">연락처</span>
		<span id="content_empPhone" class="emp_content">		
		</span>

		<span class="title">비상연락처</span>
		<span id="content_empEmrPhone" class="emp_content">		
		</span>

		<span class="title">이메일</span>
		<span id="content_empEmail" class="emp_content">		
		</span>
	
		<span class="title">생년월일</span>
		<span id="content_empBirth" class="emp_content">		
		</span>

		<span class="title">나이(만)</span>
		<span id="content_empAge" class="emp_content">		
		</span>

		<span class="title">주소</span>
		<span id="content_empAddr" class="emp_content">		
		</span>

</div>

</div>

</body>
</html>