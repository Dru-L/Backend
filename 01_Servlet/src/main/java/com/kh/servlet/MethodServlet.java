package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/method.do")
public class MethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MethodServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("클라이언트가 GET 방식으로 요청");
    	
    	// 사용자가 보낸 데이터들은 request 객체를 통해서 얻어올 수 있다.
    	// getParameter("name 속성의 값")
    	//   - 해당 name 속성의 값을 가지는 요소오ㅢ value 값을 문자열로 얻어온다.
    	// 받은 데이터 출력하기
    	String userName = request.getParameter("userName");
    	String userAge = request.getParameter("userAge");
    	String gender = request.getParameter("gender");
    	
    	// 체크 박스와 같이 하나의 name 속성에 여러 값이 존재하는 경우
    	// request.getParameterValues("name 속성의 값")메소드를 사용한다.
    	//   - 해당 name 속성의 값을 가지는 요소들의 value 값들을 문자열의 배열로 얻어온다.
    	String[] foods = request.getParameterValues("food");
    	//값이 여러개일때는 getParameterValues로 값을 받아온다.
    	
    	System.out.println(userName);
    	System.out.println(userAge);
    	System.out.println(gender);
    	Arrays.stream(foods).forEach(System.out::println);
    	
    	//응답 화면 출력
    	response.setContentType("text/html;charset=utf-8");
    	
    	PrintWriter out = response.getWriter();
    	
    	out.write("<html>");
    	out.write("<head>");
    	out.write("<title>개인 정보 출력</title>");
    	out.write("</head>");
		out.write("<body>");
		out.write("<h2>개인 정보 출력</h2>");
		out.printf("%s님은 %s세 %s입니다.",userName, userAge, gender);
		out.write("좋아하는 음식은 ");
		Arrays.stream(foods).forEach(food -> out.print(food + " "));
		out.write("입니다.");
		out.write("</body>");
		out.write("</html>");
	}

    //아이디, 비밀번호 같은 개인정보는 보통 GET이 아니라 POST로 받음(보안 이슈)
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// POST 방식의 경우 클라이언트에서 보내주는 데이터를 body에 값들을 포함해서 전달한다.
    	
    	// 요청 body에 포함되어 전달되는 값들은 기본적으로 ISO-8859-1로 인코딩 되었다고 간주하기 때문에
    	// request에서 파라미터 값을 가져오기 전에 UTF-8로 인코딩 설정을 해야한다.
    	request.setCharacterEncoding("UTF-8");
    	
    	doGet(request, response);
    	//doGet 메소드를 그대로 호출.
	}

}
