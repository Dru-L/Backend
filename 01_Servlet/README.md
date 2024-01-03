## 서블릿(Servlet)
### 1. 애플릿(Applet)
* 웹 브라우저에서 실행되는 자바 응용프로그램으로 서버에서 클라이언트 쪽으로 실행 파일을 내려받아서 실행되는 방식이다.
* 현재는 HTML5, CSS3, JavaScript 등의 기술들의 발전으로 애플릿을 사용하고 있지 않다.
### 2. 서블릿
* Server Side Applet으로 자바 언어로 구현되는 서버 프로그램이다.
* 서블릿은 웹 브라우저로부터 요청을 받아 처리하고 결과를 다시 웹 브라우저로 전송하는 역할을 한다.
* 일반적인 자바 클래스와 다르게 `javax.servlet.http.HttpServlet` 클래스를 상속해야 한다.
* HttpServlet 클래스는 서블릿이 웹상에서 HTTP 프로토콜을 이용해 서비스를 처리하기 위해 반드시 상속해야 하는 클래스이다.
  ```java
  public class 클래스명 extends HttpServlet {
    ...
  }
  ```
### 3.서블릿 메소드
#### 3.1. doGet()
* 클라이언트에서 GET 방식으로 요청이 전송될 경우 호출되는 메소드이다. 
  ```java
  protected void doGet(HttpServletRequest request, HttpServletResponse response) {
    // GET 요청에 응답할 로직을 구현
  }
  ```
#### 3.2. doPost()
* 클라이언트에서 POST 방식으로 요청이 전송될 경우 호출되는 메소드이다. 
  ```java
  protected void doPost(HttpServletRequest request, HttpServletResponse response) {
    // POST 요청에 응답할 로직을 구현
  }
  ```
### 4. 요청 객체와 응답 객체
#### 4.1. HttpServletRequest
* 클라이언트(웹 브라우저)에서 서버에 보내는 요청 정보를 제공하는 객체이다.
* javax.servlet.ServletRequest를 상속한다.
* 주요 메소드
  <table>
    <tr>
      <th>메소드명</th>
      <th>내용</th>
    </tr>
    <tr>
      <td>getParameter(String)</td>
      <td>client가 보내준 값이 저장된 명칭이 매개변수와 같은 명칭에 저장된 값을 불러오는 메소드</td>
    </tr>
    <tr>
      <td>getParameterNames()</td>
      <td>client가 보내준 값을 저장한 명칭을 불러오는 메소드</td>
    </tr>
    <tr>
      <td>getParameterValues(String)</td>
      <td>client가 보내준 값이 여러 개일 경우 그 값을 배열로 불러오는 메소드</td>
    </tr>
    <tr>
      <td>getParameterMap()</td>
      <td>client가 보내준 값이 전체를 Map 방식으로 불러오는 메소드</td>
    </tr>
    <tr>
      <td>setAttribute(String, object)</td>
      <td>request 객체에 전달하고 싶은 값을 String 이름으로 Object 저장하는 메소드</td>
    </tr>
    <tr>
      <td>getAttribute(String)</td>
      <td>매개변수와 동일한 객체 속성값 불러오는 메소드</td>
    </tr>
    <tr>
      <td>removeAttribute(String)</td>
      <td>request 객체에 저장되어 있는 매개변수와 동일한 속성값 삭제하는 메소드</td>
    </tr>
    <tr>
      <td>setCharacterEncoding(String)</td>
      <td>전송받은 request 객체의 값들의 CharaterSet을 설정해 주는 메소드</td>
    </tr>
    <tr>
      <td>getRequestDispatcher(String)</td>
      <td>컨테이너 내에서 request, response 객체를 전송하여 처리할 컨포넌트(jsp파일 등)를 불러오는 메소드 forward() 메소드와 같이 사용</td>
    </tr>
  </table>
