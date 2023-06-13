package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import java.sql.Connection;
import dao.CmtSns;

public class SnsDeleteService {

	public boolean removeArticle(int feed_id) throws Exception{
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		CmtSns cmtsns = CmtSns.getInstance();
		cmtsns.setConnection(con);
		int deleteCount = cmtsns.deleteArticle(feed_id);
		
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}

}
