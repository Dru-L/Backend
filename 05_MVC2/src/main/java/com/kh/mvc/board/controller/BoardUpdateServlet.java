package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet(name = "boardUpdate", urlPatterns = { "/board/update" })
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUpdateServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int no = 0;
        Board board = null;
        String url = "/views/common/msg.jsp";
        HttpSession session = request.getSession();
        
        Member loginMember = (Member) session.getAttribute("loginMember");
        
        // 로그인을 했는지 아닌지 .
        if(loginMember != null) {
           no = Integer.parseInt(request.getParameter("no"));
           board = new BoardService().getBoardByNo(no);
           
           // 내가 쓴 글인지 아닌지 확인 
           if (board != null && loginMember.getId().equals(board.getWriterId())) {
              request.setAttribute("board", board);
              url = "/views/board/update.jsp";

           } else {
              request.setAttribute("msg", "잘못된 접근입니다.");
              request.setAttribute("location", "/board/list");
           }
           
        } else {
           request.setAttribute("msg", "로그인 후 수정해 주세요.");
           request.setAttribute("location", "/");
        }
        
        request.getRequestDispatcher(url).forward(request, response);
     
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int no = 0;
    	Board board = null;
    	HttpSession session = request.getSession();
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	
    	if(loginMember != null) {
    		String path = getServletContext().getRealPath("/resources/upload/board");
    		int maxSize = 10485760;
    		String encoding = "UTF-8";
    		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
    		
    		no = Integer.parseInt(mr.getParameter("no"));
    		board = new BoardService().getBoardByNo(no);
    		
    		if( board != null && loginMember.getId().equals(board.getWriterId())) {
    			board.setTitle(mr.getParameter("title"));
    			board.setContent(mr.getParameter("content"));
    			
    			String originalFileName = mr.getOriginalFileName("upfile");
    			String filesystemName = mr.getFilesystemName("upfile");
    			
    			if(originalFileName != null && filesystemName != null) {
    				board.setOriginalFilename(originalFileName);
    				board.setRenamedFilename(filesystemName);
    			}
    			
    			int result = new BoardService().save(board);
    			
    			if(result > 0) {
    				// 게시글 수정 성공
    				request.setAttribute("msg", "게시글 수정 성공");
        			request.setAttribute("location", "/board/view?no=" + board.getNo());
    			}else {
    				// 게시글 수정 실패
    				request.setAttribute("msg", "게시글 수정 실패");
        			request.setAttribute("location", "/board/update?no=" + board.getNo());
    			}
    		}else {
    			request.setAttribute("msg", "잘못된 접근입니다");
    			request.setAttribute("location", "/board/list");
    		}
    	}else {
    		request.setAttribute("msg", "로그인 후 수정해 주세요.");
    		request.setAttribute("location", "/");
    	}
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
