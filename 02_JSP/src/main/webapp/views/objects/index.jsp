<%@page import="java.util.Arrays"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 내장 객체</title>
</head>
<body>
	<h2>JSP 내장 객체</h2>
	
	<h3>1. request</h3>
	<h4>1) 헤더와 관련된 메소드</h4>
	<%-- 
	<%
		String userAgent = request.getHeader("User-Agent");
	
		System.out.println(userAgent);
	%>
	--%>
	
	<table border="1">
        <tr>
            <th>헤더 이름</th>
            <th>헤더 값</th>
        </tr>
        <%
        	//요청 헤더의 name 속성들을 읽어온다.
        	Enumeration<String> names = request.getHeaderNames();
        
       		while(names.hasMoreElements()){
       			String headerName = names.nextElement();
       	%>
       	<tr>
            <td><%= headerName %></td>
            <td><%= request.getHeader(headerName) %></td>
        </tr>
       	<%		
       			// System.out.println(headerName);
       			// System.out.println(request.getHeader(headerName));
       			// System.out.println();
       		}
        %>
    </table>
    
    <h4>2) URL / URI, 요청 방식과 관련된 메소드</h4>
    <table border="1">
    	<tr>
            <th>구분</th>
            <th>값</th>
        </tr>
        <tr>
            <td>프로토콜</td>
            <td><%= request.getProtocol() %></td>
        </tr>
        <tr>
	        <td>서버 URL</td>
	        <td><%= request.getRequestURL() %></td>
	    </tr>
	    <tr>
	        <td>서버 URI</td>
	        <td><%= request.getRequestURI() %></td>
	    </tr>
	    <tr>
	        <td>요청 방식</td>
	        <td><%= request.getMethod() %></td>
	    </tr>
	    <tr>
	        <td>요청 쿼리</td>
	        <td><%= request.getQueryString() %></td>
	    </tr>
	    <tr>
	        <td>웹 애플리케이션 경로</td>
	        <td><%= request.getContextPath() %></td>
	    </tr>
    </table>
    <h3>2. response</h3>
   
    <h4>1) Redirect</h4>
    <a href="redirect.jsp">Redirect 테스트</a>
    
    
    <h3>3. pageContext</h3>
    <h4>1) Forward</h4>
   
    <a href="forward.jsp">Forward 테스트</a>
    
    
    <h3>4. session</h3>
    <p>
    	웹 브라우저의 정보를 유지하기 위한 세션 정보를 저장하고 있는 객체이다.
    </p>
    <%
    	session.setAttribute("userId", "ismoon");
    
    	//클라이언트의 요청이 없더라도 세션을 유지할 시간을 초 단위로 지정한다.
    	session.setMaxInactiveInterval(10);
    	
    	// 서버에서 쿠기 생성 후 클라이언트로 전송하는 방법
    	Cookie cookie = new Cookie("userId", "hong");
    	
    	response.addCookie(cookie);
    	
    	//클라이언트에서 전송한 쿠키를 얻어오는 방법
    	Cookie[] cookies = request.getCookies();
    	
    	Arrays.stream(cookies).forEach(c -> {
    		System.out.println(c.getName());	
    		System.out.println(c.getValue());	
    		System.out.println();	
    	});

    %>
    
    세션 ID : <%= session.getId() %><br>
    isNew() : <%= session.isNew() %><br>
    <%-- 처음 세션이면 true, 기존 세션이면 false --%>
    생성 시간 : <%= new Date(session.getCreationTime()) %><br>
    최종 접속 시간 : <%= new Date(session.getLastAccessedTime()) %>
    
    
    <h3>5. application</h3>
    <p>
    	웹 어플리케이션(컨텍스트)의 실행 환경을 제공하는 서버의 정보와 서버 측 자원에 대한 정보를 저장하고 있는 객체이다.
    </p>
    
    <table border="1">
        <tr>
            <td>컨테이너 정보</td>
            <td><%= application.getServerInfo() %></td>
        </tr>
        <tr>
            <td>웹 모듈 버전</td>
            <td><%= application.getMajorVersion() %>.<%= application.getMinorVersion() %></td>
        </tr>
        <tr>
            <td>웹 애플리케이션의 실제 파일 시스템 경로</td>
            <%-- <td><%= application.getRealPath("/") %></td> --%>
            <td><%= application.getRealPath("/views/objects/index.jsp") %></td>
        </tr>
        
    </table>
</body>
</html>