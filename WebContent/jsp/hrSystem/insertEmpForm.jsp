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
		
		$('input[name=empId]').each(function(index, item){
			var value = $(this).val();
			empIds.push(value);
		});
		$('input[name=empPw]').each(function(index, item) {
			var value = $(this).val();
			if(value.length == 0) {
				value = '1234qwer@';
			}
			empPws.push(value);
		});
		$('input[name=empNm]').each(function(index, item) {
			var value = $(this).val();
			empNms.push(value);
		});
		$('select[name=jobNo]').each(function(index, item) {
			var value = $(this).val();
			jobNos.push(value);
		});
		$('select[name=posNo]').each(function(index, item) {
			var value = $(this).val();
			posNos.push(value);
		});
		$('input[name=deptNo]').each(function(index, item) {
			var value = $(this).val();
			deptNos.push(value);
		});
		$('input[name=empEmail]').each(function(index, item) {
			var value = $(this).val();
			empEmails.push(value);
		});
		$('input[name=empAddr]').each(function(index, item) {
			var value = $(this).val();
			empAddrs.push(value);
		});
		$('input[name=empBirth]').each(function(index, item) {
			var value = $(this).val();
			empBirths.push(value);
		});
		$('input[name=empJoinDt]').each(function(index, item) {
			var value = $(this).val();
			empJoinDts.push(value);
		});
		
		insertEmpNext(empIds, empPws, empNms, jobNos, posNos, deptNos, empEmails, empAddrs, empBirths, empJoinDts);
	}
	
	function insertEmpNext(empIds, empPws, empNms, jobNos, posNos, deptNos, 
			empEmails, empAddrs, empBirths, empJoinDts) {

		var data = {
			'empIds' : empIds,
			'empPws' : empPws,
			'empNms' : empNms,
			'jobNos' : jobNos,
			'posNos' : posNos,
			'deptNos' : deptNos,
			'empEmails' : empEmails,
			'empAddrs' : empAddrs,
			'empBirths' : empBirths,
			'empJoinDts' : empJoinDts
		}

		$('#insertEmpForm').load("insertEmpFormNext.do", data);
		
	}

	function addRow() {
		var rowCnt = $('#insertTable > tbody tr').length
		var firstTd = $('#insertTable > tbody > tr:last > td:last');
		var lastTr = $('#insertTable > tbody > tr:last');
		
		var jobNoStr = ("<td>"+"<select id='jobNo' name ='jobNo'>"
						+"<option value='1'>CEO</option>"
						+"<option value='2'>CFO</option>"
						+"<option value='3'>임원</option>"
						+"<option value='4'>팀장</option>"
						+"<option value='5'>본부장</option>"
						+"<option value='6'>지점장</option>"
						+"<option value='7'>PM장</option>"
						+"<option value='8'>파트장</option>"
						+"<option value='9'>팀원</option>"
						+"</select></td>");
		
						
		var posNoStr = ("<td>"+"<select id='posNo' name ='posNo'>"
						+"<option value='1'>회장</option>"
						+"<option value='2'>부회장</option>"
						+"<option value='3'>사장</option>"
						+"<option value='4'>부사장</option>"
						+"<option value='5'>전무</option>"
						+"<option value='6'>상무</option>"
						+"<option value='7'>부장</option>"
						+"<option value='8'>차장</option>"
						+"<option value='9'>과장</option>"
						+"<option value='10'>대리</option>"
						+"<option value='11'>사원</option>"
						+"</select></td>");

		if (rowCnt > 0) {
			firstTd.after('<td><input class="insertEmpList" type="date" id="empJoinDt" name="empJoinDt"></td>')
				.after('<td><input class="insertEmpList" type="date" id="empBirth" name="empBirth"></td>')
				.after('<td><input class="insertEmpList" type="text" id="empAddr" name="empAddr" size="50px"></td>')
				.after('<td><input class="insertEmpList" type="text" id="empEmail" name="empEmail"></td>')
				.after('<td><input class="insertEmpList" type="text" id="deptNo" name="deptNo"></td>')
				.after(jobNoStr)
				.after(posNoStr)
				.after('<td><input class="insertEmpList" type="text" id="empNm" name="empNm"></td>')
				.after('<td><input class="insertEmpList" type="text" id="empPw" name="empPw"></td>')
				.after('<td><input class="insertEmpList" type="text" id="empId" name="empId"></td>')
				.after('<td name="rowCnt" style="width:20px; text-align:center;">' + rowCnt + '</td>');

			firstTd.html('<button class="btn" style="width : 30px; height : 30px; padding:2px;" type="button" id="delete-row" onclick="deleteRow(this)">-</button>');

			lastTr.after('<tr><td><button type="button">+</button></td></tr>');
			$('#insertTable > tbody > tr:last > td:first > button')
				.attr({
					'id' : 'add-row',
					'onclick' : 'addRow()',
					'class' : 'btn',
					'style' : 'width : 30px; height : 30px; padding:2px;'
				});

		} else {
			var restTr = lastTr.clone();
		}

	}
	;

	function deleteRow(obj) {
		var tr = $(obj).parent().parent();
		tr.remove();
	};

	$(document).ready(function() {
		
	});
</script>
<style type="text/css">

#insertEmpForm {
	width: 1050px;
}
#insertEmpTop {
	display: inline-block;
	margin: 10px;
	width: 95%;
	height: 70px;
}
#btns {
	position: relative;
	top: -35px;
	display: inline-block;
	float: right;
}

#insertTable{
	width: auto;
}

thead th {
	width: 10%;
	text-align: center;
}

.insertEmpList {
	text-align: center;
	width:90%;
}

.btn {
	margin: 5px;
}


</style>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="jsp/hrSystem/css/style_hr.css" rel="stylesheet">

</head>
<body>
<div id="wrap">
<div id="insertEmpForm">
		<div id="insertEmpTop">
			<div style="font-size: 25px; font-weight: bold; margin: 10px;">입사</div>
			<div id="btns">
			<button class="btn" type="button">양식 다운로드</button>
			<button class="btn" type="button">업로드</button>
			</div>
		</div>
		<table id="insertTable">
			<thead>
				<tr>
					<th style="width: 20px;"></th>
					<th style="width: 20px;">No.</th>
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
				</tr>
			</thead>
			<tbody>
				<tr id="empList">
					<td><button class="btn" type="button" id="add-row" onclick=addRow() style="width : 30px; height : 30px; padding:2px;">+</button></td>
				</tr>
			</tbody>
		</table>
	</div>
		<div>
			<button class="btn" type="button" onclick="insertEmpArr()" > 다음 </button>
			${msg }
		</div>
</div>
</body>
</html>