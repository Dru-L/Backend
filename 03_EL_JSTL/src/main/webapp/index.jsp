<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL/JSTL</h2>
   
   <h3>1. EL(Expression Language)</h3>
   <p>
      EL은 JSP  2.0버전에서 추가된 표현 언어이다. <br>
      표현식 태그를 대신해서 클라이언트에 출력하고자 하는 값들을 좀 더 간결하게 출력할 수 있다.
   </p>
   
   <h4>1) EL 내장 객체</h4>
   
   <a href="<%= request.getContextPath() %>/el.do">View details</a>
</body>
</html>