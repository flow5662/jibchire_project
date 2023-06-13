package dto;

public class Gosu_info { //고수 정보, 회원으로 로그인 되어있는 상태(세션에 저장)되어있으면
	//default로 cust_id가 들어가며 고수가 작성한 정보를 저장하는 객체
	String cust_id;
	String gosu_menu1;
	String gosu_menu2;
	String gosu_intro;
	String gosu_car;
	String gosu_reg;
	String gosu_comp;
	String worktime_s;
	String worktime_e;
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
	public String getGosu_intro() {
		return gosu_intro;
	}
	public void setGosu_intro(String gosu_intro) {
		this.gosu_intro = gosu_intro;
	}
	public String getGosu_car() {
		return gosu_car;
	}
	public void setGosu_car(String gosu_car) {
		this.gosu_car = gosu_car;
	}
	public String getGosu_reg() {
		return gosu_reg;
	}
	public void setGosu_reg(String gosu_reg) {
		this.gosu_reg = gosu_reg;
	}
	public String getGosu_comp() {
		return gosu_comp;
	}
	public void setGosu_comp(String gosu_comp) {
		this.gosu_comp = gosu_comp;
	}
	public String getWorktime_s() {
		return worktime_s;
	}
	public void setWorktime_s(String worktime_s) {
		this.worktime_s = worktime_s;
	}
	public String getWorktime_e() {
		return worktime_e;
	}
	public void setWorktime_e(String worktime_e) {
		this.worktime_e = worktime_e;
	}

}
