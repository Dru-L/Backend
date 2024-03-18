package com.kh.mvc.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.mvc.member.model.service.MemberService;

@WebServlet(name = "memberIdCheck", urlPatterns = { "/member/idCheck" })
public class MemberIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberIdCheckServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ID 값을 가져와서 DB에 있는 값인지 확인하고 결과 (JSON)을 응답한다.
		String userId = request.getParameter("userId");
		Map<String, Boolean> map = new HashMap<>();
		
		System.out.println(userId);
		
		map.put("duplicate", new MemberService().isDuplicated(userId));
		
		response.setContentType("application/json;charset=UTF-8");
		
		new Gson().toJson(map, response.getWriter());
	}

}
