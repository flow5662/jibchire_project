package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Bachi_match;
import dto.Bachi_match_AnsBeen;

public class Bachi_Match_Ans_Service {
	public ArrayList<Bachi_match_AnsBeen> select_matchAns(int est_id,String cust_id){
		 ArrayList<Bachi_match_AnsBeen> been = new ArrayList<Bachi_match_AnsBeen>();
			Connection con = getConnection(); //Conn 호출
			Bachi_match bachi_match_ans = Bachi_match.getInstance();
			bachi_match_ans.setConnection(con);
			been = bachi_match_ans.select_one_ans(est_id,cust_id);
			close(con);
		return been;
	}

}
