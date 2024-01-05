package com.kh.el;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/el.do")
public class ELServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ELServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 서블릿에서 request, session, application 객체를 얻어온 다음 데이터를 담아서 el.jsp에 전달
    	HttpSession session = request.getSession();
    	ServletContext application = request.getServletContext();
    	
    	//Request 영역에 데이터를 저장
        request.setAttribute("classRoom", "D 강의장");
        request.setAttribute("student", new Student("홍길동", 30, 80, 80));
        request.setAttribute("scope", "Request 영역");
        
        // Session 영역에 데이터를 저장
        session.setAttribute("classRoom", "B 강의장");
        session.setAttribute("student", new Student("이몽룡", 24, 90, 90));
        session.setAttribute("scope", "Session 영역");
        
        // Application 영역에 데이터를 저장
        application.setAttribute("classRoom", "T 강의장");
        application.setAttribute("student",  new Student("성춘향", 24, 100, 100));
        application.setAttribute("scope", "Application 영역");
    	
		request.getRequestDispatcher("views/el/el.jsp")
			   .forward(request, response);
	}

}
