<%@ page language="java" 
contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
  src="https://code.jquery.com/jquery-3.3.0.js"
  integrity="sha256-TFWSuDJt6kS+huV+vVlyV1jM3dwGdeNWqezhTxXB/X8="
  crossorigin="anonymous"></script>
  <script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<link href="../css/style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="wrap">                  
		<div id="container">

			<form  method="post" action="writeNotice.do">
			
				<table border="20px">
					<tr>
						<td>제목</td>
						<td><input type="checkbox" id="ntNoCheck" name="ntNoCheck">중요</td>
						<td><input type="text" name="notiTitle" id="notiTitle"></td>
					</tr>
					<tr>
						<td colspan="2">파일첨부</td>
						<td><input type="file" name="notiFile" id="notiFile"></td>
					</tr>
					<tr>
						<td colspan="3"><textarea name="notiContent" id="notiContent"></textarea></td>
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