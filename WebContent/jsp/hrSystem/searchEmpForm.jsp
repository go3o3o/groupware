<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원검색</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
function searchEmp() {

	var tbody = $('#searchResult > tbody');
	$('#searchResult > tbody > tr[class=result]').remove();
	
	var empNm = $('#empNm').val();
	var empStatus = $('#empStatus').val()
	var empStatusResult = '';
	
	$.ajax({
		url : 'searchEmp.do',
		data : {
			empNm : empNm,
			empStatus : empStatus
		},
		dataType : 'json',
		type : 'post',
		type : 'get',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data) {

			for(var i in data) {
				
				var checkBtn = $('<input type="checkbox" name="empCheck" onclick="empCheck()"></input>');
				var tr = $('<tr class="result">');
				var td = $('<td>');
				
				checkBtn.appendTo(tr);
				$('<input>').attr({
					'type' : 'hidden',
					'value' : data[i].empNo,
					'name' : 'empNo',
					'id' : 'empNo'
				}).appendTo($('<td>')).appendTo(tr);
				$('<td>').text(data[i].deptNo).appendTo(tr);
				$('<td>').text(data[i].empNm).appendTo(tr);
				$('<td>').text(data[i].position.posNm).appendTo(tr);
				$('<td>').text(data[i].job.jobNm).appendTo(tr);
				if(data[i].empStatus == 0) {
					empStatusResult = '재직';
				}
				if(data[i].empStatus == 1) {
					empStatusResult = '휴직';
				}
				if(data[i].empStatus == 2) {
					empStatusResult = '퇴직';
				}
				$('<td>').text(empStatusResult).appendTo(tr);
				
				tbody.append(tr);	
			}
		}
	});
	
}

function searchEmpForm() {
	var empNo = '';
	
	$('input[type="checkbox"][name="empCheck"]').each(function(i) {
		if(this.checked) {
			empNo = $('input[type="hidden"][name="empNo"]').eq(i).val();
			
			var w = 1300;
			var h = 800;
			
			var x = (screen.availWidth - w) / 2;
	    	var y = (screen.availHeight - h) / 2;
	    	var hrDuty = 1;
	    	var hrManage = 1;
			
			window.open('hrSystemForm2.do?searchEmpNo='+empNo, 'pop','status = no, width='+w+', height='+h+', left='+x+', top='+y);
			self.close();
		}
	})
	
}

function empCheck() {
	  $('input[type="checkbox"][name="empCheck"]').click(function(){
	        //클릭 이벤트 발생한 요소가 체크 상태인 경우
	        if ($(this).prop('checked')) {
	            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
	            $('input[type="checkbox"][name="empCheck"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
}

$(document).ready(function() {

});


</script>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="jsp/hrSystem/css/style_hr.css" rel="stylesheet">

<style type="text/css">
#searchEmpForm {
	text-align: center;
}
#searchResult {
	border-bottom: 2px solid lightgray;
	border-top: 2px solid lightgray;
	width: 60%;
	margin: auto;
	text-align: center;
}
#searchResult > thead > tr > th {
	text-align: center;
	height: 34px;
}
#searchResult > tbody > tr > td {
	text-align: center;
	height: 34px;
}

button[class=btn] {
	margin: 10px;
}

</style>

</head>

<body>

<div id="searchEmpForm">
	<div id="searchForm">
		<select id="empStatus">
			<option value="0" selected="selected">재직자</option>
			<option value="1">휴직자</option>
			<option value="2">퇴직자</option>
			<option value="3">전체</option>
		</select> 
		<input type="text" name="empNm" id="empNm">
		<button class="btn" type="button" onclick="searchEmp()">조회</button>
	</div>
	<div id="searchList">
		<table id="searchResult">
			<thead>
			<tr>
				<th>체크박스</th>
				<th>원소속부서</th>
				<th>이름</th>
				<th>직위</th>
				<th>직책</th>
				<th>근무상태</th>
			</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
	</div>
		<button class="btn" type="button" onclick="searchEmpForm()">확인</button>
</div>
</body>
</html>