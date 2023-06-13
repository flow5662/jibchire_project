package svc;

import java.sql.Connection;
import dao.CmtSns;
import dto.Feed;
import static db.JdbcUtil.*;
public class SnsWriteService {

	public boolean registArticle(Feed feed) throws Exception{
	System.out.println("1번안녕");	
		boolean isWriteSuccess = false;
	System.out.println("2번안녕");	
		Connection con = getConnection(); //JdbcUtil클래스의 싱글톰패턴
	System.out.println(con+"+> con");	
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);
		int insertCount = sns.insertFeed(feed);

		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess; // 객체 이름부터가 write success했니? 묻고있음 true값을 들고가야 성공
		
	}

}
