package svc;

import java.sql.Connection;
import dao.CmtSns;
import dto.Cust_houseinfo;
import dto.Feed;
import static db.JdbcUtil.*;
public class MyPageWriteService {

	public boolean registArticle(Cust_houseinfo house) throws Exception{
	System.out.println("myPageWrite service진행중");	
		boolean isWriteSuccess = false;
	System.out.println("2번안녕");	
		Connection con = getConnection(); //JdbcUtil클래스의 싱글톰패턴
	System.out.println(con+"+> con");	
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);
		int insertCount = sns.insertHouseInfo(house);

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
