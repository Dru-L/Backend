package com.kh.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.PageInfo;

@WebServlet(name = "boardList", urlPatterns = { "/board/list" })
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardListServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Board> list = null;
		
		try {
			page = Integer.parseInt(request.getParameter("page")); //받아오는 타입이 String이라 형변환.
		} catch(NumberFormatException e){
			page = 1;
		} // page 가 int 타입이므로 Integer 타입으로 변환해주어야 함
	      // 파라미터가 없으면 null 처리가 나고, 정수값이 아니므로 오류가 뜸 -> 예외처리가 필요함
		
		listCount = new BoardService().getBoardCount();
		
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = new BoardService().getBoardList(pageInfo);
		
		System.out.println(list);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/board/list.jsp").forward(request, response);
		
	}

}
