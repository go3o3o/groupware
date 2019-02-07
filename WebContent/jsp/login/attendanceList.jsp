<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>attendance List</title>
<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>	
	<style>
		#wrapper{
			width:800px;
			margin : 0px auto;
			margin-top:50px;
		}
		#profile_user{
			width : 300px;			
		}
		th{
			background-color : #e8eaed;
		}
		#title{
			font-size:20px bold black;
		}
		#text{
			font-size:14px;
		}
	</style>
</head>
<body>
	
<div id="wrapper">
	
	<div class="page-header">
  		<h1 id="title">출퇴근정보 리스트 <small id="text">현재 로그인 되어있는 사원의 출퇴근 기록을 표시합니다.</small></h1>
	</div>
		
	■ 사원정보
	<table class ="table" id = "profile_user">
		<tr>
			<th>사원번호</th>
			<td>${empNo }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${empName } 님</td>
		</tr>		
		<tr>
			<th>출근일수</th>
			<td>${fn:length(result)}일</td>
		</tr>		
	</table>

	■ 출퇴근정보
	<table class ="table">
		<thead>
			<tr>
				<th>일자</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
				<th>ip주소</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="Attendance_Record" items="${result}">
				<tr>
					<td>
						<fmt:formatDate value="${Attendance_Record.atdDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<fmt:formatDate value="${Attendance_Record.atdOnTime}" pattern="HH:mm:ss"/>
					</td>
					<td>
						<fmt:formatDate value="${Attendance_Record.atdOffTime}" pattern="HH:mm:ss"/>			
					</td>
					<td>${Attendance_Record.ipAddr}</td>
					<td>${Attendance_Record.atdSt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="text-center">
		<input type="button" value="back" class="btn btn-default" onclick="location.href='main.do'">
		<br>
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
		</ul>
	</div>
	
</div>

</body>
</html>