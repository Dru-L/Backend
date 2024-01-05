<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");
	
	// 폼 파라미터 값 읽어오기
	String userName = request.getParameter("userName");
	String userAge = request.getParameter("userAge");
	String gender = request.getParameter("gender");
	String[] foods = request.getParameterValues("food");
	
	System.out.println(userName);
	System.out.println(userAge);
	System.out.println(gender);
	Arrays.stream(foods).forEach(System.out::println);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 출력</title>
</head>
<body>
	<h2>개인 정보 출력</h2>
	<%= userName %>님 안녕하세요.<br>
	<%= userName %>님은 <%= userAge %>세, <%= gender %> 입니다.
	좋아하는 음식은
	<%
		for (String food : foods) { 
	%>
	<%=food %>
	<% 
		}
	%>
	<%-- <%
		for(String food : foods) {
			out.print(food + " ");
		}
	%> --%>
	입니다.
</body>
</html>