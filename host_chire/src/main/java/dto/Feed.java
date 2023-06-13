package dto;

public class Feed {
	public int feed_id;
	public String cust_id;
	public String feed_pics; //썸네일이 될 대표파일 및 다른 파일 포함
	public String feed_txt;
	public String feed_date; //글작성일
	public String feed_hashtag;
	public String feed_hashtag1;
	public String feed_hashtag2;
	public String feed_hashtag3;
	public int feed_read; //조회수
	public int pro_id;  //제품번호
	public int used_id; //중고거래 후기
	public int market_id; //고수 마켓 후기
	public String feed_pic1; //snsRead.jsp 에서필요한 객체
	public String feed_pic2; //snsRead.jsp 에서필요한 객체
	public String feed_pic3; //snsRead.jsp 에서필요한 객체
	public String like_time; //feed와 feed_like를 함께 가져올 때 null과 값을 구분하기 위한 필드가 like_time밖에 없음
	public String follow_time; //feed와 feed_like, cust_follow를 함께 가져올 때 null과 값을 구분하기 위한 필드가 follow_time밖에 없음
	public String writerpic;
	public String writerintroduce;
	public String cust_pic;
	
	public int getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(int feed_id) {
		this.feed_id = feed_id;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getFeed_pics() {
		return feed_pics;
	}
	public void setFeed_pics(String feed_pics) {
		this.feed_pics = feed_pics;
	}
	public String getFeed_txt() {
		return feed_txt;
	}
	public void setFeed_txt(String feed_txt) {
		this.feed_txt = feed_txt;
	}
	public String getFeed_date() {
		return feed_date;
	}
	public void setFeed_date(String feed_date) {
		this.feed_date = feed_date;
	}
	public String getFeed_hashtag() {
		return feed_hashtag;
	}
	public void setFeed_hashtag(String feed_hastag) {
		this.feed_hashtag = feed_hastag;
	}
	public int getFeed_read() {
		return feed_read;
	}
	public void setFeed_read(int feed_read) {
		this.feed_read = feed_read;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getUsed_id() {
		return used_id;
	}
	public void setUsed_id(int used_id) {
		this.used_id = used_id;
	}
	public int getMarket_id() {
		return market_id;
	}
	public void setMarket_id(int market_id) {
		this.market_id = market_id;
	}
	public String getFeed_pic1() {
		return feed_pic1;
	}
	public void setFeed_pic1(String feed_pic1) {
		this.feed_pic1 = feed_pic1;
	}
	public String getFeed_pic2() {
		return feed_pic2;
	}
	public void setFeed_pic2(String feed_pic2) {
		this.feed_pic2 = feed_pic2;
	}
	public String getFeed_pic3() {
		return feed_pic3;
	}
	public void setFeed_pic3(String feed_pic3) {
		this.feed_pic3 = feed_pic3;
	}
	public String getFeed_hashtag1() {
		return feed_hashtag1;
	}
	public void setFeed_hashtag1(String feed_hashtag1) {
		this.feed_hashtag1 = feed_hashtag1;
	}
	public String getFeed_hashtag2() {
		return feed_hashtag2;
	}
	public void setFeed_hashtag2(String feed_hashtag2) {
		this.feed_hashtag2 = feed_hashtag2;
	}
	public String getFeed_hashtag3() {
		return feed_hashtag3;
	}
	public void setFeed_hashtag3(String feed_hashtag3) {
		this.feed_hashtag3 = feed_hashtag3;
	}
	public String getLike_time() {
		return like_time;
	}
	public void setLike_time(String like_time) {
		this.like_time = like_time;
	}
	public String getFollow_time() {
		return follow_time;
	}
	public void setFollow_time(String follow_time) {
		this.follow_time = follow_time;
	}
	public String getWriterpic() {
		return writerpic;
	}
	public void setWriterpic(String writerpic) {
		this.writerpic = writerpic;
	}
	public String getWriterintroduce() {
		return writerintroduce;
	}
	public void setWriterintroduce(String writerintroduce) {
		this.writerintroduce = writerintroduce;
	}
	public String getCust_pic() {
		return cust_pic;
	}
	public void setCust_pic(String cust_pic) {
		this.cust_pic = cust_pic;
	}
	
	
}
