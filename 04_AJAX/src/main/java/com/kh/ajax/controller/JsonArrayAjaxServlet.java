package com.kh.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.ajax.vo.User;


@WebServlet("/jsonArrayAjax.do")
public class JsonArrayAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JsonArrayAjaxServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String gender = request.getParameter("gender");
    	
    	//사용자 정보가 저장되어 있는 List 객체 생성
    	List<User> users = new ArrayList<>();
    	
    	users.add(new User(1, "홍길동", 30, "남자"));
    	users.add(new User(2, "김철수", 16, "남자"));
    	users.add(new User(3, "김영희", 16, "여자"));
    	users.add(new User(4, "이몽룡", 24, "남자"));
    	users.add(new User(5, "성춘향", 24, "여자"));
    	users.add(new User(6, "영심이", 20, "여자"));
    	users.add(new User(7, "왕경태", 20, "남자"));
    	
    	List<User> findUsers = users.stream()
    		 .filter(user -> user.getGender().equals(gender))
    		 .collect(Collectors.toList());
    	
    	System.out.println(new Gson().toJson(findUsers));
    	
    	response.setContentType("application/json;charset=UTF-8");
    	
    	new Gson().toJson(findUsers, response.getWriter());
	}

}
