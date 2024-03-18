package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.vo.Member;

@WebServlet(name = "memberInfo", urlPatterns = { "/member/myPage" })
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInfoServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	
    	if(loginMember != null) {
    		//forward를 해서 해당 페이지를 보이게끔 한다.
    		request.getRequestDispatcher("/views/member/myPage.jsp")
    		.forward(request, response);
    	} else {
    		request.setAttribute("msg", "로그인 후 사용해 주세요.");
    		request.setAttribute("location", "/");
    		
    		request.getRequestDispatcher("/views/common/msg.jsp")
    				.forward(request, response);
    	}
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
