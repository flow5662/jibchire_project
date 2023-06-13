package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.sql.DataSource;

import dto.Bachi_info;


public class Bachi_category {
	DataSource ds;
	Connection con;
	private static Bachi_category bachi_category;
	
	private Bachi_category() { //바치 카테고리 선택하는 db
	} 
	
	public static Bachi_category getInstance() {
		if(bachi_category == null ) {
			bachi_category = new Bachi_category();
		}
		return bachi_category;
	}
	public void setConnection(Connection con){
		this.con = con;
	}
	
	public ArrayList<Bachi_info> select_bachi_list(String gosu_menu){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String bachi_list_sql="select* from gosu_info where gosu_menu1 ='"+gosu_menu+"' or gosu_menu2 = '"+gosu_menu+"';";
		ArrayList<Bachi_info> articleList = new ArrayList<Bachi_info>();
		Bachi_info bachi = null;
		
		try {
			pstmt = con.prepareStatement( bachi_list_sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bachi = new Bachi_info();
				bachi.setCust_id(rs.getString("cust_id"));
				bachi.setGosu_car(rs.getString("gosu_car"));
			}
			
		}catch(Exception ex) {
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;	
	}
	
}
