package svc;

import java.sql.Connection;
import dao.CmtSns;
import dto.Feed;
import static db.JdbcUtil.*;
public class SnsUpdateService {

	public boolean registArticle(Feed feed) throws Exception{
		boolean isUpdateSuccess = false;
		Connection con = getConnection(); //JdbcUtil클래스의 싱글톰패턴
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);
		int updateCount = sns.updateFeed(feed);

		if(updateCount > 0){
			commit(con);
			isUpdateSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isUpdateSuccess; // 객체 이름부터가 write success했니? 묻고있음 true값을 들고가야 성공
		
	}

}
