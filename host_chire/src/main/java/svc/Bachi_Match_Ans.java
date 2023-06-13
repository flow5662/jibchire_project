package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.Bachi_match;
import dto.Bachi_match_AnsBeen;

public class Bachi_Match_Ans {
	public boolean Answer(Bachi_match_AnsBeen ans) throws Exception{
	
	boolean isWriteSuccess = false;
	Connection con = getConnection();
	Bachi_match bachi_match = Bachi_match.getInstance();
	bachi_match.setConnection(con);
	int insertCount = bachi_match.insertArticleAns(ans);
	
	if(insertCount > 0){
		commit(con);
		isWriteSuccess = true;
	}
	else{
		rollback(con);
	}
	
	close(con);
	
	return isWriteSuccess;
	}
}
