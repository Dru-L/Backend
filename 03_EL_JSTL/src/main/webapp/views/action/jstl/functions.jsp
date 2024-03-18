<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="str" value="java oracle HTML CSS sevlet JSP"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Function</title>
</head>
<body>
	<h2>JSTL Function</h2>
	
	<c:set var="str" value="java oracle HTML CSS sevlet JSP"/>
	
	원본 : ${ str }<br><br>
	
	문자열 길이 : ${ fn:length(str) }<br>
	대문자로 변경 : ${ fn:toUpperCase(str) }<br>
	소문자로 변경 : ${ fn:toLowerCase(str) }<br>
	CSS의 위치 : ${ fn:indexOf(str, "CSS") }<br>
	JSP를 JSTL로 변경 : ${ fn:replace(str, "JSP", "JSTL") }<br>
	
	<br><br>
	원본 : ${ str }
</body>
</html>