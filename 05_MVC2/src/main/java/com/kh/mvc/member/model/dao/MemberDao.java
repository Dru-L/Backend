package com.kh.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import com.kh.mvc.member.model.vo.Member;

public class MemberDao {

	public Member findMemberById(Connection connection, String userId) {
		Member member = null;
//		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'";
		ResultSet rs = null;
		
		try {
			//connection을 매개값으로 받게되면서 중복되는 코드 제거
//	         Class.forName("oracle.jdbc.driver.OracleDriver"); //오라클 JDBC 드라이버 등록
//	         
//	         connection = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "C##WEB", "WEB");
//	         //데이터베이스 url, 계정명, 계정PW
	         
	         pstmt = connection.prepareStatement(query);
	         //statement 객체 얻어옴
	         
	         pstmt.setString(1, userId); //첫번째 물음표에 유저 ID를 넣는다.
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) { //데이터를 반복해서 조회. 있다면 true 리턴.
	        	 member = new Member();
	        	 
	        	 member.setNo(rs.getInt("NO"));
	        	 member.setId(rs.getString("ID"));
	        	 member.setPassword(rs.getString("PASSWORD"));
	        	 member.setRole(rs.getString("ROLE"));
	        	 member.setName(rs.getString("NAME"));
	        	 member.setPhone(rs.getString("PHONE"));
	        	 member.setEmail(rs.getString("EMAIL"));
	        	 member.setAddress(rs.getString("ADDRESS"));
	        	 member.setHobby(rs.getString("HOBBY"));
	        	 member.setStatus(rs.getString("STATUS"));
	        	 member.setEnrollDate(rs.getDate("ENROLL_DATE"));
	        	 member.setModifyDate(rs.getDate("MODIFY_DATE"));
	         }
	         
//	      } catch (ClassNotFoundException e) {
//	         e.printStackTrace();
	      } catch (SQLException e) {
			e.printStackTrace();
		  } finally {
			  close(rs);
			  close(pstmt);
			  //중복 코드 삭제
//			  try {
//				rs.close();
//				pstmt.close();
////				connection.close();
//				} catch (SQLException e) {
//				e.printStackTrace();
//				}
		  }
		
		return member;
	}

	public int insertMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL,?,?,DEFAULT,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getHobby());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "UPDATE MEMBER SET NAME=?,PHONE=?,EMAIL=?,ADDRESS=?,HOBBY=?,MODIFY_DATE=SYSDATE WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getHobby());
			pstmt.setInt(6, member.getNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int updateStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
//		String query = "DELETE FROM MEMBER WHERE NO=?"; //DB의 실제 데이터 삭제
		String query = "UPDATE MEMBER SET STATUS=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			//delete 했을때 쿼리문
//			pstmt.setInt(1, no);
			
			// update 했을때 쿼리문
			pstmt.setString(1, status);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
