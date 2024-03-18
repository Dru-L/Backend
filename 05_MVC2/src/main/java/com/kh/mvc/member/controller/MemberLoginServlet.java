package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.common.util.EncryptUtil;
import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name = "memberLogin", urlPatterns = { "/login" })
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberLoginServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userId = request.getParameter("userId");
    	String userPwd = request.getParameter("userPwd");
    	String saveId = request.getParameter("saveId");
    	
    	System.out.println(userId +", " + userPwd +", " + saveId);
    	
//    	System.out.println(EncryptUtil.oneWayEnc(userPwd, "SHA-256"));
//    	System.out.println(EncryptUtil.oneWayEnc(userPwd, "SHA-512")); //암호화 메세지 길이 차이
    	
    	if (saveId != null ) {
    		// 전달된 아이디를 쿠키에 저장
    		// 1. 쿠키 생성
    		Cookie cookie = new Cookie("saveId", userId);
    		
    		cookie.setMaxAge(259200); //3일(초 단위로 넣어야됨) 동안 유지
    		
    		// 2. response 객체에 쿠키 추가
    		response.addCookie(cookie);
    	} else {
    		//쿠키 삭제
    		Cookie cookie = new Cookie("saveId", ""); //빈 값으로 돌리고
    		
    		cookie.setMaxAge(0); // 쿠키를 0초동안 유지(쿠키 덮어씌우는거임)
    		
    		response.addCookie(cookie);
    	}
    	
    	Member loginMember = new MemberService().login(userId, userPwd);   //비즈니스 모델을 관리. 
    	//아이디, 비밀번호 데이터를 조회하고 맞는 아이디와 비밀번호가 있으면 해당 데이터를 하나의 객체로 리턴해줌.
    	
    	System.out.println(loginMember);
    	
    	if (loginMember != null) {
    		HttpSession session = request.getSession();
    		
    		session.setAttribute("loginMember", loginMember); //session 영역에 로그인 멤버를 저장
    		
    		response.sendRedirect(request.getContextPath() + "/"); //로그인 시 다시 홈으로
    	} else {
    		// 로그인 실피애ㅔ 대한 메세지를 띄워주고 홈 화면으로 이동
    		//1. 공용으로 사용하는 에러 메시지를 출력할 페이지에 전달할 메시지와 메시지 출력 후 이동할 페이지를 request 객체에 저장한다.
    		request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
    		request.setAttribute("location", "/");
    		
    		//2. request 객체의 데이터를 유지해서 에러 메시지를 전달하기 위해 forward를 실행한다.
    		request.getRequestDispatcher("/views/common/msg.jsp")
    				.forward(request, response);
    	}
    	
	}

}
