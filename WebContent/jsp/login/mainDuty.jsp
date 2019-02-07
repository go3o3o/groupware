<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOU are THE MS's NO.1</title>

 	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="./css/style.css" rel="stylesheet">
    
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
	
    <script type="text/javascript">
    
    function hrSystemOpen(w, h) {
    	var x = (screen.availWidth - w) / 2;
    	var y = (screen.availHeight - h) / 2;
    	var hrDuty = 1;
    	var hrManage = 1;
    	
    	window.open('hrSystemForm.do?','pop','status = no, width='+w+', height='+h+', left='+x+', top='+y); 
    	
    }
    
    
    $(document).ready(function(){
    	var duty = $('div[class="panel-body"]');
    	var ul =  $('<ul>');
    
    	if(${authority.get("AUTHR" ) } > 0) {
    		$('<li>').append('<a href="#" onclick="hrSystemOpen(1300, 800)">HR시스템</a>').appendTo(ul)
    	}
   		if(${authority.get("AUTDEPT" ) } > 0) {
   			$('<li>').append('<a href="#">부서관리</a>').appendTo(ul)
    	}
  	 	if(${authority.get("AUTNOTICE" ) } > 0) {
  	 		$('<li>').append('<a href="#"></a>').appendTo(ul)
		}
  	 	
  	 	duty.append(ul);
  
    });
    
    </script>
    
</head>
<body>

<jsp:include page="/jsp/header.jsp" >
	<jsp:param value="${employee }" name="employee"/>
</jsp:include>

<div id="wrap">
<div id="container">
	
	<section id="left">
		<section id="profile" class="col-sm-4">
			<div id="info" class="panel panel-default">
               <div class="panel-body">
  
               </div>       
            </div>
		</section>
	</section>
	
	<section id="right">

	
	<article id="lower">
		
	</article>
	</section>
</div>
</div>

<jsp:include page="/jsp/footer.jsp" />

</body>
</html>