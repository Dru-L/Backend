## JSP
### 1. JSP(Java Server Page)
* 서블릿은 자바 언어로 동적인 페이지를 구현해야 한다.
* JSP는 HTML 코드 안에서 스크립트 형태로 자바 언어를 사용하여 동적인 페이지를 구현한다.
  <table>
    <tr>
      <th></th>
      <th>Servlet</th>
      <th>JSP</th>
    </tr>
    <tr>
      <td>형태</td>
      <td>Java 코드에 HTML 코드 삽입</td>
      <td>HTML 코드에 Java 코드 삽입</td>
    </tr>
    <tr>
      <td>예시</td>
      <td>out.println("&lt;HTML&gt;");</td>
      <td>&lt;% for(int k = 0; k &lt; 10; k++){ %&gt;</td>
    </tr>
    <tr>
      <td>특징</td>
      <td>비즈니스 로직 처리에 적합</td>
      <td>화면 로직 처리에 적합</td>
    </tr>
  </table>
* JSP의 목표는 서블릿의 비즈니스 로직으로부터 화면 로직을 분리하는 것을 목표로 한다.
### 2. JSP 실행 과정
* 웹 컨테이너는 클라이언트로부터의 요청이 JSP에 대한 요청일 경우 먼저 JSP 파일을 자바 코드(서블릿)로 변환한다.
* 변환된 자바 코드(서블릿)를 컴파일하고 서블릿 인스턴스를 생성한다.
* 서블릿 인스턴스가 생성되면 서블릿의 라이프 사이클을 거치면서 클라이언트의 요청을 처리해 준다.
### 3. JSP 특징
* 자바 언어를 이용하기 때문에 대부분의 운영체제에서 사용이 가능하다.
* 서버 자원을 효율적으로 사용한다. (요청을 스레드 단위로 처리)
* MVC 패턴을 쉽게 적용할 수 있다.
* JSP 파일의 배포 위치는 HTML 파일과 동일하다.
### 4. JSP 요소
* JSP는 동적인 페이지를 만들기 위해 다양한 스크립팅 요소를 제공한다.
* JSP 스크립팅 요소들은 <%로 시작해서 %>로 끝나는 것이 특징이다.
  <table>
    <tr>
      <th>태그</th>
      <th>표기법</th>
    </tr>
    <tr>
      <td>주석(Comment) 태그</td>
      <td>&lt;%-- 주석 --%&gt;</td>
    </tr>
    <tr>
      <td>지시자(Directive) 태그</td>
      <td>&lt;%@ 지시자 %&gt;</td>
    </tr>
    <tr>
      <td>선언문(Declaration) 태그</td>
      <td>&lt;%! 선언문 %&gt;</td>
    </tr>
    <tr>
      <td>스크립트릿(Scriptlet) 태그</td>
      <td>&lt;% 코드 %&gt;</td>
    </tr>
    <tr>
      <td>표현식(Expression) 태그</td>
      <td>&lt;%= 표현식 %&gt;</td>
    </tr>
  </table>
#### 4.1. 지시자(Directive) 태그
* JSP 페이지 전체에 영향을 미치는 정보를 기술할 때 쓰인다.
  ```
  <%@ 지시자 [속성 명="value"] … %>
  ```
* page 지시자는 JSP 페이지에 대한 속성을 지정한다.
* page 지시자는 JSP 파일 어느 위치에 와도 상관없으나 가장 첫 부분에 작성한다.
  ```
  <%@ page import="java.io.*"%>
  <%@ page contentType="text/html;charset=UTF-8"%>
  <%@ page isErrorPage="true" %> * 
  <%@ page errorPage="/error/errorForm.jsp" %>
  ```
* include 지시자는 다른 페이지(JSP, HTML)를 포함할 때 사용하는 지시자이다.
  ```
  <%@ include file="footer.html" %>
  ```
* taglib 지시자는 JSP에서 사용할 태그 라이브러리를 지정한다.
  ```
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  ```
#### 4.2. 선언문(Declaration) 태그
* 서블릿 클래스의 필드와 메소드를 선언할 때 사용한다.
  ```
  <%! public static final String DEFAULT_NAME = "홍길동"; %>
  <%! int counter = 0; %>

  <%!
    public String getName(HttpServletRequest request){
      return request.getParameter("name");
    }
  %>
  ```
#### 4.3. 스크립트릿(Scriptlet) 태그
* _jspService() 메소드의 로컬(지역) 변수와 자바 코드를 작성할 때 사용한다.
  ```
  <% int i = 10; %>

  <% if(i > 10) { %>
    ... 
  <% } else { %>
    ...
  <% } %>
  ```
#### 4.4. 표현식(Expression) 태그
* 서블릿 코드에서 out.print()의 역할 수행하는 태그로 클라이언트로 데이터를 출력하는 코드를 작성할 때 사용한다.
  ```
  현재 시간은 <%= new java.util.Date() %> 입니다.
  ```
### 5. JSP 내장 객체
* JSP에서 기본적으로 제공하는 객체들로 request, response, out 등 스크립트릿 태그와 표현식 태그에서 사용할 수 있게 선언된 객체이다.
#### 5.1. JSP 내장 객체 종류
* JSP에서 기본적으로 제공하는 객체들은 아래와 같다. 
  <table>
    <tr>
      <th>내장 객체 명</th>
      <th>설명</th>
    </tr>
    <tr>
      <td>request</td>
      <td>HttpServletRequest 객체 참조 변수</td>
    </tr>
    <tr>
      <td>response</td>
      <td>HttpServletResponse 객체 참조 변수</td>
    </tr>
    <tr>
      <td>out</td>
      <td>JspWriter 객체 참조 변수</td>
    </tr>
    <tr>
      <td>session</td>
      <td>HttpSession 객체 참조 변수</td>
    </tr>
    <tr>
      <td>application</td>
      <td>ServletContext 객체 참조 변수</td>
    </tr>
    <tr>
      <td>page</td>
      <td>현재 JSP 페이지에 대한 참조 변수</td>
    </tr>
    <tr>
      <td>pageContext</td>
      <td>JSP 페이지와 관련된 다른 내장 객체를 얻어내는 객체</td>
    </tr>
    <tr>
      <td>config</td>
      <td>JSP 페이지에 대한 설정 정보를 저장하고 있는 객체</td>
    </tr>
    <tr>
      <td>exception</td>
      <td>발생하는 Throwable 객체에 대한 참조 변수</td>
    </tr>
  </table>
### 6. JSP 내장 객체 영역
* Page < Request < Session < Application 영역 순으로 범위가 넓다.
  <table>
    <tr>
      <th>영역</th>
      <th>설명</th>
    </tr>
    <tr>
      <td>Page</td>
      <td>하나의 JSP 페이지를 처리할 때 사용되는 영역<br>pageContext 내장 객체를 통해 접근할 수 있는 영역</td>
    </tr>
    <tr>
      <td>Request</td>
      <td>하나의 요청을 처리할 때 사용되는 영역<br>request 내장 객체를 통해 접근할 수 있는 영역</td>
    </tr>
    <tr>
      <td>Session</td>
      <td>하나의 브라우저와 관련된 영역<br>session 내장 객체를 통해 접근할 수 있는 영역</td>
    </tr>
    <tr>
      <td>Application</td>
      <td>하나의 웹 애플리케이션과 관련된 영역<br>application 내장 객체를 통해 접근할 수 있는 영역</td>
    </tr>
  </table>
