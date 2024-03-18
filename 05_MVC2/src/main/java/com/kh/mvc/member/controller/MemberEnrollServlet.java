package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(asyncSupported = true, name = "memberEnroll", urlPatterns = { "/member/enroll" })
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberEnrollServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 회원가입 페이지로 포워딩
    	request.getRequestDispatcher("/views/member/enroll.jsp")
    			.forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	request.setCharacterEncoding("UTF-8");
    	
    	Member member = new Member();
    	
    	//회원정보를 객체로 받아준다.
    	member.setId(request.getParameter("userId"));
    	member.setPassword(request.getParameter("userPwd"));
    	member.setName(request.getParameter("userName"));
    	member.setPhone(request.getParameter("phone"));
    	member.setEmail(request.getParameter("email"));
    	member.setAddress(request.getParameter("address"));
    	
    	////취미는 배열이기때문에 여러개를 join해서 가져오기 위해 이렇게 처리. 삼항 연산자로 가져온값이 null이 아니면 join을 쓰고, 그렇지않으면 null값 처리
    	String hobby = request.getParameterValues("hobby") != null ? String.join(",", request.getParameterValues("hobby")) : null;
    	
    	member.setHobby(hobby);
    	
    	System.out.println(member);
    	
    	int result = new MemberService().save(member);
        
        if (result > 0) {
        	// 회원 가입 완료
        	request.setAttribute("msg", "회원 가입 성공");
        	request.setAttribute("location", "/");
        } else {
        	// 회원 가입 실패
        	request.setAttribute("msg", "회원 가입 실패");
        	request.setAttribute("location", "/member/enroll");
        }
        
        request.getRequestDispatcher("/views/common/msg.jsp")
        		.forward(request, response);
	}

}
