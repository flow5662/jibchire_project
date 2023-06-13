package svc;

import java.sql.Connection;
import dao.CmtSns;
import dto.Feed_comment;

import static db.JdbcUtil.*;

public class SnsUpdateCommentService {
	
	public Boolean updateComment(Feed_comment comment) throws Exception{

		
		boolean isUpdateSuccess = false;
		Connection con = getConnection();
		CmtSns consns = CmtSns.getInstance();
		consns.setConnection(con);
		
		int updateCount = consns.updateComment(comment);
		if(updateCount > 0){
			commit(con);
			isUpdateSuccess = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return isUpdateSuccess;
		
	}

}
