<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"% isErrorPage="true"%>  --%>
<%-- 에러 페이지를 가져올때는 isErrorPage를 사용하여 전달받는다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 style="color: red;">에러가 발생했습니다. 관리자에게 문의해주세요.</h2>
	
	<button onclick="history.go(-1);">이전 페이지로</button>
	
	<%--
	<%= exception %>
	<%= exception.getMessage() %>
	<%= exception.getClass().getName() %>
	--%>
</body>
</html>