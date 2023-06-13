package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.Bachi_match;
import dto.Bachi_match_Been;

public class Bachi_Match_Service {

	public boolean registArticle(Bachi_match_Been bachi_matchi_been) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection con = getConnection(); //Connect
		Bachi_match bachi_match = Bachi_match.getInstance();
		bachi_match.setConnection(con); //conn 실행
		int insertCount = bachi_match.insertArticle(bachi_matchi_been); //dao 메소드에 받은 객체를 담음
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		return isWriteSuccess;
	}
	
}

