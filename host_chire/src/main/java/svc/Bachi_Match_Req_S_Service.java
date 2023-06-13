package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Bachi_match;
import dto.Bachi_match_Been;

public class Bachi_Match_Req_S_Service {

	public ArrayList<Bachi_match_Been> select_one(int est_id){
		ArrayList<Bachi_match_Been> been = new ArrayList<Bachi_match_Been>();
		Connection con = getConnection(); //Conn 호출
		Bachi_match bachi_match_req = Bachi_match.getInstance();
		bachi_match_req.setConnection(con);
		been = bachi_match_req.select_one_req(est_id);
		close(con);
		return been; 
	}
}
