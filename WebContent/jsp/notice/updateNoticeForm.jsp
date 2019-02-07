<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div id="wrap">                  
		<div id="container">
			<form id="noticeForm" method="post" action="updateNotice.do">
			
				<table border="20px">
					<tr>
						<td>제목</td>
						<td>
						<c:choose>
							<c:when test="${notice.ntNo == 1}">
								<input type="checkbox" id="ntNoCheck" name="ntNoCheck" checked></c:when>
							<c:otherwise>
								<input type="checkbox" id="ntNoCheck" name="ntNoCheck">
							</c:otherwise>
						</c:choose>
						중요</td>
						<td><input type="text" name="notiTitle" id="notiTitle" value="${notice.notiTitle }"></td>
					</tr>
					<tr>
						<td>번호 <input type="text" readonly value="${notice.notiSeq }" id="notiSeq" name="notiSeq"></td>
						<td>파일첨부</td>
						<td><input type="file" name="notiFile" id="notiFile" value="${notice.notiFile }"></td>
					</tr>
					<tr>
						<td colspan="3"><textarea name="notiContent" id="notiContent">
						${notice.notiContent }</textarea></td>
					</tr>
					<tr>
						<td colspan="3" align="right">
						<input type="button" value="목록" onClick="location.href='showNoticeListForm.do'"> 
							<input type="submit" value="등록"></td>
					</tr>
				</table>			
			</form>
		</div>
	<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>