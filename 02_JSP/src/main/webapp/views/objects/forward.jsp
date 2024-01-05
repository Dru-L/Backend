<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    
    /*
    	forward(String uri)
    		- 매개값으로 지정한 URI로 현재 페이지의 요청과 응답에 관한 제어권을 넘긴다.
    		(브라우저에 표시되는 URL이 변경되지 않는다.)
    		- 포워드는 현재 페이지의 요청과 응답 정보를 다른 페이지로 넘기기 때문에 요청 정보와 응답 정보가 유지된다.
    */
	// pageContext.forward("forward_target.jsp");
	pageContext.forward("/views/objects/forward_target.jsp");
	
%>