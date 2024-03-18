<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jsp:forward</h2>
	<p>
		forward 액션 태그는 다른 페이지로 요청을 전달할 때 사용하는 액션 태그이다.
	</p>
	
	<%
		request.setAttribute("userName", "홍길동");
		request.setAttribute("userAge", 30);
	%>
	<jsp:forward page ="forwardPage.jsp"/>
</body>
</html>