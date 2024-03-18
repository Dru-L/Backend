package com.kh.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jqAjax.do")
public class JqueryAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JqueryAjaxServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String input = request.getParameter("input");
    	
    	System.out.println(input);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	
    	response.getWriter().printf("입력 값 : %s, 길이 : %d", input, input.length());
	}
    
    //현재의 경우에는 get과 post가 받는 객체가 다르기때문에,dopost에서 get 내용을 받지않고 별도로 작성한다. 
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userName = request.getParameter("userName");
    	String userAge = request.getParameter("userAge");
    	
    	response.setContentType("text/html;charset=UTF-8");
    	
    	response.getWriter().printf("이름 : %s, 나이 : %s",userName, userAge);
	}
    
}
