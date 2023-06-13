package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Cust_info;
import dto.Gosu_info;
import dto.Gosu_product;


public class Gosu_ch {
	DataSource ds;
	Connection con;
	private static Gosu_ch bachi_ch;
	
	
	public static Gosu_ch getInstance() {
		if(bachi_ch == null) {
			bachi_ch = new Gosu_ch();
		}
		return bachi_ch;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	public int gosu_ch(Gosu_info bachi_info) {  //바치 등록
	    PreparedStatement pstmt = null; //SQL문에 매핑
	    ResultSet rs = null; // 모두 초기화

	    String sql = "";
	    int insertCount = 0;

	    try{
	        sql = "insert into gosu_info(cust_id,gosu_menu1,gosu_menu2,gosu_intro,gosu_car,gosu_reg,gosu_comp,worktime_s,worktime_e) values(?,?,?,?,?,?,?,?,?)";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, bachi_info.getCust_id());
	        pstmt.setString(2, bachi_info.getGosu_menu1());
	        pstmt.setString(3, bachi_info.getGosu_menu2());
	        pstmt.setString(4, bachi_info.getGosu_intro());
	        pstmt.setString(5, bachi_info.getGosu_car());
	        pstmt.setString(6, bachi_info.getGosu_reg());
	        pstmt.setString(7, bachi_info.getGosu_comp());
	        pstmt.setString(8, bachi_info.getWorktime_s());
	        pstmt.setString(9, bachi_info.getWorktime_e());

	        insertCount=pstmt.executeUpdate();
	    } catch(SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }

	    return insertCount;
	}
	public boolean select_cust_id(String cust_id) { //ajax 처리용,submit 기능 막기
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "select count(*) from gosu_info where cust_id = ?";

	   try {
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, cust_id);
		   rs = pstmt.executeQuery();
		   
		   if(rs.next()) {
			 int count = rs.getInt(1);
			 if(count > 0) {
				 return true;
			 }
		   }
		   
	   }catch(Exception e) {
		   e.printStackTrace();
	   }finally {
		   close(rs);
		   close(pstmt);
	   }
	   return false;
	}
		

	
	
	
	
	
	
	
	
} 