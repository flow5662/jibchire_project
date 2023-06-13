package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.CmtSns;
import dto.Feed;
import dto.SearchSns;

public class SnsSearchService {

	public ArrayList<Feed> getArticleList(SearchSns search) throws Exception{
		
		//db커넥과 객체 초기화		
		ArrayList<Feed> articleList = null; 
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);
	System.out.println(" service 도착 보내진 검색어는 ? => "+search.getSearchword());
		// dao 패키지에 연결
		articleList = sns.selectSearch(search);
		
		// 닫기
		close(con);
		return articleList;
		
	}

}
