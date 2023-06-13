package svc;

import java.sql.Connection;
import dao.CmtSns;
import dto.Cust_follow;

import static db.JdbcUtil.*;
public class SnsFollowService {

	public boolean registArticle(Cust_follow follow) throws Exception{
		boolean isWriteSuccess = false;
		Connection con = getConnection(); //JdbcUtil클래스의 싱글톰패턴
		System.out.println(con+"+> con");	
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);
		
		//int feed_id= heart.getFeed_id();
		/*값이 있는지 먼저 확인하기 */
		Boolean isSelectExist = sns.selectFollow(follow);
		if(!isSelectExist) {
			/* 좋아요 insert하기 */
			int insertCount = sns.insertFollow(follow);
			if(insertCount > 0){
				commit(con);
				isWriteSuccess = true;
			}
			else{
				rollback(con);
			}
		}else {
			/* 좋아요 delete 하기*/
			int deleteCount = sns.deleteFollow(follow);
			if(deleteCount > 0){
				commit(con);
				isWriteSuccess = true;
			}
			else{
				rollback(con);
			}
		}
		close(con);
		return isWriteSuccess; // 객체 이름부터가 write success했니? 묻고있음 true값을 들고가야 성공
		
	}

}