#### 4.2 HttpServletResponse
* 서버가 클라이언트(웹 브라우저)로 보내는 응답 정보를 처리하는 객체이다.
* javax.servlet.ServletResponse를 상속한다.
* 주요 메소드
  <table>
    <tr>
      <th>메소드명</th>
      <th>내용</th>
    </tr>
    <tr>
      <td>setContentType(String)</td>
      <td>응답으로 작성하는 페이지의 MIME type을 정하는 메소드</td>
    </tr>
    <tr>
      <td>setCharacterEncoding(String)</td>
      <td>응답하는 데이터의 CharacterSet을 지정해 주는 메소드</td>
    </tr>
    <tr>
      <td>getWriter()</td>
      <td>문자를 페이지에 전송을 위한 Stream을 가져오는 메소드</td>
    </tr>
    <tr>
      <td>getOutputStream()</td>
      <td>byte 단위로 페이지에 전송을 위한 Stream을 가져오는 메소드</td>
    </tr>
    <tr>
      <td>sendRedirect(String)</td>
      <td>client가 매개변수의 페이지를 다시 서버에 요청하게 하는 메소드</td>
    </tr>
  </table>
### 5. 서블릿 동작 구조
* 클라이언트가 웹 브라우저를 통해 요청을 보낸다.
* 해당 요청이 서블릿에 대한 요청이면 서블릿 컨테이너에게 처리를 넘긴다.
* 서블릿에서 요청에 대한 실행이 완료된 후에는 서블릿 컨테이너가 실행 결과를 웹서버에 전달한다.
* 웹서버는 서비스를 요청한 클라이언트에 응답한다.
* 컨테이너의 서블릿에 대한 설정은 배표 서술자(web.xml)에 작성한다.
  <br><img src="https://user-images.githubusercontent.com/26870393/176694747-87242399-a142-496f-8870-ad1f887e614b.png" width="800px"><br>

### 6. 서블릿 생명주기
* 첫 번째 요청일 경우, 서블릿 객체를 생성하고 init() 메소드를 호출한다.
  * 이후 요청에 대해서는 서블릿 객체 생성, init()메소드는 호출하지 않는다.
* 다음에 service() 메소드가 클라이언트 요청 방식에 따라 doGet() 또는 doPost() 메소드를 호출한다.
* 최종적으로 서블릿이 서비스되지 않았을 때 destroy() 메소드를 호출한다. 
  * destroy() 메소드는 보통 서버가 종료되었을 때, 서블릿의 내용이 변경되어 재 컴파일 될 때 호출된다.
### 7. 배포 서술자 (Deployment Descriptor)
* 배포 서술자(Deployment Descriptor)는 애플리케이션에 대한 전체 설정 정보를 가지고 있는 파일이다.
* 배포 서술자의 정보를 가지고 웹 컨테이너가 서블릿 구동한다. 
* 웹 애플리케이션 폴더의 WEB-INF 폴더에 web.xml 파일이 배포 서술자이다.
* 설정 정보
  * Servlet 정의, Servlet 초기화 파라미터
  * Session 설정 파라미터
  * Servlet/JSP 매핑, MIME type 매핑
  * 보안 설정
  * Welcome file list 설정
  * 에러 페이지 리스트, 리소스, 환경 변수 
### 8. 서블릿 매핑
* 사용자의 요청을 서블릿에게 전달하기 위해서는 서블릿을 등록하고 매핑해야 한다.
* 서블릿을 등록하고 매핑하는 방법은 web.xml과 @annotation을 이용하는 방법이 있다.
  ```xml
  <servlet>
     <servlet-name>서블릿 이름</servlet-name>
     <servlet-class>서블릿 클래스</servlet-class>
  </servlet>
  <servlet-mapping>
      <servlet-name>서블릿 이름</servlet-name>
      <url-pattern>접근 URL 패턴</url-pattern>
  </servlet-mapping>
  ```
  ```java
  @WebServlet("접근 URL 패턴")
  public class 서블릿이름 extends HttpServlet{
    // servlet code
  }
  ```
