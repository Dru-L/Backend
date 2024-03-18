<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX(Asynchronous JavaScript and XML)</title>
<script src="${ path }/resources/js/jquery-3.7.1.js"></script>

<!-- <script src="/04_AJAX/resources/js/ajax.js"></script> -->
<script src="${ path }/resources/js/ajax.js"></script>
</head>
<body>
	<h2>AJAX(Asynchronous JavaScript and XML)</h2>
   
    <h3> 1. JavaScript를 이용한 AJAX 테스트</h3>
    <h4> 1) GET 방식으로 서버에 데이터 전송 및 응답 </h4>
   
    <button id="btn1">GET 방식 전송</button>
   
    <p id="p1"></p>
   
    <h4> 2) POST 방식으로 서버에 데이터 전송 및 응답 </h4>
   
    <button id="btn2">POST 방식 전송</button>
   
    <p id="p2"></p>
    
    <h3>2. jQuery를 이용한 AJAX 테스트</h3>
    <h4>1) GET 방식으로 서버에 데이터 전송 및 응답 </h4>
    
    <label for="input">입력 : </label>
    <input type="text" id="input"/>
    
    <br>
    
    <label>출력 : </label>
    <input type="text" id="output1" readonly/>
    
    <br><br>
    
    <button id="btn3">GET 방식 전송</button>
    
    <h4>2) POST 방식으로 서버에 여러 개의 데이터 전송 및 응답 </h4>
    
    <label for="userName">이름 : </label>
    <input type="text" id="userName"/>
    
    <br>
    
    <label for="userAge">나이 : </label>
    <input type="number" id="userAge"/>
    
    <br>
    
    <label>출력 : </label>
    <input type="text" id="output2" readonly/>
    
    <br><br>
    
    <button id="btn4">POST 방식 전송</button>
    
    <h4>3) 서버에 데이터 전송 후, 응답을 객체로 받기</h4>
    
    <label for="userNo">회원 번호 : </label>
    <input type="text" id="userNo" />
    
    <button id="btn5">조회</button>
    
    <p id="p3"></p>
    
    <h4>4) 서버에 데이터 전송 후, 응답을 리스트로 받기</h4>
    <label><input type="radio" name="gender" value="남자"/>남자</label>
    <label><input type="radio" name="gender" value="여자"/>여자</label>
    
    <button id="btn6">전송</button>
    <p id="p4"></p>
    
</body>
</html>