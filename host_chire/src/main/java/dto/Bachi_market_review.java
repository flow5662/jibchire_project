package dto;

public class Bachi_market_review {

	int review_id;
	int market_id;
	String cust_id;
	String review;
	int review_star;
	String review_pic;
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getMarket_id() {
		return market_id;
	}
	public void setMarket_id(int market_id) {
		this.market_id = market_id;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public String getReview_pic() {
		return review_pic;
	}
	public void setReview_pic(String review_pic) {
		this.review_pic = review_pic;
	}

	
	
}
