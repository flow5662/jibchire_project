package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CmtSns;
import dto.Feed;
import dto.Feed_comment;

import static db.JdbcUtil.*;

public class SnsReadCommentService {
	
	public ArrayList<Feed_comment> getFeedComment(int feed_id, String cust_id) throws Exception{
			
		ArrayList<Feed_comment> commentlist = null;
		Connection con = getConnection();
		CmtSns consns = CmtSns.getInstance();
		consns.setConnection(con);
		commentlist = consns.getFeedComment(feed_id,cust_id);
		
		return commentlist;
	}

}
