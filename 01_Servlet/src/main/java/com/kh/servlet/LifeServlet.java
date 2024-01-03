package com.kh.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/life.do") //name 속성을 생략하면 클래스 이름과 name 속성이 동일해짐. 매개값으로 mapping url만 주면됨.
public class LifeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public LifeServlet() {
        System.out.println("LifeServlet 생성");
    }

    @Override
	public void init(ServletConfig config) throws ServletException {
    	System.out.println("init() 메소드 호출");
	}

    
    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("service() 메소드 호출");
    	
    	//요청 방식에 따라 doGet(), doPost(),메소드 호출
    	super.service(request, response);
	}

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("doGet() 메소드 호출__");
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("doPost() 메소드 호출");
	}
	
    
    @Override
	public void destroy() {
    	System.out.println("destroy() 메소드 호출"); //코드를 수정하고 요청했을 경우에만 destroy가 사용됨.
	}
    
    // 라이프 사이클 돌아가는 순서
    // LifeServlet->init->service->doGet/doPost->(다시 로딩하면)->service->doGet/doPost[반복]->(코드를 수정하고 저장후 로딩으로 요청하면)->destroy

}
