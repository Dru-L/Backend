package com.kh.mvc.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.BoardDao;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.jdbc.JDBCTemplate;
import com.kh.mvc.common.util.PageInfo;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

public class BoardService {

	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	public Board getBoardByNo(int no) {
		Board board = null;
		Connection connection = getConnection();
		
		board = new BoardDao().findBoardByNo(connection, no);
		
		return board;
	}

	public int save(Board board) {
		int result = 0;
		Connection connection = getConnection();
		
		if (board.getNo() > 0) {
			//update
			result = new BoardDao().updateBoard(connection, board);
		} else{
			//insert
			result = new BoardDao().insertBoard(connection, board);
		}
		
		if(result > 0) {
			JDBCTemplate.commit(connection);
		}else {
			JDBCTemplate.rollback(connection);
		}
		
		return result;
	}

}
