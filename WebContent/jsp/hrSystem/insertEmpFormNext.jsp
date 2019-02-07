<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	
	function insertEmpArr() {
		var empNos = [];
		var empIds = [];
		var empPws = [];
		var empNms = [];
		var jobNos = [];
		var posNos = [];
		var deptNos = [];
		var empEmails = [];
		var empAddrs = [];
		var empBirths = [];
		var empJoinDts = [];
		var empJoinDocs = [];
		
		$('td[name=empNo]').each(function(index, item) {
			var value = $(this).text();
			if(value.length == 0) {
				value = '';
			}
			empNos.push(value);
		});
		$('td[name=empId]').each(function(index, item) {
			var value = $(this).text();
			if(value.length == 0) {
				value = '';
			}
			empIds.push(value);
		});
		$('td[name=empPw]').each(function(index, item) {
			var value = $(this).text();
			if(value.length == 0) {
				value = '1234qwer@';
			}
			empPws.push(value);
		});
		$('td[name=empNm]').each(function(index, item) {
			var value = $(this).text();
			if(value.length == 0) {
				value = '';
			}
			empNms.push(value);
		});
		$('input[type="hidden"][name=jobNo]').each(function(index, item) {
			var value = $(this).val();
			if(value.length == 0) {
				value = 0;
			}
			jobNos.push(value);
		});
		$('input[type="hidden"][name=posNo]').each(function(index, item) {
			var value = $(this).val();
			if(value.length == 0) {
				value = 0;
			}
			posNos.push(value);
		});
		$('td[name=deptNo]').each(function(index, item) {
			var value = $(this).text();
			if(value.length == 0) {
				vvalue = '';
			}
			deptNos.push(value);
		});
		$('td[name=empEmail]').each(function(index, item) {
			var value = $(this).text();
			if(value.length == 0) {
				value = '';
			}
			empEmails.push(value);
		});
		$('td[name=empAddr]').each(function(index, item) {
			var value = $(this).text();
			if(value.length == 0) {
				value = '';
			}
			empAddrs.push(value);
		});
		$('td[name=empBirth]').each(function(index, item) {
			var value = $(this).text();
			if(value.length == 0) {
				value = '';
			}
			empBirths.push(value);
		});
		$('td[name=empJoinDt]').each(function(index, item) {
			var value = $(this).text();
			if(value.length == 0) {
				value = '';
			}
			empJoinDts.push(value);
		});
		$('td[name=empJoinDoc]').each(function(index, item) {
			var value = $(this).text();			
			if(value.length == 0) {
				value = '';
			}
			empJoinDocs.push(value);
		});
		insertEmp(empNos, empIds, empPws, empNms, jobNos, posNos, deptNos, empEmails, empAddrs, empBirths, empJoinDts, empJoinDocs);
	}
	
	function insertEmp(empNos, empIds, empPws, empNms, jobNos, posNos, deptNos, 
			empEmails, empAddrs, empBirths, empJoinDts, empJoinDocs) {
		
		var insertData = {
				'empNos' : empNos,
				'empIds' : empIds,
				'empPws' : empPws,
				'empNms' : empNms,
				'jobNos' : jobNos,
				'posNos' : posNos,
				'deptNos' : deptNos,
				'empEmails' : empEmails,
				'empAddrs' : empAddrs,
				'empBirths' : empBirths,
				'empJoinDts' : empJoinDts,
				'empJoinDocs' : empJoinDocs
		}
		
		$('#insertEmpFormNext').load("insertEmp.do", insertData);
	}
	
	function prePage() {
		
	}

	$(document).ready(function(){
		var list = $('#list');
		var empList = ${empList};
		
		
		for(var i = 0; i < empList.length; i++) {
			var tr = $('<tr>');
			var num = i + 1;
			$('<td>').text(num).appendTo(tr);
			$('<td class="insertEmpList" name="empNo">').text(empList[i].empNo).appendTo(tr);
			$('<td class="insertEmpList" name="empId">').text(empList[i].empId).appendTo(tr);
			$('<td class="insertEmpList" name="empPw">').text(empList[i].empPw).appendTo(tr);
			$('<td class="insertEmpList" name="empNm">').text(empList[i].empNm).appendTo(tr);
			
			$('<input type="hidden" name="jobNo" value="'+empList[i].jobNo+'">').appendTo(tr);
			$('<td class="insertEmpList">').text(empList[i].jobNm).appendTo(tr);
			
			$('<input type="hidden" name="posNo" value="'+empList[i].posNo+'">').appendTo(tr);
			$('<td class="insertEmpList">').text(empList[i].posNm).appendTo(tr);
			$('<td class="insertEmpList" name="deptNo">').text(empList[i].deptNo).appendTo(tr);
			
			$('<td class="insertEmpList" name="empEmail">').text(empList[i].empEmail).appendTo(tr);
			$('<td class="insertEmpList" name="empAddr">').text(empList[i].empAddr).appendTo(tr);
			$('<td class="insertEmpList" name="empBirth">').text(empList[i].empBirth).appendTo(tr);
			$('<td class="insertEmpList" name="empJoinDt">').text(empList[i].empJoinDt).appendTo(tr);
			$('<td class="insertEmpList" name="empJoinDoc"><input type="file"></input></td>').appendTo(tr);
			list.append(tr);
		}
		
	});
	
</script>

<style type="text/css">
#insertEmpTop {
	display: inline-block;
	margin: 10px;
	width: 95%;
	height: 70px;
}

#insertTable{
	width: 1050px;
}

thead th {
	width: 10%;
	text-align: center;
}

.insertEmpList {
	text-align: center;
	width:120px;
}


</style>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="jsp/hrSystem/css/style_hr.css" rel="stylesheet">

</head>
<body>
<div id="insertEmpFormNext">
<div id="insertEmpTop">
	<div style="font-size: 25px; font-weight: bold; margin: 10px;">입사</div>
</div>	

<table id="insertTable">
	<thead>
		<tr>
			<th style="width: 20px;">No.</th>
			<th>사원번호</th>
			<th>계정ID</th>
			<th>비밀번호</th>
			<th>사원명</th>
			<th>직위</th>
			<th>직책</th>
			<th>부서번호</th>
			<th>이메일</th>
			<th>주소</th>
			<th>생년월일</th>
			<th>입사일자</th>
			<th>입사서류</th>
		</tr>
	</thead>
	<tbody id="list">
		
	</tbody>
</table>


<div>
	<button class="btn" type="button" onclick=prevPage()>이전</button>
	<button class="btn" type="button" onclick=insertEmpArr()>확인</button>
	<div>${msg }</div>
</div>



</div>
</body>
</html>