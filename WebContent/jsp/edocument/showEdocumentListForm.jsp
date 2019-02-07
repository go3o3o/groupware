<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>메인페이지</title>

    <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="./css/style.css?=2" rel="stylesheet">

  </head>


<body>

<jsp:include page="../header.jsp" />
<div id="wrap">
<div id="container">	
	<section id="right" align="center">
		<section id="title" align="left">
		<h4>■받은 문서</h4>
		<input type="button" onclick="location.href='showEdocumentForm.do'" value="문서작성" >

		</section>
		<article id="substance" class="firstline">
		<table id=tables border=1px solid black;>
			<tr align="center">
				<th width="40">선택</th>
				<th width="70">No.</th>
				<th width="180">제목</th>
				<th width="100">기안자</th>
				<th width="180">작성일자</th>
				<th width="140">진행상황</th>
			</tr>
			
			<c:forEach items="${edocList}" var="dlist">
			<tr>
				<td><input type="checkbox"></td>
				<td>${dlist.edNo}</td>
				<td  onclick="location.href='showView.do?edNo=${dlist.edNo}'">${dlist.edTitle}</td>
				
				<td>${dlist.empNo }</td>
				<td>${dlist.edIn }</td>
				<td>${dlist.perCurNo}</td>
			</tr>
			</c:forEach>
		</table>
		
		</article>
		<table align="center">
			<tr>
			<c:if test="${start!=1 }">
			<td><a href="showEdocumentListForm.do?page=1">[처음]</a></td>
			<td><a href="showEdocumentListForm.do?page=${start-1}">[이전]</td>
			</c:if>
			
			<c:forEach begin="${start }" end="${end<last?end:last }" var="i">
				<c:choose>
					<c:when test="${i==current }">
						<td><b>[${i} ]</b></td>
					</c:when>
					<c:otherwise>
						<td><a href="showEdocumentListForm.do?page=${i}">[${i}]</a></td>
					</c:otherwise>
				</c:choose>			
			</c:forEach>
			<c:if test="${end<last }">
				<td><a href="showEdocumentListForm.do?page=${end+1 }">[다음]</a></td>
				<td><a href="showEdocumentListForm.do?page=${last}">[마지막]</a></td>
			</c:if>
			<table align="center">
					<td>
						<input type="date" id="StartDate">
						<input type="date" id="endDate">
						
						<input type="text" name="keyword"> <input type="submit"
					value="검색"></td>
					</td>
			</table>
		</tr>
		</table>
		

	</section>
</div>
	<jsp:include page="../footer.jsp" />
</div>


</body>
</html>
