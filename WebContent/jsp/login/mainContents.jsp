<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Custom styles for this template -->
<link href="./css/style.css?ver=6" rel="stylesheet">
    
<!-- 제이슨으로 값 가져오기 -->
<script type="text/javascript">
$(document).ready(function(){
			
	var btn = document.getElementById('ok');
	var select = document.getElementById('select');
	
	$('#onTime').on('click', function() {
		$.ajax({
			url : 'onTime.do',
			data : 'json',
			dataType : 'json',
			type : 'post',
			success : function(data) {				
				alert(data.attmsg);
			}
		});
	});
	
	$('#offTime').on('click', function() {
		$.ajax({
			url : 'offTime.do',
			data : 'json',
			dataType : 'json',
			type : 'post',
			success : function(data) {
				alert(data.attmsg);
			}
		});
	});
	
	$('#TimeCheck').on('click', function() {
		$.ajax({
			url : 'getAttendanceRecord.do',
			data : 'json',
			dataType : 'json',
			type : 'post',
			success : function(data) {
				$('#onTimeResult').text(data.onTime);
				$('#offTimeResult').text(data.offTime);
			}
		});
	});
})
</script>

<style type="text/css">

	th:nth-child(3){
		text-align:center;
		width : 340px;
	}
	th:nth-child(6){
		text-align:center;
		width : 50px;
	}

</style>

<style type="text/css">
#title{
		font-size:20px bold black;
	}
</style>
</head>
<body>
	<div id="left">
		<section id="profile" class="col-sm-4">
			<div id="info" class="panel panel-default">
    			<div class="panel-heading">
                	<span>${empDuty} | ${empName}</span>
                	<br>
              </div>
               <div class="panel-body">
                   	<button type="button" id="onTime" class="btn btn-sm btn-primary" >
					   출근
					</button>
                	<button type="button" id="offTime" class="btn btn-sm btn-primary" >
					   퇴근
					</button>
					<button id="TimeCheck" class="btn btn-sm btn-info" >
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>시간확인</button>
						<p class="timeResult">출근기록 : <br><span id="onTimeResult"></span></p>
						<p class="timeResult">퇴근기록 : <br><span id="offTimeResult"></span></p>					
<!-- 					테스트 -->
					<button type="button" id="timeList" class="btn btn-sm btn-warning" onclick="location.href='getAttendanceRecordList.do'">
					  출퇴근기록리스트
					</button>
               </div>
            </div>
		</section>
	</div>
	
	
<div id="right">
	<section id="upper">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="jsp/login/img/img1.jpg" alt="...">
				<div class="carousel-caption">첫번째캡션-Portfolio</div>
			</div>
			<div class="item">
				<img src="jsp/login/img/img2.jpg" alt="...">
				<div class="carousel-caption">두번째캡션-Portfolio</div>
			</div>
			<div class="item">
				<img src="jsp/login/img/img3.jpg" alt="...">
				<div class="carousel-caption">세번째캡션-Portfolio</div>
			</div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	</section>
		<article id="lower">
  		<h3>NEWS <small id="text">최신 공지사항</small></h3>

		<table border="20px" class= "table">
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
				</table>
		</article>
</div>

</body>
</html>