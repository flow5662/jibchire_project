package dto;

public class Bachi_match_Been {
	private int est_id;
	private String cust_id;
	private String gosu_menu1;
	private String gosu_menu2;
	private String est_q1;
	private String est_q2;
	private String est_q3;
	private String est_q_date;
	private String cust_pic;
	private String cust_adr;
	private String ans_cust_id;
	
	
	public String getAns_cust_id() {
		return ans_cust_id;
	}
	public void setAns_cust_id(String ans_cust_id) {
		this.ans_cust_id = ans_cust_id;
	}
	public String getCust_adr() {
		return cust_adr;
	}
	public void setCust_adr(String cust_adr) {
		this.cust_adr = cust_adr;
	}
	private int ans_est_id; //답변된 est_id가 있을 경우 추려내기 위함
	
	public int getAns_est_id() {
		return ans_est_id;
	}
	public void setAns_est_id(int ans_est_id) {
		this.ans_est_id = ans_est_id;
	}
	public String getCust_pic() {
		return cust_pic;
	}
	public void setCust_pic(String cust_pic) {
		this.cust_pic = cust_pic;
	}
	public int getEst_id() {
		return est_id;
	}
	public void setEst_id(int est_id) {
		this.est_id = est_id;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getGosu_menu1() {
		return gosu_menu1;
	}
	public void setGosu_menu1(String gosu_menu1) {
		this.gosu_menu1 = gosu_menu1;
	}
	public String getGosu_menu2() {
		return gosu_menu2;
	}
	public void setGosu_menu2(String gosu_menu2) {
		this.gosu_menu2 = gosu_menu2;
	}
	public String getEst_q1() {
		return est_q1;
	}
	public void setEst_q1(String est_q1) {
		this.est_q1 = est_q1;
	}
	public String getEst_q2() {
		return est_q2;
	}
	public void setEst_q2(String est_q2) {
		this.est_q2 = est_q2;
	}
	public String getEst_q3() {
		return est_q3;
	}
	public void setEst_q3(String est_q3) {
		this.est_q3 = est_q3;
	}
	public String getEst_q_date() {
		return est_q_date;
	}
	public void setEst_q_date(String est_q_date) {
		this.est_q_date = est_q_date;
	}

	
}
