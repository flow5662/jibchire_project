package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.Gosu_ch;
import dto.Gosu_info;

public class BachiInfoService {

	public  boolean infoinsert(Gosu_info bachi_info_been) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		Gosu_ch bachi_check = Gosu_ch.getInstance();
		bachi_check.setConnection(con); //conn 실행
		int insertCount = bachi_check.gosu_ch(bachi_info_been);
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
