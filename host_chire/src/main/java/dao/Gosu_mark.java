package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.Bachi_info;
import dto.Bachi_market;
import dto.Bachi_market_request;
import dto.Bachi_market_review;
import dto.Gosu_market;
import dto.Bachi_product;


public class Gosu_mark {
	
	Connection conn = null;
	Statement stmt = null;
	Bachi_info bachi_info = new Bachi_info();
	Bachi_product bachi_product = new Bachi_product();
	
	
	void conn() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://43.201.98.55:3306/interior?useUnicode=true&characterEncoding=utf8","minji","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void diconn() {
		try {
			 conn.close();
			 stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int market_id() {
		int market_id = 0;	
		try {
			this.conn();
			if(conn == null)
			throw new Exception("데이터베이스에 접근할 수 없습니다.");		
			stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select max(market_id) from gosu_market;");
		if(rs.next()) {
			market_id = rs.getInt("max(market_id)"); //max순번
		}
		this.diconn();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return market_id;
		
	}
	
	public void gosu_pro_conn(int market_id, int gosu_id) { // gosu_market 테이블과 gosu_product의 연결 테이블에 넣을 값들
		try {
			this.conn();
			if(conn == null)
				throw new Exception("데이터베이스에 접근할 수 없습니다.");			
		// select
		stmt = conn.createStatement();
		String command = String.format("insert into gosu_m_p(market_id,gosu_id) values(%s,%s);");
			//gosu_info 
		int rowNum = stmt.executeUpdate(command);
		
		if(rowNum < 1)
			throw new Exception("데이터베이스에 접근할 수 없습니다.");

		
		this.diconn();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void gosu_pro_add(Bachi_product gosu_pro_add){ //입력
		//게시글 작성

		try{
			this.conn();
			if(conn == null)
					throw new Exception("데이터베이스에 접근할 수 없습니다.");			
			// select
			stmt = conn.createStatement();
			String command = String.format("insert into gosu_product(cust_id,gosu_title,gosu_text,gosu_price)"+"values('%s','%s','%s',%s);", 
				gosu_pro_add.getCust_id(),gosu_pro_add.getGosu_text(),gosu_pro_add.getGosu_price());
				//gosu_info 
			int rowNum = stmt.executeUpdate(command);
			
			if(rowNum < 1)
				throw new Exception("데이터베이스에 접근할 수 없습니다.");
	
			
			this.diconn();
			}catch(Exception ignored) {
				ignored.printStackTrace();
			}
	
	}
	
	public ArrayList<Bachi_product> gosu_pro_det(int market_id){
		ArrayList<Bachi_product> bachi_product = new ArrayList<Bachi_product>();
		try {
			this.conn();
			if(conn == null)
			throw new Exception("데이터베이스에 접근할 수 없습니다.");		
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from gosu_product left join gosu_market on gosu_product.gosu_id = gosu_market.gosu_id where gosu_market.market_id ='" +market_id+"';");
			while(rs.next()){
				Bachi_product gosu_pro = new Bachi_product();
				gosu_pro.setGosu_id(rs.getInt("gosu_id"));
				gosu_pro.setCust_id(rs.getString("cust_id"));
				gosu_pro.setGosu_text(rs.getString("gosu_title"));
				gosu_pro.setGosu_text(rs.getString("gosu_text"));
				gosu_pro.setGosu_price(rs.getInt("gosu_price"));
				bachi_product.add(gosu_pro);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public ArrayList<Bachi_product> gosu_pro_sel(String cust_id){ 
		
		
		ArrayList<Bachi_product> pro_list = new ArrayList<Bachi_product>();
		try {
			this.conn();
			if(conn == null)
					throw new Exception("데이터베이스에 접근할 수 없습니다.");			
			// 상품에 대한 값
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select* from gosu_market where cust_id ='"+cust_id+"';");
			while(rs.next()){							
				//return 해야함
				Bachi_product gosu_pro = new Bachi_product();
				gosu_pro.setGosu_id(rs.getInt("gosu_id"));
				gosu_pro.setCust_id(rs.getString("cust_id"));
				gosu_pro.setGosu_text(rs.getString("gosu_text"));
				gosu_pro.setGosu_price(rs.getInt("gosu_price"));
				
				
				pro_list.add(gosu_pro);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}	
		return pro_list;
	}
	public void gosu_pro_del(int gosu_id) { 
		try {
			this.conn();
			if(conn == null)
				throw new Exception("데이터베이스를 사용할 수 없습니다.");
			stmt = conn.createStatement();
			stmt.executeUpdate("delete from gosu_product where gosu_id='"+gosu_id+"';");
			this.diconn();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	public ArrayList<Bachi_market> gosu_mark_sel(int page,int limit){
	    ArrayList<Bachi_market> market_list = new ArrayList<Bachi_market>();
	    int startrow=(page-1)*9; 
	    try{
	        this.conn();
	        if(conn == null)
	            throw new Exception("데이터베이스에 접근할 수 없습니다.");			

	        stmt = conn.createStatement();
	        ResultSet rs = stmt.executeQuery("select market_id,gosu_market.cust_id,gosu_market.gosu_id,market_picture,market_text,market_title,gosu_menu1,gosu_menu2,gosu_price from gosu_product inner join gosu_market ON gosu_product.gosu_id = gosu_market.gosu_id order by market_id desc limit "+startrow+", 9;");

	        while(rs.next()){
	            Bachi_market mark = new Bachi_market();
	            
	        
	            // gosu_market 테이블의 데이터를 Gosu_market 객체에 저장
	            mark.setMarket_id(rs.getInt("market_id"));
	            mark.setCust_id(rs.getString("cust_id"));

	            mark.setGosu_id(rs.getString("gosu_id"));
	            mark.setMarket_picture(rs.getString("market_picture"));
	            mark.setMarket_text(rs.getString("market_text"));
	            mark.setMarket_title(rs.getString("market_title"));
	            mark.setGosu_menu1(rs.getString("gosu_menu1"));
				mark.setGosu_menu2(rs.getString("gosu_menu2"));
	            // gosu_product 테이블의 데이터를 Gosu_product 객체에 저장
	            mark.setGosu_price(rs.getString("gosu_price"));
	            
	            // 두 객체를 함께 ArrayList에 추가
	            market_list.add(mark);
	        }
	        this.diconn();
	    } catch(Exception ignored) {
	        ignored.printStackTrace();
	    }

	    return market_list;
	}

	
	
	public ArrayList<Bachi_market> gosu_mark_sel_custom(String serch_id,String serch_title,String serch_text,int page,int limit){
		 int startrow=(page-1)*9; 
		
		ArrayList<Bachi_market> market_list = new ArrayList<Bachi_market>();
		
		
		try{
			this.conn();
			if(conn == null)
					throw new Exception("데이터베이스에 접근할 수 없습니다.");			
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select market_id,gosu_market.cust_id,gosu_market.gosu_id,market_picture,market_text,market_title,gosu_menu1,gosu_menu2,gosu_price from gosu_market inner join gosu_product on gosu_market.gosu_id = gosu_product.gosu_id where gosu_market.cust_id like '%"+serch_id+"%' or market_title like '%"+serch_title+"%' or market_text like'%"+serch_text+"%' order by market_id desc limit "+startrow+",9;");
			while(rs.next()){
				
				Bachi_market mark = new Bachi_market();
				mark.setMarket_id(rs.getInt("market_id"));
				mark.setCust_id(rs.getString("cust_id"));
				mark.setGosu_id(rs.getString("gosu_id"));
				mark.setMarket_picture(rs.getString("market_picture"));
				mark.setMarket_text(rs.getString("market_text"));
				mark.setMarket_title(rs.getString("market_title"));
				mark.setGosu_price(rs.getString("gosu_price"));
				mark.setGosu_menu1(rs.getString("gosu_menu1"));
				mark.setGosu_menu2(rs.getString("gosu_menu2"));
				
				market_list.add(mark);
			}
			this.diconn();
			}catch(Exception ignored) {
				ignored.printStackTrace();
			}

		return market_list;
		}	
	
	public ArrayList<Bachi_market> gosu_mark_sel_det(int market_id){
		// 상세 페이지
		
		ArrayList<Bachi_market> market_list_cust = new ArrayList<Bachi_market>();
		
		
		try{
			this.conn();
			if(conn == null)
					throw new Exception("데이터베이스에 접근할 수 없습니다..");			
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select market_id,gosu_market.cust_id,gosu_market.gosu_id,market_picture,market_text,market_title,gosu_menu1,gosu_menu2,gosu_price from gosu_product inner join gosu_market on gosu_product.gosu_id = gosu_market.gosu_id where market_id="+market_id);
			while(rs.next()){
			
				Bachi_market mark = new Bachi_market();
				
				
				mark.setMarket_id(rs.getInt("market_id"));
				mark.setCust_id(rs.getString("cust_id"));
				mark.setGosu_id(rs.getString("gosu_id"));
				mark.setMarket_picture(rs.getString("market_picture"));
				mark.setMarket_text(rs.getString("market_text"));
				mark.setMarket_title(rs.getString("market_title"));
				mark.setGosu_menu1(rs.getString("gosu_menu1"));
				mark.setGosu_menu2(rs.getString("gosu_menu2"));
				mark.setGosu_price(rs.getString("gosu_price"));
				
				market_list_cust.add(mark);
			}
			this.diconn();
			}catch(Exception ignored) {
				ignored.printStackTrace();
			}

		return market_list_cust;
		}	
	
	public void gosu_mark_add(Bachi_market gosu_mark_add){

		try{
			this.conn();
			if(conn == null)
					throw new Exception("데이터베이스에 접근할 수 없습니다.");			
			
			stmt = conn.createStatement();
			String command = String.format("insert into gosu_market(cust_id,gosu_id,market_picture,market_text,market_title,gosu_menu1,gosu_menu2) values('%s',%s,'%s','%s','%s','%s','%s');",
					gosu_mark_add.getCust_id(),gosu_mark_add.getGosu_id(),gosu_mark_add.getMarket_picture(),gosu_mark_add.getMarket_text(),gosu_mark_add.getMarket_title(),gosu_mark_add.getGosu_menu1(),gosu_mark_add.getGosu_menu2());
				
			int rowNum = stmt.executeUpdate(command);
			
			if(rowNum < 1)
				throw new Exception("DB에 연결할 수 없습니다.");
	
			
			this.diconn();
			}catch(Exception ignored) {
				ignored.printStackTrace();
			}
	
	}
	public void gosu_mark_update(Bachi_market gosu_mark_update){ 
		

		try{
			this.conn();
			if(conn == null)
					throw new Exception("데이터베이스에 접근할 수 없습니다.");			
			
			stmt = conn.createStatement();
			String command = String.format("update gosu_market set gosu_id=%s,market_picture='%s',market_text='%s',market_title='%s',gosu_menu1='%s',gosu_menu2='%s'where market_id = %s",
					gosu_mark_update.getGosu_id(),gosu_mark_update.getMarket_picture(),gosu_mark_update.getMarket_text(),gosu_mark_update.getMarket_title(),gosu_mark_update.getGosu_menu1(),gosu_mark_update.getGosu_menu2(),gosu_mark_update.getMarket_id());
			
			int rowNum = stmt.executeUpdate(command);
			
			if(rowNum < 1)
				throw new Exception("데이터베이스에 접근할 수 없습니다.");
	
			
			this.diconn();
			}catch(Exception ignored) {
				ignored.printStackTrace();
			}
	
	}
	
	
	public void gosu_mark_del(int market_id) {
	    try {
	        this.conn();
	        if(conn == null)
	            throw new Exception("데이터베이스에 접근할 수 없습니다.");
	        stmt = conn.createStatement();
	        stmt.executeUpdate("delete from gosu_market where market_id="+ market_id);
	        
	        this.diconn();

	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}

	public Bachi_product gosu_product_id(int gosu_id) { 	
		Bachi_product product = new Bachi_product();
		try {
			this.conn();
			if(conn == null)
			throw new Exception("데이터베이스에 접근할 수 없습니다.");		
			stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select gosu_id,gosu_price from gosu_product where gosu_id="+gosu_id+";"); //gosu_id와 price를 찾음
		if(rs.next()) {
			product.setGosu_id(rs.getInt("gosu_id"));
			product.setGosu_price(rs.getInt("gosu_price"));
			//gosu_id = rs.getInt("gosu_id"); //min
		}
		this.diconn();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return product;
	}
	
	public void gosu_middle(int market_id,int gosu_id) { //market_id와 gosu_id를 연결해주는 중간테이블 insert
		try {
			this.conn();
			if(conn == null)
				throw new Exception("데이터베이스에 접근할 수 없습니다.");
			stmt = conn.createStatement();
			String command = String.format("insert into gosu_m_p(market_id,gosu_id) values(%s,%s);",market_id,gosu_id);
				
			int rowNum = stmt.executeUpdate(command);
			
			if(rowNum < 1)
				throw new Exception("DB에 연결할 수 없습니다.");
	
		
			this.diconn();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void gosu_middle_delete(int market_id) { //update, delete 시 같이 삭제용
		try {
			this.conn();
			if(conn == null)
				throw new Exception("데이터베이스에 접근할 수 없습니다.");
			stmt = conn.createStatement();
			stmt.executeUpdate("delete from gosu_m_p where market_id = "+market_id);

			this.diconn();	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Bachi_product> option_select(int bachi_market){
		ArrayList<Bachi_product> optionlist = new ArrayList<>();
		
		try {
			this.conn();
			if(conn == null)
			throw new Exception("데이터베이스에 접근할 수 없습니다.");		
			stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select gosu_market.market_id,gosu_product.gosu_id,gosu_product.gosu_title,gosu_product.gosu_text,gosu_product.gosu_price from gosu_m_p inner join gosu_market on gosu_m_p.market_id=gosu_market.market_id right join gosu_product on gosu_product.gosu_id=gosu_m_p.gosu_id where gosu_market.market_id = "+bachi_market+";"); //gosu_id와 price를 찾음
		while(rs.next()) {
			Bachi_product option = new Bachi_product();
			option.setGosu_id(rs.getInt("gosu_id"));
			option.setGosu_title(rs.getString("gosu_title"));
			option.setGosu_text(rs.getString("gosu_text"));
			option.setGosu_price(rs.getInt("gosu_price"));
			optionlist.add(option);
		}
		this.diconn();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return optionlist;
	}

	public String cust_img(String cust_id) {
		String cust_img = "";
		try {
			this.conn();
			if(conn == null)
			throw new Exception("데이터베이스에 접근할 수 없습니다.");		
			stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select cust_pic from cust_info where cust_id = '"+cust_id+"'"); 
		if(rs.next()) {
			cust_img = rs.getString("cust_pic");
		}
		this.diconn();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cust_img;
	}
	public int count_list()throws Exception{
		int count = 0;
		    try {
		    	this.conn();
				if(conn == null)
				throw new Exception("데이터베이스에 접근할 수 없습니다.");	
		 
		    		stmt = conn.createStatement();
		    		ResultSet rs = stmt.executeQuery("select count(*) from gosu_market"); // 페이징하기위함
					if(rs.next()) {
						count = rs.getInt("count(*)");
					}
					System.out.println(count);
		    }catch(Exception e) {
		    	e.printStackTrace();
		    }
		   
		return count;
	}
	
	public int count_list_custom(String search_id,String search_title,String search_text )throws Exception{
		int count = 0;
		    try {
		    	this.conn();
				if(conn == null)
				throw new Exception("데이터베이스에 접근할 수 없습니다.");	
		 
		    		stmt = conn.createStatement();
		    		ResultSet rs = stmt.executeQuery("select count(*) from gosu_market where cust_id like '%"+search_id+"%' or market_title like '%"+search_title+"%' or market_text like'%"+search_text+"%'"); // 페이징하기위함
					if(rs.next()) {
						count = rs.getInt("count(*)");
					}
					System.out.println(count);
		    }catch(Exception e) {
		    	e.printStackTrace();
		    }
		   
		return count;
	}
	
	public ArrayList<Bachi_market_review> review_select(int market_id){ //마켓 게시글을 기준으로 리뷰가 출력됨
		
		ArrayList<Bachi_market_review> review_list = new ArrayList<>();
		try{
			this.conn();
			if(conn == null)
					throw new Exception("데이터베이스에 접근할 수 없습니다.");			
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from gosu_review where market_id="+market_id);
			while(rs.next()){
					
				Bachi_market_review review = new Bachi_market_review();	
				review.setCust_id(rs.getString("cust_id"));
				review.setMarket_id(rs.getInt("market_id"));
				review.setReview(rs.getString("review"));
				review.setReview_pic(rs.getString("review_pic"));
				review.setReview_star(rs.getInt("review_star"));		
				review_list.add(review);
			}
			this.diconn();
			}catch(Exception ignored) {
				ignored.printStackTrace();
			}

		return review_list;
	}
	 
	public int review_star_count(String cust_id) { //별점 평균으로 나타내게끔
		int review_avg = 0;
		try {
			this.conn();
			if(conn == null)
					throw new Exception("데이터베이스에 접근할 수 없습니다.");			
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select avg(review_star) from gosu_review where cust_id='"+cust_id+"';");
			if(rs.next()){
			review_avg = rs.getInt("avg(review_star)");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return review_avg;
	}
	
	public ArrayList<Bachi_market_request> market_request_select(int market_id){
		ArrayList<Bachi_market_request> request_list = new ArrayList<>();
		try{
			this.conn();
			if(conn == null)
					throw new Exception("데이터베이스에 접근할 수 없습니다.");			
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from gosu_market_req where market_id="+market_id);
			while(rs.next()){
					
				Bachi_market_request request = new Bachi_market_request();	
				request.setCust_id(rs.getString("cust_id"));
				request.setGosu_market_req(rs.getInt("gosu_market_req"));
				request.setMarket_id(rs.getInt("market_id"));
				request.setGosu_id(rs.getInt("gosu_id"));
				request.setReq_text(rs.getString("req_text"));
				request_list.add(request);
			}
			this.diconn();
			}catch(Exception ignored) {
				ignored.printStackTrace();
			}
		return request_list;
	}
	
	public String market_req_gosu_id (int market_id,int gosu_id) {
		String req_gosu_id = "";
		try {
			
			this.conn();
			if(conn == null)
					throw new Exception("데이터베이스에 접근할 수 없습니다.");			
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select gosu_product.gosu_title from gosu_m_p left join gosu_market on gosu_m_p.market_id = gosu_market.market_id right join gosu_product on gosu_m_p.gosu_id = gosu_product.gosu_id where gosu_m_p.market_id = "+market_id+" and gosu_m_p.gosu_id = "+gosu_id);
			if(rs.next()){
				req_gosu_id = rs.getString("gosu_product.gosu_title");
			
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	return req_gosu_id;
	}
}
