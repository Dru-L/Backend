<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.el.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Tags</title>
</head>
<body>
	<h2>JSTL Core Tags</h2>
	
	<h3>1. 변수</h3>
	<h4>1) 변수 선언</h4>
	
	<%-- <% pageContext.setAttribute("num1", "10"); %> --%>
	<c:set var="num1" value="10"/>
	<c:set var="num2" value="20" scope="request"/>
	<c:set var="result" value="${ num1 + num2 }" scope="session"/>
	<c:set var="colors" scope="application">
		red, blue, green, yellow, pink
	</c:set>
	
	num1 변수의 값 : ${ num1 } 또는 ${ pageScope.num1 }<br>
	num2 변수의 값 : ${ num2 } 또는 ${ requestScope.num2 }<br>
	result 변수의 값 : ${ result } 또는 ${ sessionScope.result }<br>
	colors 배열의 값 : ${ colors } 또는 ${ applicationScope.colors }<br>
	colors 배열의 값 : <%= application.getAttribute("colors") %><br>
	
	
	<h4>2) 변수 삭제</h4>
	<c:set var="result" value="9999"/>
	<c:set var="result" value="10000" scope="request"/>
	
	삭제 전 : ${ result }
	<br><br>
	<!-- pageScope에 있는 result 삭제 -->
	<c:remove var="result" scope="page"/>
	삭제 후 : ${ result }
	<br><br>
	
	<!-- scope를 적어주지 않으면 같은 변수에 있는 모든 값들을 삭제한다. -->
	<c:remove var="result"/>
	삭제 후 : ${ result }
	
	<h3>2. 출력</h3>
	태그를 문자열로 출력 : <c:out value="<b>태그로 출력하기</b>"/><br>
	태그를 문자열로 출력 : <c:out value="<b>태그로 출력하기</b>" escapeXml="true"/><br>
	<!-- 둘다 동일하게 태그가 태그로 안먹히고 문자열로 출력이 된다. -->
	태그를 해석하여 출력 : <c:out value="<b>태그로 출력하기</b>" escapeXml="false"/><br>
	<!-- escapeXml을 false로 놨을때 태그가 문자열이 아닌 태그로 먹힌다. -->
	기본값 출력 : <c:out value="${ result }" default="값이 없음"/>
	<!-- default 속성으로 기본값을 설정한다. 값이 없으면 기본값으로 나옴. -->
	
	
	<h3>3. 조건문</h3>
	<h4>1) c:if 태그</h4>
	<c:if test="${ num1 > num2 }">
		<b>num1이 num2 보다 크다.</b>
	</c:if>
	
	<c:if test="${ num1 < num2 }">
		<b>num1이 num2 보다 작다.</b>
	</c:if>
	<!-- test 안에 들어있는 조건이 부합하면 html을 출력한다. 액션태그를 브라우저에서 실행시키는 것이 아니다. -->
	
	
	<h4>1) c:choose 태그</h4>
	<c:choose>
		<c:when test="${ num1 > num2 }">
			<b>num1이 num2 보다 크다.</b>
		</c:when>
		
		<c:when test="${ num1 < num2 }">
			<b>num1이 num2 보다 작다.</b>
		</c:when>
		
		<c:otherwise>
			<b>num1이 num2가 같다.</b>
		</c:otherwise>
	</c:choose>
	
	
	<h3>4. 반복문</h3>
	<h4>1) c:forEach 태그</h4>
	<h5>자바의 for 구문처럼 사용하기</h5>
	<%
      for(int i = 1; i <= 10; i++) {
    %>
      <%= i %> 
    <%               
      }
    %>
    <br>
    
    <!-- step 속성의 값은 0보다 작거나 같을 수 없다. -->
	<c:forEach var="i" begin="1" end="6" step="2">
		<%-- ${ i } --%>
		<h${ i }>${i}</h${ i }>
	</c:forEach>
	
	<br>
	<!--  반복이 종료되면 반복에 사용했던 변수도 삭제된다. -->
	i : ${ i }
	
	<h5>자바의 향상된 for 구문처럼 사용하기</h5>
	<c:forEach var="color" items="${ colors }" >
		<h5 style="color: ${color}">${ color }</h5>
	</c:forEach>
	
	<h5>학생 목록 조회</h5>
	<%
		List<Student> students = new ArrayList<>();
	
		students.add(new Student("홍길동", 30, 70, 70));
		students.add(new Student("성춘향", 24, 80, 80));
		students.add(new Student("이몽룡", 24, 85, 80));
		students.add(new Student("춘향이", 22, 90, 90));
		
		pageContext.setAttribute("students", students);
	%>
	
	<table border="1">
		<thead>
	        <tr>
	        	<th>인덱스</th>
            	<th>순번</th>
            	<th>First</th>
            	<th>Last</th>
	            <th>이름</th>
	            <th>나이</th>
	            <th>수학 점수</th>
	            <th>영어 점수</th>
	        </tr>
	    </thead>
	    <tbody>
		    <%--
	         <%
	            for(Student s : students) {
	         %>
	            <tr>
	               <td><%= s.getName() %></td>
	            </tr>
	         <%
	            }
	         %>
	         --%>
	    	<c:forEach var="student" items="${ students }" varStatus="status">
		    	<c:if test="${ not status.first }"> <!-- 첫번째 반복이 아닌 경우-->
		    		<tr>
		    			<td>${ status.index }</td> <!-- 인덱스 -->
		    			<td>${ status.count }</td> <!-- 순번 -->
		    			<td>${ status.first }</td> <!-- 첫번쨰 반복인지 확인 -->
		    			<td>${ status.last }</td> <!-- 마지막 반복인지 확인 -->
		    			<td>${ student.name }</td>
		    			<td>${ student.age }</td>
		    			<td>${ student.mathScore }</td>
		    			<td>${ student.englishScore }</td>
		    		</tr>
	    		</c:if>
	    	</c:forEach>
	    </tbody>
    </table>
    
    
    <h4>2) c:forTokens</h4>
   	<ul>
   		<c:forTokens var="color" items="pink red tomato,lime/aqua" delims=" ,/">
   		<%-- items의 delims(s가 붙어있어서 여러개 줄 수 있음): 구분자는 공백과 , / --%>
   			<li style="color:${ color };">${ color }</li>
   		</c:forTokens>
   	</ul>
   	
   	
   	<h5>5. c:url 태그</h5>
   	
   	<c:url var="url" value="/views/el/elParam.jsp">
   		<c:param name="pName" value="아이폰 12 미니"></c:param>
   		<c:param name="pCount" value="12"></c:param>
   		<c:param name="option" value="화이트"></c:param>
   		<c:param name="option" value="64GB"></c:param>
   	</c:url>
   	
   	${ url }<br>
   	
   	<a href="${ url }">이동</a>
   	
</body>
</html>