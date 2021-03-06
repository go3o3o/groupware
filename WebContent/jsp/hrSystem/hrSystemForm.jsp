<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="HR System Form">
<meta name="author" content="YONI">

<title>인사시스템</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<link href="jsp/hrSystem/css/style_hr.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

<script type="text/javascript">

	function print(printArea) {
		var win = window.open();
		self.focus();
		win.document.open();

		win.document.write('<html><head><title></title><style>');
		win.document.write('body, td {font-falmily: Verdana; font-size: 10pt;}');
		win.document.write('</style></haed><body>');
		win.document.write(printArea);
		win.document.write('</body></html>');
		win.document.close();
		win.print();
		win.close();
	}

	function home() {
		var url = "main.do";
		var win = window.open(url);
		self.close();
	}
	
	function logout() {
		self.close();
		window.open('logout.do');
	}


	$(document).ready(function() {
		$('#hr_container').load('manageForm.do');
		
		if(${authority.get("AUTHR")} > 1) {
			$('#manageEmp')
			.after('<div><button type="button" name="hr_duty" value="2">입사</button></div>')
			.after('<div><button type="button" name="hr_duty" value="3">퇴사</button></div>');
		}
		
		
		$('button[name=hr_duty]').on('click', function() {
			// 1 : manageEmpForm.jsp
			if ($(this).attr('value') == 1) {
				$('#hr_container').load('manageForm.do');
			}
			// 2 : insertEmpForm.jsp
			if ($(this).attr('value') == 2) {
				$('#hr_container').load('insertEmpForm.do');
			}
			// 3 : deleteEmpForm.jsp
			if ($(this).attr('value') == 3) {
				$('#hr_container').load('jsp/hrSystem/deleteEmpForm.jsp');
			}
		});
	});
</script>

</head>
<body>

	<div id="wrap">

		<div id="header">
			<div>
				${employee.getEmpNm() }님
				<button type="button" onclick="logout()">로그아웃</button>
			</div>
			<div>
				<img src="jsp/hrSystem/img/printer.png" id="print" onclick="print()"> <img
					src="jsp/hrSystem/img/home.png" id="home" onclick="home()">
			</div>
		</div>


		<div id="layer">
			<div id="nav">
				<div id="manageEmp">
					<button type="button" name="hr_duty" value="1">사원관리</button>
				</div>
			</div>

			<div id="hr_container">

			</div>
		</div>



	</div>
</body>
</html>