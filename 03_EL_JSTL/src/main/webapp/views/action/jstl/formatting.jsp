<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Formatting Tags</title>
</head>
<body>
	<h2>JSTL Formatting Tags</h2>
	
	톰캣 서버의 Locale : ${ pageContext.response.locale }<br>
	
	<!-- 
   <fmt:setLocale value="en_US"/>
    -->
   <%-- <fmt:setLocale value="ja_JP"/> 
   	해당처럼 작성하면 지역설정을 바꿀수있다.(로컬 언어가 변경)--%>
   	<fmt:setLocale value="ko_KR"/>
	
	<h3>1. fmt: formatNumber 태그</h3>
	<p>
		숫자 데이터의 출력 형식을 지정할 때 사용하는 태그이다.
	</p>
	
	숫자 그대로 출력 : <fmt:formatNumber value="123456789" groupingUsed="false" />
   	<br>
   	세 자리마다 구분하여 출력 : <fmt:formatNumber value="123456789" />
   	<br>
   	세 자리마다 구분하여 출력 : <fmt:formatNumber value="123456789" groupingUsed="true"/>
   	
   	<br><br>
   	
   	숫자: <fmt:formatNumber value="5000"/> 
   	<br>
    숫자 : <fmt:formatNumber type="number" value="50000" />
    <br>
    통화 : <fmt:formatNumber type="currency" value="50000"/>
    <br>
    통화 : <fmt:formatNumber type="currency" currencySymbol="$" value="50000" />
    <br>
    백분율 : <fmt:formatNumber type="percent" currencySymbol="percent" value="0.7" />
    <br><br>
    #을 이용해서 pattern 지정 : <fmt:formatNumber value="1.23" pattern="#.###"/> <!-- 소숫점 자리수 지정. 다만 없는 숫자는 안채워넣음 -->
    <br>
    0을 이용해서 pattern 지정 : <fmt:formatNumber value="1.23" pattern="0.000"/> <!-- 소숫점 자리수 지정. 없는 숫자는 0을 채워넣음 -->
    
    
    <h3>2. fmt:formatDate 태그</h3>
    <p>
       날짜와 시간의 데이터 포맷을 지정할 때 사용하는 태그이다.
    </p>
   
    <c:set var="date" value="<%= new Date() %>" />
    
    <%-- ${ date } --%>
    <ul>
    	<li><fmt:formatDate value="${ date }"/></li>
    	<li><fmt:formatDate type="date" value="${ date }"/></li> <!-- 연월일 -->
    	<li><fmt:formatDate type="time" value="${ date }"/></li> <!-- 시분초 -->
    	<li><fmt:formatDate type="both" value="${ date }"/></li> <!-- 연월일 시분초 -->
    	<li><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${ date }"/></li> <!-- 연(2자리)월일 시분 -->
    	<li><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${ date }"/></li> <!-- 연월일 시분초 -->
    	<li><fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${ date }"/></li> <!-- 연월일 시분초 표준시간(글자까지 상세히) -->
    	<li><fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${ date }"/></li> <!-- 연월일 몇요일 시분초 표준시간(글자까지 최고 상세히) -->
    	<li><fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${ date }"/></li> <!-- 연월일 -->
    	<li><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss(a)" value="${ date }"/></li> <!-- 연월일 시분초 -->
    </ul>
    
</body>
</html>