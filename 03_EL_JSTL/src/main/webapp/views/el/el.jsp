<%@page import="com.kh.el.Student"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL</title>
</head>
<body>
	<h2>EL</h2>
	
	<h3>1. 기존 방식으로 request, session 객체에 담겨있는 데이터를 출력</h3>
	
	<%
		Student student = (Student) request.getAttribute("student");
	%>
	
	강의장 : <%= request.getAttribute("classRoom") %><br>
	수강생 : <%= student.getName() %><br>
	<%-- <%= ((Student) request.getAttribute("student")).getName() %><br> --%>
	나이 : <%= student.getAge() %>
	
	<br><br>
	
	<%
	Student student2 = (Student) session.getAttribute("student");
	%>
	
	강의장 : <%= session.getAttribute("classRoom") %><br>
	수강생 : <%= student2.getName() %><br>
	나이 : <%= student2.getAge() %>
	
	<h3>2. EL 방식으로 request, session 객체에 담겨 있는 데이터를 출력</h3>
	
	강의장 : ${ classRoom }<br>
	수강생 : ${ student.name }<br>
	나이 : ${ student.age }<br>
	
	<br><br>
	
	강의장 : ${ sessionScope.classRoom }<br>
	수강생 : ${ sessionScope.student.name }<br>
	나이 : ${ sessionScope.student.age }<br>
	
</body>
</html>