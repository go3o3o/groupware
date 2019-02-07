<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 문서작성시 호출 폼 -->
<html lang="kr">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>문서작성폼폼폼</title>

    <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="./css/style.css" rel="stylesheet">
<style type="text/css">

	#tables{width:710px; height:400px; margin:auto; text-align:center; border=1px solid black;}
	.firstline th{height:40px} td{text-align:center;} 

 	#container{height:700px; }
    
</style>

  </head>

<script type="text/javascript">
function selradio(num){
	$("input:text[name=edOpen]").val(num);
}


function reset(){
	document.frm.reset();
}
</script>


<body>
<jsp:include page="../header.jsp" />


<div id="wrap">

<div id="container">
	
		<form name=frm action="docWrite.do"  enctype="multipart/form-data" method="post">
	<section id="right" >
		<section id="title" align="left">
		<h4>■문서 작성</h4>
		<td>
		<input type="hidden" value=${empNo } name="empNo">
		<input type="submit" value="전송">
		
		<input type="reset" value="초기화" onclick="reset()">
	   	</td>

		</section>
		<article id="substance" class="firstline">
		<table id=tables border=1px width="300" solid black;>
			<tr align="left" width="600">
				<td>제목</td>
				<td><input type="text" name="edTitle"></td>
				<td><input type="checkbox" name="edEmers">긴급</td>
			</tr>

			<tr>
				<td>문서구분</td>
				<td colspan="2">
				<select name="dtNo">
					<option value="1">문서보고서</option>
					<option value="2">출장보고서</option>
					<option value="3">휴가신청서</option>
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
				<td colspan="2"><textarea name="edContent" cols="80" rows="6" style="resize: none;"></textarea></td>
			</tr>
			
			<tr>
				<td>공개여부</td>
 				<td colspan="2">
			<input type="text" readonly="readonly" name="edOpen">
				<%request.setCharacterEncoding("UTF-8");
 					String open =null;
				open=request.getParameter("open");
			%> 
				<input type="radio" name="edOpen" value='1' onclick='selradio(1)'>전체공개
				<input type="radio" name="edOpen" value="2" onclick='selradio(2)'>부서공개
				<input type="radio" name="edOpen" value="3" onclick='selradio(3)'>결재라인공개</td>
			</tr>

			<tr>
				<td>파일첨부</td>
				<td colspan="2"><input type="file" readonly="readonly" name="ufile"></td>

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
