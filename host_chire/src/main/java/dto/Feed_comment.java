package dto;

public class Feed_comment {
	public int cmt_id;
	public int feed_id;
	public String cust_id;
	public int root_cmt;
	public int parent_cmt;
	public String cmt_txt;
	public String cmt_time;
	public String cust_pic;
	public int getCmt_id() {
		return cmt_id;
	}
	public void setCmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
	}
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
	public int getRoot_cmt() {
		return root_cmt;
	}
	public void setRoot_cmt(int root_cmt) {
		this.root_cmt = root_cmt;
	}
	public int getParent_cmt() {
		return parent_cmt;
	}
	public void setParent_cmt(int parent_cmt) {
		this.parent_cmt = parent_cmt;
	}
	public String getCmt_txt() {
		return cmt_txt;
	}
	public void setCmt_txt(String cmt_txt) {
		this.cmt_txt = cmt_txt;
	}
	public String getCmt_time() {
		return cmt_time;
	}
	public void setCmt_time(String cmt_time) {
		this.cmt_time = cmt_time;
	}
	public String getCust_pic() {
		return cust_pic;
	}
	public void setCust_pic(String cust_pic) {
		this.cust_pic = cust_pic;
	}
	
}
