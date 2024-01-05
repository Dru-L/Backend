<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP(Java Server Page)</title>
</head>
<body>
	<h2>JSP(Java Server Page)</h2>
	
	<h3>1. JSP</h3>
	<p>
		JSP는 HTML 코드 안에서 스크립트 형태로 자바 언어를 사용하여 동적인 페이지를 구현한다.
	</p>
	
	<h3>2. JSP 요소</h3>
	<p>
		JSP 페이지에서 자바코드를 직접 기술 할 수 있게 해주는 요소이다.
	</p>
	
	<ol>
		<li>선언문 태그</li>
		<li>스크립트릿 태그</li>
		<li>표현식 태그</li>
	</ol>
	
	<a href="<%= request.getContextPath() %>/views/elements">View details</a>
	
	<h3>3. 지시자 태그</h3>
	<ol>
		<li>Page
            <ul>
                <li>language</li>
                <li>contentType</li>
                <li>PageEncoding</li>
                <li>import</li>
                <li>errorPage</li>
                <li>isErrorPage</li>
                <li>..등등</li>
            </ul>
        </li>
        <li>include</li>
        <li>taglib</li>
	</ol>
	
	<a href="<%= request.getContextPath() %>/views/directive">View details</a>
	
	<h3>4. JSP 내장 객체</h3>
	<p>
		JSP가 자바 코드로 자동으로 생성될 때 자바 파일에 자동으로 추가되는 개체들을 내장 객체라 한다.
	</p>
	
	<ul>
        <li>request</li>
        <li>response</li>
        <li>out</li>
        <li>session</li>
        <li>application</li>
        <li>page</li>
        <li>pageContext</li>
        <li>config</li>
        <li>exception</li>
    </ul>
    
    세션 테스트 <br>
    userId : <%= session.getAttribute("userId") %>
    
    <a href="<%= request.getContextPath() %>/views/objects">View details</a>
	<%-- request.getContextPath() : 현재 배포한 환경에 따라 자동으로 실행 중인 애플리케이션의 주소로 변경.
		contextpath를 매번 고정하지 않고, request.getContextPath()를 통해 얻어올 수 있도록 한다.--%>
		
	<h3>5. 영역 객체</h3>
	<p>
		JSP에서 제공하는 내장 객체들 중에 pageContext, request, session application 객체들은
		해당 객체에 정의된 유효한 범위를 갖는다.<br>
		이렇게 유효한 범위를 갖는 객체들을 영역 객체라 한다.<br>
		해당 객체들은 유효한 범위 안에서 필요한 데이터를 서로 공유할 수 있고 이 공유되는 데이터를 속성(Attribute)이라 한다.
	</p>
	
	<ol>
		<li>Page 영역 : 해당 페이지가 웹 브라우저에 서비스를 제공하는 동안에 유효하다.</li>
		<li>Request 영역 : 웹 브라우저의 요청이 처리되는 동안에 유효하다.</li>
		<li>Session 영역 : 세션이 유지되고 있는 범위 안에서 유효하다.</li>
		<li>Application 영역 : 웹 어플리케이션이 실행되고 있는 동안에 유효하다.</li>
	</ol>
	<a href="<%= request.getContextPath() %>/views/scope">View details</a>
</body>
</html>