package com.kh.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsAjax.do")
public class JavaScriptAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JavaScriptAjaxServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
	    String age = request.getParameter("age");
	      
	    System.out.println(name + ", " + age);
	      
	    response.setContentType("text/html;charset=UTF-8");
	    
	    response.getWriter()
	    		.printf("<h5>서버에서 전송한 값</h5>%s, %s",name, age);
	}
	
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}
