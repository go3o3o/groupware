<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find Password</title>

<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 400px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        width:250px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
      #msg{
      	font-size:12px;
      	color:red;
      	text-align:center;
      }

    </style>

</head>
<body>
<center>
<p id="msg">${ resultMsg}</p>
    <div class="container">
      <form action="findPassword.do" class="form-signin">
       	<h2 class="form-signin-heading"><span class="glyphicon glyphicon-question-sign" aria-hidden="true">비밀번호찾기</h2>
       	<br>
       	<input type="text" class="input-block-level" name="empNo" placeholder="사원번호ex:MS20181212001">
       	<input type="text" class="input-block-level" name="email" placeholder="e-mail">
       	<div class="well">
        	<p>사원번호와 메일주소를 입력하시면,<br>등록된 메일주소로 비밀번호를 전송해 드리겠습니다.</p>
		</div>
       	<button class="btn btn-large btn-primary" type="submit">메일발송</button>
       	<br>
       	<br>
       	<a href='loginForm.do'>로그인으로</a>       	
       	<br>
      </form>
    </div>
</center>

</body>
</html>