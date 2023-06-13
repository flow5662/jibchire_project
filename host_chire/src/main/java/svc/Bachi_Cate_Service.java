package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.Bachi_match;
import dto.Bachi_Match_Category;

public class Bachi_Cate_Service {
	public Bachi_Match_Category getArticle(String category) throws Exception{
		
		Bachi_Match_Category article = null;
		Connection con = getConnection();
		Bachi_match bachi_match = Bachi_match.getInstance();
		bachi_match.setConnection(con);
		
		close(con);		
		return article;
	}
}
