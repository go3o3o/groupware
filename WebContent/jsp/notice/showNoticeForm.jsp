<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Notice</title>

    <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet">
  </head>
<body>
<jsp:include page="../header.jsp" />
	<div id="wrap">
		<div id="container">
				<div class="page-header">
  					<h3>등록 <small id="text">공지사항 글 작성 폼 </small></h3>
				</div>
				<table border="20px">
					<tr>
						<td><b>${notice.notiTitle }</b></td>
						<td>${notice.notiIn }</td>
					</tr>
					<tr>
						<td colspan="2" align="right">파일첨부</td>
					</tr>	
					<tr>
						<td colspan="3"><textarea name="notiContent" id="notiContent" 
						readonly="readonly">${notice.notiContent }</textarea></td>
					</tr>
					<tr>
						<td colspan="3" align="right">						
						<input type="button" value="목록" onClick="location.href='showNoticeListForm.do'"> 
							<c:if test="${possible eq 1}">
								<input type="button" value="수정" 
								onClick="location.href='updateNoticeForm.do?notiSeq=${notice.notiSeq}'">
								<input type="button" value="삭제" 
								onClick="location.href='deleteNotice.do?notiSeq=${notice.notiSeq}'">
							</c:if>
						</td>
					</tr>
				</table>	
		</div>
	<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>