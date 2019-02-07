<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 문서작성시 호출 폼 -->
<html lang="kr">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>뷰페이지</title>

    <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="./css/style.css" rel="stylesheet">
  </head>

<style type="text/css">

	#tables{width:710px; height:340px; margin:auto; text-align:center; border=1px solid black;}
	.firstline th{height:40px} td{text-align:center;} 

</style>

<script type="text/javascript">
$(document).ready(function(){
emerCheck();
})


function emerCheck(){
	if(${document.edEmer}==1){
	$('input:checkbox[name=NAME]').is(':checked')
	}
	else {
	$('input:checkbox[name=NAME]').attr('checked', false);
	}
}

</script>


<body>
<jsp:include page="../header.jsp" />
<div id="wrap">

<div id="container">
	<section id="left">
		<section id="left_profile">
			프로필 영역
		</section>
		<h4 id="ED" onclick="location.href='showEdocumentListForm.do'">전자결재</h4>
		<ul>
			<li id="get_rpt" onclick="location.href='showEdocumentList.do'">받은 문서</li>
			<li id="do_rpt" onclick="location.href='writeEdocumentForm.do'">기안 문서</li>
		</ul>
	</section>
	
		<form name=frm action="docWrite.do" method="post" enctype="multipart/form-data">
	<section id="right" >
		<section id="title" align="left">
		<h4>■문서 확인</h4>
		<td>
		<input type="hidden" value=${document.empNo } name="empNo">
	   	</td>

		</section>
		<article id="substance" class="firstline">
		<table id=table border=1px width="300" solid black;>
			<tr align="left" width="600">
				<td>제목</td>
				<td><input type="text" value=${document.edTitle }></td>
				<td>
				<c:choose>
				<c:when test="${document.edEmer==1}">
				<input type="checkbox" name="edEmer" checked disabled="true">
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="edEmer" disabled="true">
				</c:otherwise>
				</c:choose>
				긴급</td>
			</tr>

			<tr>
				<td>문서구분</td>
				<td colspan="2" >
				<!--*.보고서. 선택한 문구를 띄우기 -->
				<input type="text" readonly="readonly" value=${document.dtNo }>
				<select name="dtNo">
				</select>
				</td>
			</tr>
			
			<tr>
				<td>결재선</td>
<!-- 				tree.html호출 -->
				<td><input type="text" readonly="readonly"></td>
				<td><input type="button" value="+" onclick="window.open('tree.do','결재자 추가','width=800,height=500,location=no,status=no,scrollbars=yes');"></td>
<!-- 				text내에 값은 tree.html에서 선택한 값이 들어가야함 -->
			</tr>
			
			<tr>
				<td>문서내용</td>
				<td colspan="2"><textarea name="edContent" cols="80" rows="6" style="resize: none;" placeholder="${document.edContent}" readonly="readonly"></textarea></td>
			</tr>
			
			<tr>
				<td>공개여부</td>
 				<td colspan="2">
			<input type="text" value="${document.edOpen }" readonly="readonly" name="edOpen">
				<%request.setCharacterEncoding("UTF-8");
 					String open =null;
				open=request.getParameter("open");
			%> 
			</tr>

			<tr>
				<td>파일첨부</td>
				<td colspan="2"><input type="file" readonly="readonly" name="ufile"}></td>

			</tr>
			
			<tr>
				<td>참조</td>
<!-- 				tree.html호출 -->
				<td><input type="text" readonly="readonly"></td>
				<td><input type="button" value="+" onclick="window.open('tree.do','참조자추가','width=800%,height=500,location=no,status=no,scrollbars=yes');"></td>
<!-- 				text내에 값은 tree.html에서 선택한 값이 들어가야함 -->
			</tr>
		</table>
		
		</article>
	</section>
		   	</form>
</div>
	<jsp:include page="../footer.jsp" />
</div>


</body>
</html>
