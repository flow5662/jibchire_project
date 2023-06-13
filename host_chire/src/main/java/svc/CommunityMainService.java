 package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.CmtSns;
import dto.Feed;
import dto.Post_house;

public class CommunityMainService {

	public int getListCount() throws Exception{
		
		//db커넥과 객체 초기화
		int listCount = 0;
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);          
		// dao 패키지에 연결
		listCount = sns.selectListCount();
		close(con);
		return listCount; //return값
		
	}

	
	public Post_house selectMainComty() throws Exception{
		
		//db커넥과 객체 초기화		
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);
		
		Post_house po = sns.selectMainComty();
		close(con);
		return po;
		
	}

}
