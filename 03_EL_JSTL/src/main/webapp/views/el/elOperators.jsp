<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.el.Student"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연산자</title>
</head>
<body>
	<h2>EL 연산자</h2>
	
	<h3>1. 산술연산자</h3>
	10 + 5 = ${ 10 + 5 }<br>
	10 - 5 = ${ 10 - 5 }<br>
	10 * 5 = ${ 10 * 5 }<br>
	10 / 5 = ${ 10 / 5 } <%-- 또는 ${ 10 div 5} --%> <br> <%-- 나눈 결과가 실수값으로 나옴 --%>
	10 % 7 = ${ 10 % 7 } 또는 ${ 10 mod 7 }
	
	
	<h3>2. 논리 연산자</h3>
	true && false : ${ true && false } 또는 ${ true and false }<br>
	true && true : ${ true && true }<br><br>
	true || false : ${ true || false } 또는 ${ true or false }<br>
	false || false : ${ false || false }<br><br>
	!(10>5) :  ${ !(10 > 5) } 또는 ${ not(10 > 5) }
	
	
	<h3>3. 비교 연산자</h3>
	<h4>1) 숫자 비교 연산</h4>
	<%	
		// EL은 영역 객체의 속성에 접근해서 값을 가져오기 때문에 스크립트릿에 선언된 변수의 값은 가져올 수 없다.
		int num1 = 10;
		int num2 = 3;
		
		pageContext.setAttribute("num1", num1);
		pageContext.setAttribute("num2", num2);
	%>
	
	<!-- Object 타입의 더하기 연산은 성립되지 않는다. 숫자 int, Integer 다 가능 -->
	표현식 태그 : <%= (int)pageContext.getAttribute("num1") + (int)pageContext.getAttribute("num2") %> <br>
	
	<!-- Object 타입의 비교 연산은 성립되지 않는다. -->
	<%= (Integer)pageContext.getAttribute("num1") > (Integer)pageContext.getAttribute("num2") %> <br>
	
	<!-- EL은 영역 객체의 속성을 자동으로 형변환 후 연산을 처리한다. -->
	EL : ${ num1 + num2 }<br>
	EL : ${ num1 > num2 }<br><br>
	
	num1 &gt; num2 : ${ num1 > num2 } 또는 ${ num1 gt num2 }<br>
	num1 &lt; num2 : ${ num1 < num2 } 또는 ${ num1 lt num2 }<br>
	num1 &ge; num2 : ${ num1 >= num2 } 또는 ${ num1 ge num2 }<br>
	num1 &le; num2 : ${ num1 <= num2 } 또는 ${ num1 le num2 }<br>
	num1 == num2 : ${ num1 == num2 } 또는 ${ num1 eq num2 }<br>
	num1 != num2 : ${ num1 != num2 } 또는 ${ num1 ne num2 }<br>
	
	
	<h4> 2) 객체 동등 연산</h4>
	<%
		String str1 = "안녕";
		//String str2 = new String("안녕");
		String str2 = "안녕"; //문자열을 같이 가져다가 써서 같은 주소가 나옴.
		Student student1 = new Student("홍길동", 30, 80, 80); 
		Student student2 = new Student("홍길동", 30, 80, 80); 
		/* Student student2 = new Student("성춘향", 24, 90, 90); */
		
		System.out.println(str1 == str2); //new String 일 경우 false, 아닐경우 true
		System.out.println(student1 == student2);//false
		
		pageContext.setAttribute("str1", str1);
		pageContext.setAttribute("str2", str2);
		pageContext.setAttribute("student1", student1);
		pageContext.setAttribute("student2", student2);
	%>
	
	str1 : ${ str1 }<br>
	str2 : ${ str2 }<br>
	student1 : ${ student1 }<br>
	student2 : ${ student2 }<br>
	
	<table border="1">
        <tr>
            <th>비교식</th>
            <th>표현식</th>
            <th>EL</th>
        </tr>
        <tr>
          <td>str1 == str2</td>
          <%--
          <td><%= str1 == str2 %></td>
          주소 값을 비교하는 것. 
           --%>
          <td><%= str1.equals(str2) %></td>
          <%-- EL에서 객체의 == 연산은 equals()와 같은 동작을 한다. --%>
          <td>${ str1 == str2 }</td>
       </tr>
        <tr>
        	<td>str1 != str2</td>
        	<%-- <td><%= str1 != str2 %></td> --%>
        	<td><%= !str1.equals(str2) %></td>
        	<td>${ str1 != str2 }</td>
        </tr>
        <tr>
        	<td>student1 == student2</td>
        	<td><%= student1 == student2 %></td>
        	<td>${ student1 == student2 } 또는 ${ student1 eq student2 }</td>
        </tr>
        <tr>
        	<td>student1 != student2</td>
        	<td><%= student1 != student2 %></td>
        	<td>${ student1 != student2 } 또는 ${ student1 ne student2 }</td>
        </tr>
    </table>
    
    <h4>3) 객체가 null 또는 비어있는지 체크하는 연산자</h4>
    
    <%
       String str = null;
       // String str = "";
       List<String> list = new ArrayList<>();
       // list가 요소가 있지만, 내용들은 비어있다.
       
       list.add("안녕하세요!");
       
       pageContext.setAttribute("str", str);
       pageContext.setAttribute("list", list);
    %>
    
    표현식 : <%= str == null %>, <%= list == null %>
    
    <br><br>
    
    EL : ${ str ==  null } , ${ empty str }
    <br>
    EL : ${ list ==  null } , ${ empty list }
</body>
</html>