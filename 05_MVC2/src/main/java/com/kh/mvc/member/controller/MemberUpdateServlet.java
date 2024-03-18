package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name = "memberUpdate", urlPatterns = { "/member/update" })
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberUpdateServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	Member member = null;
    	
    	// 1. 로그인 된 사용자인지 체크
    	HttpSession session = request.getSession();
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {
    		//회원 정보 수정
    		// 2. 사용자가 수정한 내용을 가지고 Member 객체를 생성
    		member = new Member();
            
    		member.setNo(loginMember.getNo());
            member.setId(request.getParameter("userId"));
            member.setName(request.getParameter("userName"));
            member.setPhone(request.getParameter("phone"));
            member.setEmail(request.getParameter("email"));
            member.setAddress(request.getParameter("address"));
            
            // 삼항연산자를 이용하여 취미값을 선택하면 toString을 이용하여 출력하고, 선택한 취미가 없으면 null이 나오도록 설정
            String hobby = request.getParameterValues("hobby") != null ? String.join(",", request.getParameterValues("hobby")) : null;
            
            member.setHobby(hobby);
            // String 배열을 한번에 한 String으로 가져오기위해 join메소드 사용.

            //3. 회원 정보 수정
            //member 객체로 저장
            result = new MemberService().save(member);
            
            if(result > 0) {
                // 회원 정보 수정 성공
            	session.setAttribute("loginMember", new MemberService().findMemberById(loginMember.getId()));
            	
                request.setAttribute("msg", "회원 정보 수정 완료");
                request.setAttribute("location", "/member/myPage");
                
             } else {
                // 회원 정보 수정 실패
                request.setAttribute("msg", "회원 정보 수정 실패");
                request.setAttribute("location", "/member/myPage");
             }
            
            
    	}else {
    		request.setAttribute("msg", "로그인 후 수정해주세요.");
    		request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp")
    			.forward(request, response);
	}

}
