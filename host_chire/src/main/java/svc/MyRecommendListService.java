package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.CmtSns;
import dto.Cust_houseinfo;
import dto.Cust_info;
import dto.Feed;
import dto.Post_house;

public class MyRecommendListService {
	
	public Cust_houseinfo getcusthouseinfo(String cust_id) throws Exception{
		//db커넥과 객체 초기화
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);  
		Cust_houseinfo houseinfo = sns.selectCusthouseinfo(cust_id);
		
		return houseinfo;
	}
	
	public Cust_info getcustinfo(String cust_id) throws Exception{
		//db커넥과 객체 초기화
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);  
		Cust_info info = sns.getcustinfo(cust_id);
		
		return info;
	}
	
	public ArrayList<Post_house> gethouseinfo(Cust_houseinfo houseinfo) { //i) 주거형태 집평수 방개수
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);  
		ArrayList<Post_house> alist = sns.gethouseinfo(houseinfo);
		return alist;
	}
	
	public ArrayList<Post_house> getfamilyinfo(Cust_houseinfo houseinfo) { //	ii) 가족인원수 가족형태 
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);  
		ArrayList<Post_house> familylist = sns.getfamilyinfo(houseinfo);
		return familylist;
	}
	
	public ArrayList<Post_house> getcustfamilyinfo(String famliy, String sex) { // iii)성별 가족형태
		Connection con = getConnection();
		CmtSns sns = CmtSns.getInstance();
		sns.setConnection(con);  
		ArrayList<Post_house> custfamilylist = sns.getcustfamilyinfo(famliy,sex);
		return custfamilylist;
	}
	




}
