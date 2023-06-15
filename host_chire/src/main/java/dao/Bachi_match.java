package dao;
import static db.JdbcUtil.*;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dto.Bachi_match_AnsBeen;
import dto.Bachi_match_Been;


public class Bachi_match {
	DataSource ds;
	Connection con;
	private static Bachi_match bachi_match;
	
	public static Bachi_match getInstance() {
		if(bachi_match == null) {
			bachi_match = new Bachi_match();
		}
		return bachi_match;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertArticle(Bachi_match_Been article) {
	    PreparedStatement pstmt = null; //SQL문에 매핑
	    ResultSet rs = null;

	    String sql = "";
	    int insertCount = 0;

	    try {
	        pstmt = con.prepareStatement("select max(est_id) from gosu_req"); //현재 갯수 카운트
	        rs = pstmt.executeQuery();

	        sql = "insert into gosu_req(cust_id,gosu_menu1,gosu_menu2,est_q1,est_q2,est_q3) values(?,?,?,?,?,?)";

	        pstmt = con.prepareStatement(sql); //sql문 실행할 객체
	        pstmt.setString(1, article.getCust_id()); //각각의 values의 값들 input
	        pstmt.setString(2, article.getGosu_menu1());
	        pstmt.setString(3, article.getGosu_menu2());
	        pstmt.setString(4,article.getEst_q1());       
	        pstmt.setString(5,article.getEst_q2());
	        pstmt.setString(6,article.getEst_q3());

	        
	     insertCount=pstmt.executeUpdate(); 
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return insertCount; //삽입된 행의 개수를 반환
	}

	public ArrayList<Bachi_match_Been> selectMatchReq(int page,int limit ,String gosu_menu1,String gosu_menu2,String cust_id){
		/*로그인 된 바치의 ID가 답변을 하거나 해당 바치가 답변을 하지 않은 건에 대해서는 질문한 것으로 표시 */
		PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql = "select gosu_req.est_id, gosu_req.cust_id, gosu_menu1, gosu_menu2, est_q1, est_q2, est_q3, est_q_date, cust_adr, cust_pic, gosu_ans.est_id AS ans_est_id, gosu_ans.cust_id  from gosu_req inner join cust_info on gosu_req.cust_id = cust_info.cust_id left join gosu_ans on gosu_req.est_id = gosu_ans.est_id and gosu_ans.cust_id = ?";
		    if (gosu_menu1 == null || gosu_menu1.equals("") || gosu_menu1.equals("전체")) {
		        // where절을 생략합니다.
		    } else if (gosu_menu2 == null || gosu_menu2.equals("")) {
		        sql = sql + " where gosu_menu1 = ?";
		    } else if (!"전체".equals(gosu_menu1)) {
		        sql = sql + " where gosu_menu1 = ? and gosu_menu2 = ?";
		    }
		    sql = sql + " order by gosu_req.est_id desc, est_q_date asc limit ?, 10;";

		 ArrayList<Bachi_match_Been> match_been = new ArrayList<Bachi_match_Been>();
		 Bachi_match_Been been = null;
		 int startrow=(page-1)*10;
		 try {
			 pstmt = con.prepareStatement(sql);
				
			 	if(gosu_menu1 == null || gosu_menu1.equals("") || gosu_menu1.equals("전체")) { //gosu_menu1(기본값이 null)일경우
			 		pstmt.setString(1, cust_id);
			 		pstmt.setInt(2, startrow);
			 	}else if(gosu_menu2 == null || gosu_menu2.equals("")) {
			 		pstmt.setString(1, cust_id);
			 		pstmt.setString(2, gosu_menu1);
			 		pstmt.setInt(3, startrow);
			 	}else {
			 		pstmt.setString(1, cust_id);
			 		pstmt.setString(2, gosu_menu1);
					pstmt.setString(3, gosu_menu2);
					pstmt.setInt(4, startrow);
			 	}
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					 been = new Bachi_match_Been(); //삽입할 객체 생성
				

					been.setEst_id(rs.getInt("est_id")); //객체에 select한 값 담기
					been.setCust_id(rs.getString("gosu_req.cust_id")); // 참조 아이디
					been.setEst_q1(rs.getString("est_q1"));
					been.setEst_q2(rs.getString("est_q2"));
					been.setEst_q3(rs.getString("est_q3"));
					been.setGosu_menu1(rs.getString("gosu_menu1"));
					been.setGosu_menu2(rs.getString("gosu_menu2"));
					been.setEst_q_date(rs.getString("est_q_date"));
					been.setCust_pic(rs.getString("cust_pic"));
					been.setAns_est_id(rs.getInt("ans_est_id")); //답변된 아이디
					been.setCust_adr(rs.getString("cust_adr"));
					been.setAns_cust_id(rs.getString("gosu_ans.cust_id")); //답변자 아이디
					
					match_been.add(been); //ArrayList에 담기

				}
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
				close(rs);
				close(pstmt); //sql 닫기
			}
		 
		return match_been; //프론트 화면에 보낼 ArrayList 반환하기
	}
	
	public ArrayList<Bachi_match_Been> select_one_req(int est_id){
		 PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql = "select est_id,gosu_req.cust_id,gosu_menu1,gosu_menu2,est_q1,est_q2,est_q3,est_q_date,cust_adr from gosu_req inner join cust_info where gosu_req.cust_id = cust_info.cust_id and est_id = ?;";
		 ArrayList<Bachi_match_Been> match_been = new ArrayList<Bachi_match_Been>();
		
		 try {
			 pstmt = con.prepareStatement(sql);
				  pstmt.setInt(1, est_id); // 입력받은 est_id 값을 SQL 쿼리문에 전달
				  rs = pstmt.executeQuery();
				if(rs.next()){
					Bachi_match_Been been = new Bachi_match_Been(); //삽입할 객체 생성
				

					been.setEst_id(rs.getInt("est_id")); //객체에 select한 값 담기
					been.setCust_id(rs.getString("cust_id"));
					been.setEst_q1(rs.getString("est_q1"));
					been.setEst_q2(rs.getString("est_q2"));
					been.setEst_q3(rs.getString("est_q3"));
					been.setGosu_menu1(rs.getString("gosu_menu1"));
					been.setGosu_menu2(rs.getString("gosu_menu2"));
					been.setEst_q_date(rs.getString("est_q_date"));
					been.setCust_adr(rs.getString("cust_adr"));
					
					match_been.add(been); //ArrayList에 담기
				
				}
			 
			 
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
				close(rs);
				close(pstmt); //sql 닫기
			}
		 
		return match_been; //프론트 화면에 보낼 ArrayList 반환하기
	}
	
	public int count_list (String gosu_menu1,String gosu_menu2)throws Exception{
		int count = 0;
		 PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    try {
		    String sql = "select count(*) from gosu_req"; // 페이징하기위함
		    if(gosu_menu1 == null || gosu_menu1.equals("") || gosu_menu1.equals("전체")) {
		    	//생략
		    }else if(gosu_menu2 == null || gosu_menu2.equals("")){
		    	 sql = sql + " where gosu_menu1 = ?";
		    
		    }else if (!"전체".equals(gosu_menu1)) {
		    	sql = sql + " where gosu_menu1 = ? and gosu_menu2 = ?";
		    }
		    pstmt = con.prepareStatement(sql);
		    
		    if(gosu_menu1 == null || gosu_menu1.equals("") || gosu_menu1.equals("전체")) {
		    	//생략
		    }else if(gosu_menu2 == null || gosu_menu2.equals("")) {
		    	pstmt.setString(1, gosu_menu1);
		    }else {
		    	pstmt.setString(1, gosu_menu1);
		    	pstmt.setString(2, gosu_menu2);
		    }
		    
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt("count(*)");
		    }catch(Exception e) {
		    	e.printStackTrace();
		    }
			System.out.println(count);
		return count;
	}
	
	public int insertArticleAns(Bachi_match_AnsBeen article) {
		   PreparedStatement pstmt = null; //SQL문에 매핑
		    ResultSet rs = null;

		    String sql = "";
		    int insertCount = 0;

	    try {
	    	 pstmt = con.prepareStatement("select count(*) from gosu_ans"); //현재 갯수 카운트
		        rs = pstmt.executeQuery();

	        sql = "insert into gosu_ans(est_id,cust_id,est_a1,est_a2,est_a3) values(?,?,?,?,?)";
	        pstmt = con.prepareStatement(sql); //sql문 실행할 객체
	        pstmt.setInt(1, article.getEst_id()); //각각의 values의 값들 input
	        pstmt.setString(2, article.getCust_id());
	        pstmt.setString(3, article.getEst_a1());
	        pstmt.setString(4, article.getEst_a2());       
	        pstmt.setString(5, article.getEst_a3());
	      

	        
	     insertCount=pstmt.executeUpdate(); // 실행 및 count
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return insertCount; //삽입된 행의 개수를 반환
	}
	public int select_answered(int est_id,String cust_id) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "select est_id from gosu_ans where est_id = ? and cust_id = ?";
	    int est_id_been = 0;

	    try {
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, est_id); // 입력받은 est_id 값을 SQL 쿼리문에 전달
	        pstmt.setString(2, cust_id);
	        rs = pstmt.executeQuery();

	        if(rs.next()){
	            est_id_been = rs.getInt("est_id");
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }

	    return est_id_been;
	}
	
	
	public ArrayList<Bachi_match_AnsBeen> select_one_ans(int est_id,String cust_id){
		 PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql = "select * from gosu_ans where est_id = ? and cust_id = ?";
		 ArrayList<Bachi_match_AnsBeen> match_been = new ArrayList<Bachi_match_AnsBeen>();
		
		 try {
			 pstmt = con.prepareStatement(sql);
			   pstmt.setInt(1, est_id); // 입력받은 est_id 값을 SQL 쿼리문에 전달
			   pstmt.setString(2, cust_id);
				rs = pstmt.executeQuery();
			 
				if(rs.next()){
					Bachi_match_AnsBeen been = new Bachi_match_AnsBeen(); //삽입할 객체 생성
				
					
//					been = new Bachi_match_Been();
					been.setEst_id(rs.getInt("est_id")); //객체에 select한 값 담기
					been.setCust_id(rs.getString("cust_id"));
					been.setEst_a1(rs.getString("est_a1"));
					been.setEst_a2(rs.getString("est_a2"));
					been.setEst_a3(rs.getString("est_a3"));
					been.setConst_date(rs.getString("const_date"));
					been.setPayment(rs.getString("payment"));

					match_been.add(been); //ArrayList에 담기
				
				}
			 
			 
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
				close(rs);
				close(pstmt); //sql 닫기
			}
		 
		return match_been; //프론트 화면에 보낼 ArrayList 반환하기
	}
	
	public ArrayList<Bachi_match_Been> select_gosu_menu(){ //gosu_menu 중복제거하여 현재 있는 카테고리를 선택하도록
		  PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql = "select distinct gosu_menu1,gosu_menu2 from gosu_req;";

		    ArrayList<Bachi_match_Been> list = new ArrayList<Bachi_match_Been>();
			 try {
				 pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
				 
					while(rs.next()){
					 //삽입할 객체 생성
						Bachi_match_Been menu = new Bachi_match_Been();
						
						menu.setGosu_menu1(rs.getString("gosu_menu1"));	
						menu.setGosu_menu2(rs.getString("gosu_menu2"));
						list.add(menu); 
						
					}
				 
				 
			 }catch(Exception e){
				 e.printStackTrace();
			 }finally{
					close(rs);
					close(pstmt); //sql 닫기
				}
			 
			return list; //프론트 화면에 보낼 ArrayList 반환하기
		
		}
	
	
}
