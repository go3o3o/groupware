<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Notice</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- Custom styles for this template -->
<link href="./css/style.css" rel="stylesheet">

<style type="text/css">
	.table{
		text-align:center;
	}
	th:nth-child(3){
		text-align:center;
		width : 450px;
	}
	th:nth-child(5){
		text-align:left;
		width : 20px;
	}
	tr{
		text-align:left;
	}
</style>

</head>


<body>
	<jsp:include page="../header.jsp" />
	<div id="wrap">
		<div id="container">
								
				<div class="page-header">
  					<h3>NEWS <small id="text">최신 공지사항</small></h3>
				</div>
				
				<table class="table table-striped" border="20px">
					<tr>
						<th><span>번호</span></th>
						<th>상태</th>
						<th>제목</th>
						<th>작성일자</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="notice" items="${notice }">
					<tr>
						<td><span>${notice.notiSeq}</span></td>	
						<td><span>
						<c:choose>
						<c:when test="${notice.ntNo eq 0}">보통</c:when>
						<c:otherwise>긴급</c:otherwise>
						</c:choose>
						</span></td>						
						<td><span>
						<a href="showNoticeForm.do?notiSeq=${notice.notiSeq}">${notice.notiTitle}</a>
						</span></td>
						<td><span>${notice.notiIn}</span></td>
						<td><span>${notice.notiCnt}</span></td>
					</tr>
					</c:forEach>
					<tr><td colspan="4" align="center">
						<jsp:include page="../paging.jsp" flush="true">
						    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
						    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
						    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
						    <jsp:param name="pageNo" value="${paging.currentPageNo}" />
						    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
						    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
						    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
						</jsp:include>
					</td>
						<td align="right">
						<c:if test="${possible eq 1}">
						<input type="button" class="btn btn-default" id="writeNoticeForm" value="글작성" 
						onclick="location.href='writeNoticeForm.do'">
						</c:if>
						</td>
					</tr>
				</table>
		</div>
	<jsp:include page="../footer.jsp" />
	</div>



</body>
</html>
