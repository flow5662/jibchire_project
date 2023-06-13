package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import dto.Cust_follow;
import dto.Cust_houseinfo;
import dto.Cust_info;
import dto.Feed;
import dto.Feed_comment;
import dto.Feed_like;
import dto.Post_house;
import dto.Pro_post;
import dto.SearchSns;

public class CmtSns {

	DataSource ds;
	Connection con;
	private static CmtSns cmtsns;

	private CmtSns() {
	}

	public static CmtSns getInstance(){   //객체 재사용
		if(cmtsns == null){
			cmtsns = new CmtSns();
		}
		return cmtsns;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	public int insertFeed(Feed feed){   //sns글쓰기 완료 후 table에 저장되는 일
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(feed_id) from feed"); //feed_id는 PK이므로 제일 큰 값을 가져와서 (값이 있으면) 그것보다 1 큰값을 insert
			rs = pstmt.executeQuery();
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into feed (feed_id,cust_id,feed_pics,feed_txt,";
			sql+=" feed_hashtag, feed_date)"+"values(?,?,?,?,?,now())";
			System.out.println("insert 잘 되어가나요?");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, feed.getCust_id());  //cust_id를 해야한다
			pstmt.setString(3, feed.getFeed_pics());
			pstmt.setString(4, feed.getFeed_txt());
			pstmt.setString(5, feed.getFeed_hashtag());
			//pstmt.setInt(6, feed.getPro_id());
			//pstmt.setInt(7, feed.getUsed_id());
			//pstmt.setInt(8, feed.getMarket_id());

			insertCount=pstmt.executeUpdate(); //수행하면 insertCount=1

		}catch(Exception ex){
			System.out.println(ex+"=> insertFeed에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	
	public int updateFeed(Feed feed){   //sns글쓰기 수정
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int updateCount=0;

		try{
			sql="update feed set feed_pics=?, feed_txt=?,feed_hashtag=? where feed_id=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, feed.getFeed_pics());
			pstmt.setString(2, feed.getFeed_txt());
			pstmt.setString(3, feed.getFeed_hashtag());
			pstmt.setInt(4, feed.getFeed_id());

			updateCount=pstmt.executeUpdate(); //수행하면 insertCount=1

		}catch(Exception ex){
			System.out.println(ex+"=> updateFeed에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return updateCount;

	}


	public int selectListCount() { //페이징을 위해 feed 테이블의 전체 행 수 구하기

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from feed;");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); //첫번째 값을 listCount에 넣어라 (어차피 하나의 값 밖에 없지만)
			}
		}catch(Exception ex){
			System.out.println(ex+"selectListCount 메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	
	public ArrayList<Feed> selectArticleList(int page,int limit){  //리스트를 보여주기 위해 전체 값을 가져오기
		PreparedStatement pstmt = null;  
		//PreparedStatement를 사용하면 sql문에서 변수값 대신 ? 를 사용할 수 있다 그리고 setString()이나 setInt로 비워둔 부분에 데이터를 넣어줌
		//물음표가 여러개면 여러개 쓰고 key값에 들어가는 숫자는 물음표의 순번
		ResultSet rs = null;
		String board_list_sql="select * from feed "
				+" left outer join cust_houseinfo on feed.cust_id=cust_houseinfo.cust_id "
				+ "order by feed_date desc limit ?,8";
		ArrayList<Feed> articleList = new ArrayList<Feed>();
		Feed feed = null;
		int startrow=(page-1)*8; 
		//1페이지는 0~7번(8개), 2페이지는 8~15번(8개), 3페이지는 16~23번(8개)

		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);  
			rs = pstmt.executeQuery();

			while(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				//feed.setFeed_pics(rs.getString("feed_pics"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				/*
				String hashtags = rs.getString("feed_hashtag");
				String [] feed_hashtags = hashtags.split("#");
				System.out.println(feed_hashtags[0]);
				feed.setFeed_hashtag(feed_hashtags[0]);
				feed.setFeed_hashtag1(feed_hashtags[1]);
				feed.setFeed_hashtag2(feed_hashtags[2]);
				feed.setFeed_hashtag3(feed_hashtags[3]);
				*/
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
				feed.setFeed_read(rs.getInt("feed_read"));
				feed.setCust_pic(rs.getString("cust_pic"));
				String feed_pics = rs.getString("feed_pics");
				String [] filename = feed_pics.split(",");
				/*확인용
				System.out.println("feed_pics=>"+feed_pics);
				System.out.println("filename[0] =>"+filename[0]);
				System.out.println("filename[1] =>"+filename[1]);
				System.out.println("filename[2] =>"+filename[2]);
				System.out.println("filename[3] =>"+filename[3]);
				*/
				feed.setFeed_pics(filename[0]);
				//썸네일에서는 어차피 파일 하나만 보여지기 때문에 썸네일 파일을 만든 첫번째 파일로 만들면 된다
				articleList.add(feed);
			}

		}catch(Exception ex){
			System.out.println(ex+"selectArticleList 메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	public int updateReadCount(int feed_id){ //조회수 증가

		PreparedStatement pstmt = null;
		int updateCount = 0;

		try{
			pstmt=con.prepareStatement("select feed_read from feed where feed_id="+feed_id); //feed_id는 PK이므로 제일 큰 값을 가져와서 (값이 있으면) 그것보다 1 큰값을 insert
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int read = rs.getInt("feed_read");
				System.out.println("조회수 값은 =>" +read);
				String sql=null;
				
				if(read==0) {	
					sql="update feed set feed_read = 1 where feed_id = "+feed_id;
				}else {
					sql="update feed set feed_read = feed_read+1 where feed_id = "+feed_id;
				}
				pstmt=con.prepareStatement(sql);
				updateCount = pstmt.executeUpdate();
			}

		}catch(SQLException ex){
			System.out.println(ex+"updateReadCount 메소드에서 오류");
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}
	public ArrayList<Feed> selectArticle(int feed_id,String feed_writer){  // sns 글읽기를 위해 select하는 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Feed feed = null;
		ArrayList<Feed> articleList = new ArrayList<Feed>();
		try{
			pstmt = con.prepareStatement("select * from feed left outer join cust_houseinfo on cust_houseinfo.cust_id= ? where feed.cust_id = ? order by feed.feed_date desc;");
			pstmt.setString(1, feed_writer);
			pstmt.setString(2, feed_writer);
			rs= pstmt.executeQuery();

			while(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				//feed.setFeed_pics(rs.getString("feed_pics"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
				String feed_pics = rs.getString("feed_pics");
				String [] filename = feed_pics.split(",");
				feed.setFeed_pics(filename[0]);
				feed.setFeed_pic1(filename[1]);
				feed.setFeed_pic2(filename[2]);
				feed.setFeed_pic3(filename[3]);
				/*확인용
				System.out.println("feed_pics=>"+feed_pics);
				System.out.println("filename[0] =>"+filename[0]);
				System.out.println("filename[1] =>"+filename[1]);
				System.out.println("filename[2] =>"+filename[2]);
				System.out.println("filename[3] =>"+filename[3]);
				*/
				feed.setCust_pic(rs.getString("cust_pic"));
//				feed.setWriterintroduce(rs.getString("cust_introduce"));
				feed.setFeed_read(rs.getInt("feed_read"));
				articleList.add(feed);
			}
		}catch(Exception ex){
			System.out.println(ex+"selectArticle 메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	public ArrayList<Feed> selectHeartArticle(int feed_id,String cust_id,String feed_writer){  // 로그인 후 sns 글읽기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Feed feed = null;
		ArrayList<Feed> articleList = new ArrayList<Feed>();
		try{
			String sql="select * from feed left outer join feed_like on feed.feed_id= feed_like.feed_id and feed_like.cust_id= ? "
					+ " left outer join cust_follow on feed.cust_id = cust_follow.cust_following and cust_follow.cust_id= ? "
					+ " left outer join cust_houseinfo on cust_houseinfo.cust_id= ? "
					+ " where feed.cust_id= ? "
					+ " order by feed.feed_date desc;";  // 최신순으로 가져오기 하니까 가장 최근글이 가장 아래로 감
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cust_id);
			pstmt.setString(2, cust_id);
			pstmt.setString(3, feed_writer);
			pstmt.setString(4, feed_writer);
			rs= pstmt.executeQuery();

			while(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				feed.setLike_time(rs.getString("like_time")); //좋아요 한 피드 알기 위해서
				feed.setFollow_time(rs.getString("follow_time")); // 팔로우 한 사용자 알기 위해서
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
				String feed_pics = rs.getString("feed_pics");
				String [] filename = feed_pics.split(",");
				for(int i = 0; i<filename.length;i++) {
					if(i==0) {
						feed.setFeed_pics(filename[0]);
					}else if(i==1) {
						feed.setFeed_pic1(filename[1]);
					}else if(i==2) {
						feed.setFeed_pic2(filename[2]);
					}else if(i==3) {
						feed.setFeed_pic3(filename[3]);
					}
				}
				feed.setCust_pic(rs.getString("cust_pic"));
				//feed.setWriterintroduce(rs.getString("cust_introduce"));
				feed.setFeed_read(rs.getInt("feed_read"));
				
				articleList.add(feed);
			}
		}catch(Exception ex){
			System.out.println(ex+"selectHeartArticle메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	public Feed selectyUpdateArticle(int feed_id){  // sns 글수정
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		Feed feed = null;
		String id = null;
		try{
			pstmt2=con.prepareStatement("select cust_id from feed where feed_id="+feed_id); //feed_id는 PK이므로 제일 큰 값을 가져와서 (값이 있으면) 그것보다 1 큰값을 insert
			rs2 = pstmt2.executeQuery();
			if(rs2.next()) {
				id = rs2.getString("cust_id");
			}
			pstmt = con.prepareStatement("select * from feed left outer join cust_houseinfo on cust_houseinfo.cust_id= ? where feed.feed_id = ? ");
			pstmt.setString(1, id);
			pstmt.setInt(2, feed_id);
			rs= pstmt.executeQuery();

			if(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				//feed.setFeed_pics(rs.getString("feed_pics"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
				String feed_pics = rs.getString("feed_pics");
				String [] filename = feed_pics.split(",");
				feed.setFeed_pics(filename[0]);
				feed.setFeed_pic1(filename[1]);
				feed.setFeed_pic2(filename[2]);
				feed.setFeed_pic3(filename[3]);
				/*확인용
				System.out.println("feed_pics=>"+feed_pics);
				System.out.println("filename[0] =>"+filename[0]);
				System.out.println("filename[1] =>"+filename[1]);
				System.out.println("filename[2] =>"+filename[2]);
				System.out.println("filename[3] =>"+filename[3]);
				*/
				feed.setCust_pic(rs.getString("cust_pic"));
				//feed.setWriterintroduce(rs.getString("cust_introduce"));
				feed.setFeed_read(rs.getInt("feed_read"));
			}
		}catch(Exception ex){
			System.out.println(ex+"selectArticle 메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return feed;
	}
	public Feed selectUpdateHeartArticle(int feed_id,String cust_id){  // 로그인 후 sns 글 수정
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Feed feed = null;
		try{
			String sql="select * from feed ";
			sql+=" left outer join feed_like on feed.feed_id= feed_like.feed_id and feed_like.cust_id= ? ";
			sql+=" left outer join cust_follow on feed.cust_id = cust_follow.cust_following and cust_follow.cust_id= ? ";
			sql+=" left outer join cust_houseinfo on cust_houseinfo.cust_id= ? ";
			sql+=" where feed.feed_id= ? "; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cust_id);
			pstmt.setString(2, cust_id);
			pstmt.setString(3, cust_id);
			pstmt.setString(4, cust_id);
			rs= pstmt.executeQuery();

			if(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				feed.setLike_time(rs.getString("like_time")); //좋아요 한 피드 알기 위해서
				feed.setFollow_time(rs.getString("follow_time")); // 팔로우 한 사용자 알기 위해서
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
				String feed_pics = rs.getString("feed_pics");
				String [] filename = feed_pics.split(",");
				feed.setFeed_pics(filename[0]);
				feed.setFeed_pic1(filename[1]);
				feed.setFeed_pic2(filename[2]);
				feed.setFeed_pic3(filename[3]);
				feed.setWriterpic(rs.getString("cust_pic"));
				feed.setWriterintroduce(rs.getString("cust_introduce"));
				feed.setFeed_read(rs.getInt("feed_read"));
				
			}
		}catch(Exception ex){
			System.out.println(ex+"selectUpdateHeartArticle메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return feed;
	}
	public int deleteArticle(int feed_id){  // 본인이 작성한 게시글을 하나 삭제하기

		PreparedStatement pstmt = null;
		String board_delete_sql="delete from feed where feed_id=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, feed_id);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex+"deleteArticle메소드에서 오류");
		}	finally{
			close(pstmt);
		}

		return deleteCount;
	}
	public int insertHeart(Feed_like heart){   //좋아요 버튼 누르면 insert하는 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			sql="insert into feed_like (feed_id,cust_id,like_time) values(?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, heart.getFeed_id());
			pstmt.setString(2, heart.getCust_id());  

			insertCount=pstmt.executeUpdate(); //수행하면 insertCount=1

		}catch(Exception ex){
			System.out.println(ex+"=> insertHeard에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	public Boolean selectHeart(Feed_like heart){  // 좋아요 버튼 눌렀을 때 이미 눌렀는지 확인하는 메소드

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Boolean isSelectExist = false;

		try{
			pstmt = con.prepareStatement(
					"select * from feed_like where feed_id = ? and cust_id = ?;");
			pstmt.setInt(1, heart.getFeed_id());
			pstmt.setString(2, heart.getCust_id());
			rs= pstmt.executeQuery();

			if(rs.next()){
				isSelectExist=true;
			}
		}catch(Exception ex){
			System.out.println(ex+"selectHeart메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return isSelectExist;
	}
	public int deleteHeart(Feed_like heart){  // 좋아요 버튼 이미 눌렀다면 삭제하는 메소드

		PreparedStatement pstmt = null;
		String delete_sql="delete from feed_like where feed_id=? and cust_id=?;";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(delete_sql);
			pstmt.setInt(1, heart.getFeed_id());
			pstmt.setString(2, heart.getCust_id());
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex+"deleteHeart 메소드에서 오류");
		}	finally{
			close(pstmt);
		}

		return deleteCount;
	}
	public ArrayList<Feed> selectHeartLogin(int page, int limit, String cust_id){  // 로그인 한 개인의 좋아요 정보를 모두 불러오기

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Feed> articleList = new ArrayList<Feed>();
		Feed feed;
		int startrow=(page-1)*8; 
		try{
			pstmt = con.prepareStatement("select * from feed "
					+ " join feed_like on feed.feed_id= feed_like.feed_id and feed_like.cust_id=? "
					+ " left outer join cust_follow on feed.cust_id= cust_follow.cust_following and cust_follow.cust_id=?"
					+ " left outer join cust_houseinfo on feed.cust_id=cust_houseinfo.cust_id "
					+ " order by feed_like.like_time desc limit ?,8");
			pstmt.setString(1, cust_id);
			pstmt.setString(2, cust_id);
			pstmt.setInt(3, startrow);
			
			rs= pstmt.executeQuery();

			while(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				feed.setCust_pic(rs.getString("cust_pic"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
				feed.setFeed_read(rs.getInt("feed_read"));
				String feed_pics = rs.getString("feed_pics");
				String [] filename = feed_pics.split(",");
				for(int i = 0; i<filename.length;i++) {
					if(i==0) {
						feed.setFeed_pics(filename[0]);
					}else if(i==1) {
						feed.setFeed_pic1(filename[1]);
					}else if(i==2) {
						feed.setFeed_pic2(filename[2]);
					}else if(i==3) {
						feed.setFeed_pic3(filename[3]);
					}
				}
				feed.setLike_time(rs.getString("like_time"));
				feed.setFollow_time(rs.getString("follow_time"));
				//썸네일에서는 어차피 파일 하나만 보여지기 때문에 썸네일 파일을 만든 첫번째 파일로 만들면 된다
				articleList.add(feed);
			}
		}catch(Exception ex){
			System.out.println(ex+"selectHeartLogin메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	public ArrayList<Feed> selectSearch(SearchSns search){  // 검색결과 리스트를 보여주기 위해 전체 값을 가져오기
		PreparedStatement pstmt = null;  
		ResultSet rs = null;
		int page = search.getPage();
		String select_search ="select * from Feed "
				+ " left outer join cust_houseinfo on feed.cust_id = cust_houseinfo.cust_id "
				+ " where feed_hashtag like '%"+search.getSearchword()+"%' "
//				+ " or feed_txt like '%"+search.getSearchword()+"%' "
				+ "order by feed_date desc limit ?,8 ;";
		
		ArrayList<Feed> articleList = new ArrayList<Feed>();
		Feed feed = null;
		int startrow=(page-1)*8; 
		//1페이지는 0~7번(8개), 2페이지는 8~15번(8개), 3페이지는 16~23번(8개)
		try{
			pstmt = con.prepareStatement(select_search);
			//pstmt.setString(1,"%"+search.getSearchword()+"%");
			pstmt.setInt(1, startrow);  // 첫번째 물음표에 넣을 값지정
			rs = pstmt.executeQuery();

			while(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				//feed.setFeed_pics(rs.getString("feed_pics"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
				feed.setFeed_read(rs.getInt("feed_read"));
				String feed_pics = rs.getString("feed_pics");
				String [] filename = feed_pics.split(",");
				for(int i = 0; i<filename.length;i++) {
					if(i==0) {
						feed.setFeed_pics(filename[0]);
					}else if(i==1) {
						feed.setFeed_pic1(filename[1]);
					}else if(i==2) {
						feed.setFeed_pic2(filename[2]);
					}else if(i==3) {
						feed.setFeed_pic3(filename[3]);
					}
				}
				feed.setCust_pic(rs.getString("cust_pic"));
				//썸네일에서는 어차피 파일 하나만 보여지기 때문에 썸네일 파일을 만든 첫번째 파일로 만들면 된다
				articleList.add(feed);
			}

		}catch(Exception ex){
			System.out.println(ex+"selectSearch메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	public int selectHeartCount(String cust_id) { //좋아요 모아놓은 화면에서 페이징을 위해 갯수 가져오기
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from feed f,feed_like l where f.feed_id=l.feed_id and l.cust_id=?");
			pstmt.setString(1, cust_id);
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); //첫번째 값을 listCount에 넣어라 (어차피 하나의 값 밖에 없지만)
			}
		}catch(Exception ex){
			System.out.println(ex+"selectHeartCount메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	public ArrayList<Feed> selectHeartArticleList(int page,int limit, String cust_id){  //로그인 후 리스트에서 좋아요를 이미 선택한 건지 보여주기 위함
		PreparedStatement pstmt = null;  
		//PreparedStatement를 사용하면 sql문에서 변수값 대신 ? 를 사용할 수 있다 그리고 setString()이나 setInt로 비워둔 부분에 데이터를 넣어줌
		//물음표가 여러개면 여러개 쓰고 key값에 들어가는 숫자는 물음표의 순번
		ResultSet rs = null;
		String board_list_sql="select * from feed "
				+ " left outer join feed_like on feed.feed_id= feed_like.feed_id and feed_like.cust_id=?"
				+ " left outer join cust_follow on feed.cust_id = cust_follow.cust_following and cust_follow.cust_id=? "
				+ " left outer join cust_houseinfo on feed.cust_id = cust_houseinfo.cust_id order by feed_date desc limit ?,8";
				//전체 feed테이블과, 로그인한 아이디로 좋아요를 누른 feed_like 테이블의 정보를 합집합으로 가져옴
		ArrayList<Feed> articleList = new ArrayList<Feed>();
		Feed feed = null;
		int startrow=(page-1)*8; 
		//1페이지는 0~7번(8개), 2페이지는 8~15번(8개), 3페이지는 16~23번(8개)

		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setString(1, cust_id);
			pstmt.setString(2, cust_id);
			pstmt.setInt(3, startrow); 
			rs = pstmt.executeQuery();

			while(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				//feed.setFeed_pics(rs.getString("feed_pics"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				feed.setLike_time(rs.getString("like_time")); //좋아요 한 피드 알기 위해서
				feed.setFollow_time(rs.getString("follow_time")); // 팔로우 한 회원 알기 위해서
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
				feed.setFeed_read(rs.getInt("feed_read"));
				feed.setCust_pic(rs.getString("cust_pic"));
				String feed_pics = rs.getString("feed_pics");
				String [] filename = feed_pics.split(",");
				feed.setFeed_pics(filename[0]);
				//썸네일에서는 어차피 파일 하나만 보여지기 때문에 썸네일 파일을 만든 첫번째 파일로 만들면 된다
				articleList.add(feed);
			}

		}catch(Exception ex){
			System.out.println(ex+"selectHeartArticleList메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;
	}
	public int insertFollow(Cust_follow follow){   //팔로우 버튼 누르면 insert하는 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			sql="insert into cust_follow (cust_following,cust_id,follow_time) values(?,?,now())";
			System.out.println("insertHeart() 수행중");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, follow.getCust_following());
			pstmt.setString(2, follow.getCust_id());  

			insertCount=pstmt.executeUpdate(); //수행하면 insertCount=1

		}catch(Exception ex){
			System.out.println(ex+"=> insertFollow 에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	public Boolean selectFollow(Cust_follow follow){  // 팔로우 버튼 눌렀을 때 이미 눌렀는지 확인하는 메소드

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Boolean isSelectExist = false;

		try{
			pstmt = con.prepareStatement(
					"select * from cust_follow where cust_following = ? and cust_id = ?;");
			pstmt.setString(1, follow.getCust_following());
			pstmt.setString(2, follow.getCust_id());
			rs= pstmt.executeQuery();

			if(rs.next()){
				isSelectExist=true;
			}
		}catch(Exception ex){
			System.out.println(ex+"selectFollow메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return isSelectExist;
	}
	public int deleteFollow(Cust_follow follow){  // 팔로우 버튼 이미 눌렀다면 삭제하는 메소드

		PreparedStatement pstmt = null;
		String delete_sql="delete from cust_follow where cust_following=? and cust_id=?;";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(delete_sql);
			pstmt.setString(1, follow.getCust_following());
			pstmt.setString(2, follow.getCust_id());
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex+"deleteFollow메소드에서 오류");
		}	finally{
			close(pstmt);
		}

		return deleteCount;
	}
	public ArrayList<Feed> selectFollowLogin(int page, int limit,String cust_id){  // 로그인 한 개인의 팔로우 정보를 모두 불러오기

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Feed> articleList = new ArrayList<Feed>();
		Feed feed;
		int startrow=(page-1)*8; 
		try{
			pstmt = con.prepareStatement(" select * from feed "
					+ " join cust_follow on feed.cust_id= cust_follow.cust_following and cust_follow.cust_id=? "
					+ " left outer join feed_like on feed.feed_id= feed_like.feed_id and feed_like.cust_id=? "
					+ " left outer join cust_houseinfo on feed.cust_id = cust_houseinfo.cust_id "
					+ " order by feed_date desc limit ?, 8;");
			pstmt.setString(1, cust_id);
			pstmt.setString(2, cust_id);
			pstmt.setInt(3, startrow);
			rs= pstmt.executeQuery();

			while(rs.next()){
				feed = new Feed();
				feed.setFeed_id(rs.getInt("feed_id"));
				feed.setCust_id(rs.getString("cust_id"));
				feed.setCust_pic(rs.getString("cust_pic"));
				feed.setFeed_txt(rs.getString("feed_txt"));
				feed.setFeed_date(rs.getString("feed_date"));
				feed.setFeed_hashtag(rs.getString("feed_hashtag"));
				feed.setPro_id(rs.getInt("pro_id"));
				feed.setUsed_id(rs.getInt("used_id"));
				feed.setMarket_id(rs.getInt("market_id"));
				feed.setFeed_read(rs.getInt("feed_read"));
				String feed_pics = rs.getString("feed_pics");
				String [] filename = feed_pics.split(",");
				for(int i = 0; i<filename.length;i++) {
					if(i==0) {
						feed.setFeed_pics(filename[0]);
					}else if(i==1) {
						feed.setFeed_pic1(filename[1]);
					}else if(i==2) {
						feed.setFeed_pic2(filename[2]);
					}else if(i==3) {
						feed.setFeed_pic3(filename[3]);
					}
				}
				feed.setFollow_time(rs.getString("follow_time"));
				feed.setLike_time(rs.getString("like_time"));
				//썸네일에서는 어차피 파일 하나만 보여지기 때문에 썸네일 파일을 만든 첫번째 파일로 만들면 된다
				articleList.add(feed);
			}
		}catch(Exception ex){
			System.out.println(ex+"selectFollowLogin메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	public int selectFollowCount(String cust_id) { //팔로우 모아놓은 화면에서 페이징을 위해 갯수 가져오기
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from feed f,cust_follow c where f.cust_id = c.cust_following and c.cust_id= ? order by feed_date desc;");
			pstmt.setString(1, cust_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				listCount=rs.getInt(1); //첫번째 값을 listCount에 넣어라 (어차피 하나의 값 밖에 없지만)
			}
		}catch(Exception ex){
			System.out.println(ex+"selectFollowCount메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	public int insertHouseInfo(Cust_houseinfo house){   //sns글쓰기 완료 후 table에 저장되는 일
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			sql="insert into cust_houseinfo (cust_id,cust_pic,cust_introduce,cust_house,cust_room,cust_m2,cust_fam,"
					+ "cust_family, cust_direc,cust_houseold,cust_pet,cust_region)"
					+"values(?,?,?,?,?,?,?,?,?,?,?,?);";
			System.out.println("insertHouseInfo 잘 되어가나요?");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, house.getCust_id());
			pstmt.setString(2, house.getCust_pic());
			pstmt.setString(3, house.getCust_introduce());
			pstmt.setString(4, house.getCust_house());
			pstmt.setInt(5, house.getCust_room());
			pstmt.setInt(6, house.getCust_m2());
			pstmt.setInt(7, house.getCust_fam());
			pstmt.setString(8, house.getCust_family());
			pstmt.setString(9, house.getCust_direc());
			pstmt.setInt(10, house.getCust_houseold());
			pstmt.setString(11, house.getCust_pet());
			pstmt.setString(12, house.getCust_region());

			insertCount=pstmt.executeUpdate(); //수행하면 insertCount=1

		}catch(Exception ex){
			System.out.println(ex+"=> insertHouseInfo에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	public Cust_houseinfo selectCusthouseinfo(String cust_id) {   // 내가 입력한 집 정보 가져오기 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Cust_houseinfo po = null;
		
		try{
			pstmt = con.prepareStatement(
					"select * from cust_houseinfo "
					+ " left outer join cust_info on cust_houseinfo.cust_id = cust_info.cust_id "
					+ " where cust_houseinfo.cust_id=?;");
			pstmt.setString(1, cust_id);
			rs= pstmt.executeQuery();

			if(rs.next()){
				po = new Cust_houseinfo();
				po.setCust_house(rs.getString("cust_house"));
				po.setCust_room(rs.getInt("cust_room"));
				po.setCust_m2(rs.getInt("cust_m2"));
				po.setCust_fam(rs.getInt("cust_fam"));
				po.setCust_houseold(rs.getInt("cust_houseold"));
				po.setCust_family(rs.getString("cust_family"));
				po.setCust_direc(rs.getString("cust_direc"));
				po.setCust_region(rs.getString("cust_region"));
				po.setCust_pet(rs.getString("cust_pet"));
				po.setCust_sex(rs.getString("cust_sex"));
//				po.setCust_color(rs.getString("cust_color"));
				
				//String style =rs.getString("post_style");
				//String color =rs.getString("post_color");
				//String [] styles = style.split(",");
				//String [] colors = color.split(",");
				
			}
		}catch(Exception ex){
			System.out.println(ex+"selectCustinfo메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return po;
	}
	public Cust_info getcustinfo(String cust_id){  // api이용할 때 내 주소 가지고 오기 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Cust_info info = new Cust_info();
		System.out.println("getcustinfo data 도착");
		try{
			String sql="select * from cust_info where cust_id=? ;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cust_id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				info.setCust_sex(rs.getString("cust_sex"));
				String adr = rs.getString("cust_adr");
				String [] adrs = adr.split("\\s");
				String [] adrs1 = adr.split(" "); // 위, 아래 방법 모두 띄어쓰기를 바탕으로 주소를 자를 수 있음 
				info.setCust_adr(adrs[1]);			
				System.out.println(info.getCust_adr());
			}
		}catch(Exception ex){
			System.out.println(ex+" getcustinfo 메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return info;
	}
	
	public ArrayList<Post_house> gethouseinfo(Cust_houseinfo houseinfo) { //주거형태 집평수 방개수
		ArrayList<Post_house> alist = new ArrayList<Post_house>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = con.prepareStatement("select * from post_house left outer join post_bookmark on post_house.post_id = post_bookmark.post_id "
					+ " where post_house=? and post_rooms=? and post_m2=? "
					+ " and post_writetime BETWEEN DATE_ADD(NOW(), INTERVAL -1 MONTH ) AND NOW()"
					+ " order by post_house.post_read desc limit 0,3;");
			pstmt.setString(1, houseinfo.getCust_house());//주거형태
			pstmt.setInt(2, houseinfo.getCust_room());	  //방개수
			pstmt.setInt(3, houseinfo.getCust_m2());	  //집평수
			rs= pstmt.executeQuery();

			while(rs.next()){
//				System.out.println("주거형태, 방개수, 집평수 추출중");
				Post_house po = new Post_house();
				
				po.setPost_id(rs.getInt("post_id"));
				po.setCust_id(rs.getString("cust_id"));
				po.setPost_title(rs.getString("post_title"));
				po.setPost_txt(rs.getString("post_txt"));
				po.setPost_house(rs.getString("post_house"));
				
				po.setPost_rooms(rs.getInt("post_rooms"));
				po.setPost_m2(rs.getInt("post_m2"));
				po.setPost_fam(rs.getInt("post_fam"));
				po.setPost_houseold(rs.getInt("post_houseold"));
				po.setPost_budget(rs.getInt("post_budget"));
				
				po.setPost_family(rs.getString("post_family"));
				po.setPost_direc(rs.getString("post_direc"));
				po.setPost_region(rs.getString("post_region"));
				po.setPost_pet(rs.getString("post_pet"));
				po.setPost_startdate(rs.getString("post_startdate"));
				po.setPost_enddate(rs.getString("post_enddate"));
				po.setPost_color(rs.getString("post_color"));
				
				String feed_pics = rs.getString("post_pics");
				String [] filename = feed_pics.split(",");
				po.setPost_pics(filename[0]);
				po.setPost_pic2(filename[1]);
				po.setPost_pic3(filename[2]);
				po.setPost_pic4(filename[3]);
				po.setPost_writetime(rs.getString("post_writetime"));
				po.setBookmark_time(rs.getString("bookmark_time"));
				alist.add(po);
				
			}
		}catch(Exception ex){
			System.out.println(ex+" gethouseinfo메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return alist;
	}
	public ArrayList<Post_house> getfamilyinfo(Cust_houseinfo houseinfo) { //가족형태 가족수
		ArrayList<Post_house> alist = new ArrayList<Post_house>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		/가족인원수 가족형태 
		try{
			pstmt = con.prepareStatement("select * from post_house left outer join post_bookmark on post_house.post_id = post_bookmark.post_id  "
					+ " where post_family=? and post_fam=? "
					+ " and post_writetime BETWEEN DATE_ADD(NOW(), INTERVAL -1 MONTH ) AND NOW() "
					+ " order by post_house.post_read desc limit 0,3;");
			pstmt.setString(1, houseinfo.getCust_family());//주거형태
			pstmt.setInt(2, houseinfo.getCust_fam());	  //방개수
			rs= pstmt.executeQuery();

			while(rs.next()){
				Post_house po = new Post_house();
				
				po.setPost_id(rs.getInt("post_id"));
				po.setCust_id(rs.getString("cust_id"));
				po.setPost_title(rs.getString("post_title"));
				po.setPost_txt(rs.getString("post_txt"));
				po.setPost_house(rs.getString("post_house"));
				
				po.setPost_rooms(rs.getInt("post_rooms"));
				po.setPost_m2(rs.getInt("post_m2"));
				po.setPost_fam(rs.getInt("post_fam"));
				po.setPost_houseold(rs.getInt("post_houseold"));
				po.setPost_budget(rs.getInt("post_budget"));
				
				po.setPost_family(rs.getString("post_family"));
				po.setPost_direc(rs.getString("post_direc"));
				po.setPost_region(rs.getString("post_region"));
				po.setPost_pet(rs.getString("post_pet"));
				po.setPost_startdate(rs.getString("post_startdate"));
				po.setPost_enddate(rs.getString("post_enddate"));
				po.setPost_color(rs.getString("post_color"));
				
				String feed_pics = rs.getString("post_pics");
				String [] filename = feed_pics.split(",");
				po.setPost_pics(filename[0]);
				po.setPost_pic2(filename[1]);
				po.setPost_pic3(filename[2]);
				po.setPost_pic4(filename[3]);
				po.setPost_writetime(rs.getString("post_writetime"));
				po.setBookmark_time(rs.getString("bookmark_time"));
				alist.add(po);
				
			}
		}catch(Exception ex){
			System.out.println(ex+" getfamilyinfo메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return alist;
	}
	public ArrayList<Post_house> getcustfamilyinfo(String famliy, String sex) {//성별 가족형태
		ArrayList<Post_house> alist = new ArrayList<Post_house>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt = con.prepareStatement("select * from post_house "
					+ " left outer join post_bookmark on post_house.post_id = post_bookmark.post_id "
					+ " left outer join cust_info on post_house.cust_id = cust_info.cust_id "
					+ " where post_family=? and cust_sex=? "
					+ " and post_writetime BETWEEN DATE_ADD(NOW(), INTERVAL -1 MONTH ) AND NOW() "
					+ " order by post_house.post_read desc limit 0,3;");
			pstmt.setString(1, famliy);
			pstmt.setString(2, sex);	  //성별넣어야하는
			rs= pstmt.executeQuery();

			while(rs.next()){
				Post_house po = new Post_house();
				
				po.setPost_id(rs.getInt("post_id"));
				po.setCust_id(rs.getString("cust_id"));
				po.setPost_title(rs.getString("post_title"));
				po.setPost_txt(rs.getString("post_txt"));
				po.setPost_house(rs.getString("post_house"));
				
				po.setPost_rooms(rs.getInt("post_rooms"));
				po.setPost_m2(rs.getInt("post_m2"));
				po.setPost_fam(rs.getInt("post_fam"));
				po.setPost_houseold(rs.getInt("post_houseold"));
				po.setPost_budget(rs.getInt("post_budget"));
				
				po.setPost_family(rs.getString("post_family"));
				po.setPost_direc(rs.getString("post_direc"));
				po.setPost_region(rs.getString("post_region"));
				po.setPost_pet(rs.getString("post_pet"));
				po.setPost_startdate(rs.getString("post_startdate"));
				po.setPost_enddate(rs.getString("post_enddate"));
				po.setPost_color(rs.getString("post_color"));
				
				String feed_pics = rs.getString("post_pics");
				String [] filename = feed_pics.split(",");
				po.setPost_pics(filename[0]);
				po.setPost_pic2(filename[1]);
				po.setPost_pic3(filename[2]);
				po.setPost_pic4(filename[3]);
				po.setPost_writetime(rs.getString("post_writetime"));
				po.setBookmark_time(rs.getString("bookmark_time"));
				alist.add(po);
				
			}
		}catch(Exception ex){
			System.out.println(ex+" getfamilyinfo메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return alist;
	}
	public ArrayList<Feed_comment> getFeedComment(int feed_id, String cust_id) throws Exception{
		
		ArrayList<Feed_comment> commentlist = new ArrayList<Feed_comment>();
		Feed_comment comment = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		int feed_id = 0;
//		for (int i = 0 ; i<articleList.size(); i++) {
//			feed_id= articleList.get(i).getFeed_id();
//			System.out.println(i+feed_id+"  출력중");
		
		try{
			pstmt = con.prepareStatement("select feed_comment.feed_id, feed_comment.cmt_id, feed_comment.cust_id, feed_comment.root_cmt,"
					+ " feed_comment.parent_cmt, feed_comment.cmt_txt, cust_houseinfo.cust_pic,DATE_FORMAT(feed_comment.cmt_time,'%b.%e %H:%i') as cmt_time "
					+ " from feed_comment "
					+ " left outer join cust_houseinfo on feed_comment.cust_id = cust_houseinfo.cust_id "
					+ " where feed_id= ? order by cmt_time desc");
			pstmt.setInt(1, feed_id); 
			rs= pstmt.executeQuery();
			while(rs.next()){
//				System.out.println("댓글select하는중");
				comment = new Feed_comment();
				comment.setFeed_id(rs.getInt("feed_id"));
				comment.setCmt_id(rs.getInt("cmt_id"));
				comment.setCust_id(rs.getString("cust_id"));
				comment.setRoot_cmt(rs.getInt("root_cmt"));
				comment.setParent_cmt(rs.getInt("parent_cmt"));
				comment.setCmt_txt(rs.getString("cmt_txt"));
				comment.setCmt_time(rs.getString("cmt_time"));
				comment.setCust_pic(rs.getString("cust_pic"));
				commentlist.add(comment);
			}
		}catch(Exception ex){
			System.out.println(ex+"getFeedComment메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
//	}
		return commentlist;
	}
	public int insertcomment(Feed_comment comment){   //sns글쓰기 완료 후 table에 저장되는 일
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;
//		System.out.println("댓글insert하는중");
		try{
			sql="insert into feed_comment (cmt_id,feed_id,cust_id,root_cmt,parent_cmt,cmt_txt, cmt_time) values(default,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment.getFeed_id());
			pstmt.setString(2, comment.getCust_id());  //cust_id를 해야한다
			pstmt.setInt(3, comment.getRoot_cmt());
			pstmt.setInt(4, comment.getParent_cmt());
			pstmt.setString(5, comment.getCmt_txt());
			insertCount=pstmt.executeUpdate(); //수행하면 insertCount=1

		}catch(Exception ex){
			System.out.println(ex+"=> insertFeed에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;
	}
	public int deleteComment(int cmt_id){  // 본인이 작성한 게시글을 하나 삭제하기

		PreparedStatement pstmt = null;
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement("delete from feed_comment where cmt_id=?");
			pstmt.setInt(1, cmt_id);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex+"deleteComment메소드에서 오류");
		}	finally{
			close(pstmt);
		}

		return deleteCount;
	}
	public int updateComment(Feed_comment comment){   // 댓글 수정 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int updateCount=0;

		try{
			sql="update feed_comment set cmt_txt=?, cmt_time=now() "
					+ "where cmt_id=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, comment.getCmt_txt());
			pstmt.setInt(2, comment.getCmt_id());

			updateCount=pstmt.executeUpdate(); //수행하면 insertCount=1

		}catch(Exception ex){
			System.out.println(ex+"=> updateFeed에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}

		return updateCount;

	}
	public Post_house selectMainComty(){  // 메인이 되는 글 하나 가져오기 =>이번주 조회수 가장 높은 곳
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Post_house po = new Post_house();
		try{
			String sql="select * from post_house left outer join post_bookmark on post_house.post_id = post_bookmark.post_id "
					+ " where post_writetime BETWEEN DATE_ADD(NOW(), INTERVAL -1 WEEK ) AND NOW() "
					+ " order by post_read desc "
					+ " limit 0,1 "
					+ " ;";
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();

			if(rs.next()) {
				System.out.println("이번주 조회수 가장 높은 곳");
				po.setPost_id(rs.getInt("post_id"));
				po.setCust_id(rs.getString("cust_id"));
				po.setPost_title(rs.getString("post_title"));
				po.setPost_txt(rs.getString("post_txt"));
				po.setPost_txt2(rs.getString("post_txt2"));
				po.setPost_house(rs.getString("post_house"));
				
				po.setPost_rooms(rs.getInt("post_rooms"));
				po.setPost_m2(rs.getInt("post_m2"));
				po.setPost_fam(rs.getInt("post_fam"));
				po.setPost_houseold(rs.getInt("post_houseold"));
				po.setPost_budget(rs.getInt("post_budget"));
				
				po.setPost_family(rs.getString("post_family"));
				po.setPost_direc(rs.getString("post_direc"));
				po.setPost_region(rs.getString("post_region"));
				po.setPost_pet(rs.getString("post_pet"));
				po.setPost_startdate(rs.getString("post_startdate"));
				po.setPost_enddate(rs.getString("post_enddate"));
				po.setPost_color(rs.getString("post_color"));
				String feed_pics = rs.getString("post_pics");
				String [] filename = feed_pics.split(",");
				for(int i = 0; i<filename.length;i++) {
					if(i==0) {
						po.setPost_pics(filename[0]);
					}else if(i==1) {
						po.setPost_pic2(filename[1]);
					}else if(i==2) {
						po.setPost_pic3(filename[2]);
					}else if(i==3) {
						po.setPost_pic4(filename[3]);
					}
				}
				//아이템 등록 
				po.setPost_item(rs.getString("post_item1"));
				String post_item1 = rs.getString("post_item1");
				String [] postitem1 = post_item1.split(",");
				System.out.println("select_one 에서 postitem1.length => "+postitem1.length);
				for(int i = 0; i<postitem1.length;i++) {
					if(i==0) {
						po.setPost_item10(postitem1[0]);
					}else if(i==1) {
						po.setPost_item11(postitem1[1]);
					}else if(i==2) {
						po.setPost_item12(postitem1[2]);
					}else if(i==3) {
						po.setPost_item13(postitem1[3]);
					}else if(i==4) {
						po.setPost_item14(postitem1[4]);
					}else if(i==5) {
						po.setPost_item15(postitem1[5]);
					}else if(i==6) {
						po.setPost_item16(postitem1[6]);
					}else if(i==7) {
						po.setPost_item17(postitem1[7]);
					}else if(i==8) {
						po.setPost_item18(postitem1[8]);
					}else if(i==9) {
						po.setPost_item19(postitem1[9]);
					}
				}
				po.setPost_writetime(rs.getString("post_writetime"));
				po.setPost_read(rs.getInt("post_read"));
				po.setPost_position(rs.getString("post_position"));
				//System.out.println(rs.getString("post_position"));
				
//				String post_position = rs.getString("post_position");
//				String [] position1 = post_position.split(",");
//				po.setPost_position10(position1[0]);
//				po.setPost_position11(position1[1]);
//				System.out.println(post_position+"좌표 : "+position1[0]+"  ,  "+position1[1]);
			}
		}catch(Exception ex){
			System.out.println(ex+" selectMainComty 메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return po;
	}
	public Cust_info getmyregion(String cust_id){  // api이용할 때 내 주소 가지고 오기 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Cust_info info = new Cust_info();
		System.out.println("getmyregion data 도착");
		try{
			String sql="select * from cust_info where cust_id=? ;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cust_id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
//				info.setCust_adr(rs.getString("cust_adr"));
//				System.out.println(info.getCust_adr());
				String adr = rs.getString("cust_adr");
				String [] adrs = adr.split("\\s");
				String [] adrs1 = adr.split(" "); // 위, 아래 방법 모두 띄어쓰기를 바탕으로 주소를 자를 수 있음 
				info.setCust_adr(adrs[1]);			
				System.out.println(info.getCust_adr());
			}
		}catch(Exception ex){
			System.out.println(ex+" getmyregion 메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return info;
	}
	public ArrayList<Pro_post> getSearchResult(String searchword){  // api이용할 때 내 주소 가지고 오기 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Pro_post> productlist = new ArrayList<Pro_post>();
		System.out.println("getSearchResult data 도착");
		try{
//			String sql="select * from pro_post where pro_title= ? or pro_company = ? or pro_menu1 like '%?%' ;";
			String sql="select * from pro_post where pro_title like '%"+searchword+"%'  or pro_company like '%"+searchword+"%' or pro_menu1 like '%"+searchword+"%' ;";
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, searchword);
//			pstmt.setString(2, searchword);
//			pstmt.setString(3, searchword);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				Pro_post pro = new Pro_post();
				pro.setPro_id(rs.getInt("pro_id"));
				pro.setPro_title(rs.getString("pro_title"));
				pro.setPro_price(rs.getInt("pro_price"));
				pro.setPro_company(rs.getString("pro_company"));
				pro.setPro_picture(rs.getString("pro_picture"));
				productlist.add(pro);
			}
		}catch(Exception ex){
			System.out.println(ex+" getSearchResult 메소드에서 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return productlist;
	}


}
