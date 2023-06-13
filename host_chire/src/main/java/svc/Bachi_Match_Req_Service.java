package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;


import java.sql.Connection;
import java.util.ArrayList;

import dao.Bachi_match;
import db.JdbcUtil;
import dto.Bachi_match_Been;

public class Bachi_Match_Req_Service {

	public ArrayList<Bachi_match_Been> select_matchReq(int page,int limit,String gosu_menu1,String gosu_menu2,String cust_id) throws Exception{
		
		ArrayList<Bachi_match_Been> match_been = null; //ArrayList 초기화
		Connection con = getConnection(); //Conn 호출
		Bachi_match bachi_match_req = Bachi_match.getInstance(); //싱글톤패턴, 하나의 Bachi_match 인스턴스만 사용
		bachi_match_req.setConnection(con);
		match_been = bachi_match_req.selectMatchReq(page,limit,gosu_menu1,gosu_menu2,cust_id);
		
		close(con);
		return match_been;
		
	}
	
	public int getListCount(String gosu_menu1,String gosu_menu2) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		Bachi_match bachi_match = Bachi_match.getInstance();
		bachi_match.setConnection(con);
		listCount = bachi_match.count_list(gosu_menu1,gosu_menu2);
		close(con);
		return listCount;
	}
}
