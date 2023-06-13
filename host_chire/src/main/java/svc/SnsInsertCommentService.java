package svc;

import java.sql.Connection;
import dao.CmtSns;
import dto.Feed;
import dto.Feed_comment;

import static db.JdbcUtil.*;
public class SnsInsertCommentService {

	public boolean registArticle(Feed_comment comment) throws Exception{
		boolean isWriteSuccess = false;
		Connection con = getConnection(); //JdbcUtil클래스의 싱글톰패턴
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);
		int insertCount = sns.insertcomment(comment);

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
