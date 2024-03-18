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
	<!-- 
		1. EL은 영역 객체에 저장된 속성명을 검색해서 존재하는 경우 값을 가져온다.
			- Page 영역 -> Request 영역 -> Session 영역 -> Application 영역
			
		2. EL은 객체의 필드에 직접 접근하는 것처럼 보이지만 내부적으로는 해당 객체의 Getter 메소드로 접근해서 값을 읽어온다.
	 -->
	
	강의장 : ${ classRoom }<br>
	수강생 : ${ student.name }<br>
	나이 : ${ student.age }<br>
	
	<br><br>
	
	강의장 : ${ sessionScope.classRoom }<br>
	수강생 : ${ sessionScope.student.name }<br>
	나이 : ${ sessionScope.student.age }<br>
	
	<%--
		웹 브라우저의 정보를 유지하기 위한 세션 정보를 저장하고 있는 객체이다.<br>
	      정보가 유지되지 않기 때문에 세션이 필요하며, 브라우저가 종료되면 세션이 소멸된다. <br>
	      (* 브라우저 종료되어도 소멸되지 않기 원하면 'cookie'를 이용해야함. 단, 보안에 취약함)
	      
	      - 세션은 서버에 저장되고, 쿠키는 클라이언트(PC)에 저장된다.
      --%>
      
   	
	<h3>3. EL 사용 시 영역 객체에 저장된 속성명이 같은 경우</h3>
	<%
		//Page 영역에 데이터를 저장
		pageContext.setAttribute("scope", "Page 영역");
	%>
	
	scope: ${ scope } <br>
   	pageScope : ${ pageScope.scope }<br>
   	<%-- 있으면 값을 가져오고, 없으면 비어있다 (오류가 나지않는다.)  --%>
   	requestScope : ${ requestScope.scope }<br>  
   	sessionScope : ${ sessionScope.scope }<br>  
   	applicationScope : ${ applicationScope.scope }<br>
   	
   	
   	<h3>4. ContextPath 가져오기</h3>
   	<h4>1) 표현식 태그를 사용하는 방법</h4> 
   	contextPath : <%=request.getContextPath() %>
   	
   	<h4>2) EL을 사용하는 방법</h4>
   	conTextPath : ${ pageContext.request.contextPath }<br>
   	
   	
	<h3>5. 헤더에 접근하기</h3>
	<h4>1) 표현식 태그를 사용하는 방법</h4>
	Host: <%= request.getHeader("Host") %><br>
	User-Agent: <%= request.getHeader("User-Agent") %>
	
	<h4>2) EL을 사용하는 방법</h4>
	Host : ${ header.host }<br>
	<%-- 하이픈(-) 이 들어간 식별자의 경우 [' ']로 감싸야한다. --%>
	User-Agent : ${ header['User-Agent'] }
</body>
</html>