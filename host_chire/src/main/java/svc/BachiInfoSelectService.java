package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.Gosu_ch;
import dto.Gosu_info;
import db.JdbcUtil;

public class BachiInfoSelectService {

	public boolean select_bachi_id(String cust_id) throws Exception{
		
		boolean isCheck = false;
		Connection con = getConnection();
		Gosu_ch ch = Gosu_ch.getInstance();
		ch.setConnection(con);
		isCheck = ch.select_cust_id(cust_id);
		close(con);
		return isCheck;
	}
	
}
