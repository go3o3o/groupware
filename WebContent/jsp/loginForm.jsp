<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>

<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous">
</script>

</head>
<body>

<center>
<h1>로그인</h1><br>
${msg }

<form action="login.do">
<table class="input">
	<tr>
		<td width="150px" align="center">아이디</td>
		<td width="150px" align="center"><input type="text" name="id" placeholder="admin" autocomplete="off"></td>
	</tr>
	<tr>
		<td width="150px" align="center">비밀번호</td>
		<td width="150px" align="center"><input type="password" name="pw"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="login"></td>
	</tr>
</table>
</form>
</center>

</body>
</html>