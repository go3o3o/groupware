<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>

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
        max-width: 300px;
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
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
      #msg{
      	font-size:12px;
      	color:red;
      }

    </style>

</head>
<body>

<center>
<p id="msg">${msg }</p>


    <div class="container">
      <form action="login.do" class="form-signin" method="POST">
       	<h2 class="form-signin-heading">사원로그인</h2>
       	<input type="text" class="input-block-level" name="empNo" placeholder="사원번호">
       	<input type="password" class="input-block-level" name="empPw" placeholder="비밀번호">
       	<label class="checkbox">
        	<input type="checkbox" value="remember-me"> remember me
       	</label>
       	<button class="btn btn-large btn-primary" type="submit">Log-in</button>
       	<br>
       	<br>
       	<a href='findPasswordForm.do'>비밀번호 찾기</a>
      </form>
    </div>

</form>
</center>

</body>
</html>