package com.kh.mvc.member.model.service;

import java.sql.Connection;

//import static com.kh.mvc.common.jdbc.JDBCTemplate.*; //ctrl + shift + o...........
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;
import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import com.kh.mvc.common.jdbc.JDBCTemplate;
//import com.kh.mvc.common.jdbc.JDBCTemplate;
import com.kh.mvc.member.model.dao.MemberDao;
import com.kh.mvc.member.model.vo.Member;

public class MemberService {
	public Member findMemberById(String userId) {
		//connection 중복 코드를 없애기 위해서
		
		Member member = null; //참조변수나 변수 만들어서 null을 return 하도록 처음에 만들기.
		//connection에서 얻어오기
		Connection connection = getConnection();
		/*
		 * 커넥션을 서비스에서 얻어와 dao로 넘겨줌 커넥션을 서비스에서 얻어와 필요한 작업을 하고 커밋 or 롤백을 진행해야함.
		 * 왜? 여러 작업을 동시에 진행하기위해(트렌젝션 처리하기 위해)
		 * ex) insert => 커밋, update => 커밋 이런식으로 진행하면 롤백 시 하나의 작업밖에 롤백 진행이 안됨
		 */
		
		//데이터베이스에서 id를 조회
		member = new MemberDao().findMemberById(connection, userId);
		
		close(connection);
		
		return member;
	}

	public Member login(String userId, String userPwd) {
		Member member = this.findMemberById(userId);
		//위의 findMemberById를 호출해서 connection을 생략.
		
		if(member != null && member.getPassword().equals(userPwd)) {
	         return member;
	      } else {
	         return null; //맨 처음 만든 참조변수로 null값 리턴.
	      } 
	}


	public int save(Member member) {
		 int result = 0;
		 Connection connection = getConnection();
		 
		 if (member.getNo() > 0) {
			 //update
			result = new MemberDao().updateMember(connection, member);
		 } else {
			 //insert
			 result = new MemberDao().insertMember(connection, member);
		 }
		 
	     if (result > 0) {
	    	 commit(connection);
	     
	     } else {
	    	 rollback(connection);
	     }
	     
	     close(connection);
	     //close 꼭 할것!!!!
	     
	     return result;
	}


	public Boolean isDuplicated(String userId) {
		//아이디 중복 검사
		
		//위의 findMemberById를 호출해서 connection을 생략.
		return this.findMemberById(userId) != null;
		// 넘겨 받은 아이디로 있는 아이디인지 조회한 후,
		// 아이디가 있으면 아이디를 넘겨주고(아이디 사용 불가능), 아이디가 없으면 null을 넘겨준다.(아이디 사용가능)
	}

	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().updateStatus(connection, no, "N");
		
		if(result > 0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

}
