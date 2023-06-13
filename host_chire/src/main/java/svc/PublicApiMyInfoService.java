package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.CmtSns;
import dto.Cust_info;
import dto.Feed;

public class PublicApiMyInfoService {

	public Cust_info getmyregion(String cust_id) throws Exception{
		
		//db커넥과 객체 초기화		
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);
		
		Cust_info info = sns.getmyregion(cust_id);
		close(con);
		return info;
		
	}
	
	
}
