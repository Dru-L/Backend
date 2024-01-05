<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 예시 : 보통 로그인처리가 완료되었을 때 홈페이지 메인으로 자동으로 바꿔주는것과 같은 경우에
    리다이렉트를 이용해서 로그인이 완료되면 메인페이지로 바로 옮겨달라는 요청을 한다. --%>
<%
	/*
		sendRedirect(String uri)
			- 매개값으로 지정한 URI로 요청을 재전송한다. (브라우저에 표시되는 URL이 변경된다.)
			- 리다이렉트는 이동할 페이지로 요청과 응답 객체를 새로 생성하여 전송하므로 이전 요청과 응답 정보가 유지되지않는다.
	*/
	// response.sendRedirect("redirect_target.jsp");

	String contextPath = request.getContextPath();
	
	response.sendRedirect(contextPath + "/views/objects/redirect_target.jsp");
%>