<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("age", 20);
	request.setAttribute("gender", "남자");
	
	System.out.println(pageContext.getAttribute("age"));
	System.out.println(request.getAttribute("gender"));
	
	 // pageContext.forward("scopeTest3.jsp"); //해당 요청이 계속 유지되고 있기에 데이터가 보임.
	response.sendRedirect("scopeTest3.jsp"); // 요청이 새로 시작되었기 때문에 데이터가 없음.
%>