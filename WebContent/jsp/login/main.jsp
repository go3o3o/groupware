<%@ page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>YOU are THE MS's NO.1</title>

    <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="./css/style.css?ver=6" rel="stylesheet">

	<script type="text/javascript">
// 		$(document).ready(function(){
			
// 			var pagename = ${ pageName};
// 			alert(pagename);
			
// 		});	
	</script>
</head>
<body>

<jsp:include page="/jsp/header.jsp" >
	<jsp:param value="${employee }" name="employee"/>
</jsp:include>

<div id="wrap">
	<!-- 컨텐츠부분 : 각 페이지가 표시될 부분 -->
	<div id="container" class="MScontents">
		<jsp:include page="mainContents.jsp" flush="true"/>
	</div>
	<!-- 컨텐츠부분 끝 -->


<jsp:include page="/jsp/footer.jsp" />

</div>

</body>
</html>
