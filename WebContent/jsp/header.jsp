<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="css/style.css?=1" rel="stylesheet">
    
    
    <script type="text/javascript">
    function ajaxTest(){
        $.ajax({
          type : "GET",
          url : "test.jsp",
          dataType : "text",
          error : function() {
            alert('통신실패!!');
          },
          success : function(data) {
            $('#Context').html(data);
          }
   
        });
      }
    </script>
    
  </head>
<body>

<div id="wrap">

<!-- 헤더시작 -->
<header id="header">
   <div id="navi">     
   <!--로고 -->
   <p id="logo"><a href="main.do" style='color:white;'>MS그룹</a></p>
   <!--상단메뉴 -->
	   <!--검색버튼(180228추가) -->
   	   <form class="navbar-form navbar-left" role="search">
    		<div id="msSearch" class="form-group">
              <input type="text" class="form-control" placeholder="Resource Search">
 	          <button type="submit" class="btn btn-default">Submit</button>
            </div>
	   </form>
	   
   <ul class="gnbMenu">
     <li><span style="text-decoration:none">${ empName}님 접속중</span></li>
     <li><a href="logout.do">로그아웃</a></li>
	</ul>
   </div>
          
</header>
<!-- 헤더 끝 -->
<!-- 메뉴리스트 시작 -->
  <!--오른쪽 전체메뉴 -->
  <div class="container-fluid">
    <div class="navbar-header">
       <ul class="nav navbar-nav">     
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">전체메뉴(드롭다운)<b class="caret"></b></a>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
            <li><a href="#">3-1번 메뉴</a></li>
            <li><a href="#">3-2번 메뉴</a></li>
            <li><a href="#">3-3번 메뉴</a></li>
            <li class="divider"></li>
            <li class="dropdown-header">네비게이션 헤더</li>
            <li><a href="#">3-4번 메뉴</a></li>
            <li><a href="#">3-5번 메뉴</a></li>
          </ul>
        </li>
      </ul>
    </div>
	<!--왼쪽메뉴 -->
	
    <div>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="showNoticeListForm.do">NEWS</a></li>
        <li><a href="showEdocumentList.do">전자결재</a></li> 
        <li><a href="mainDuty.do">업무</a></li> 
        <li><a href="#">마이페이지</a></li> 
      </ul>
    </div>
  </div>

</div>
</body>
</html>