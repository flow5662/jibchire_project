package dto;

public class Cust_houseinfo {
	/*추천을 위해 받는 정보. 나에게 맞는 추천 확인해보시겠습니까? ==> 있을 수도 없을 수도... 
	 * 회원가입을 아예 3가지 항목으로 나눠서 진행해보는건 ? 1. 약관, 2. 회원가입, 3. 추천을 위한 정보입력(이건 차후에 입력해도 되고?)
	 * */

	public String cust_id;
	public String cust_pic;
	public String cust_introduce;
	public String cust_house;
	public int cust_room;
	public int cust_m2;
	public int cust_fam;
	public String cust_family;
	public String cust_direc;
	public int cust_houseold;
	public String cust_pet;
	public String cust_region;
	public String cust_style;
	public String cust_color;
	
	public String cust_sex;
	
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_house() {
		return cust_house;
	}
	public void setCust_house(String cust_house) {
		this.cust_house = cust_house;
	}
	public int getCust_room() {
		return cust_room;
	}
	public void setCust_room(int cust_room) {
		this.cust_room = cust_room;
	}
	public int getCust_m2() {
		return cust_m2;
	}
	public void setCust_m2(int cust_m2) {
		this.cust_m2 = cust_m2;
	}
	public int getCust_fam() {
		return cust_fam;
	}
	public void setCust_fam(int cust_fam) {
		this.cust_fam = cust_fam;
	}
	public String getCust_family() {
		return cust_family;
	}
	public void setCust_family(String cust_family) {
		this.cust_family = cust_family;
	}
	public String getCust_direc() {
		return cust_direc;
	}
	public void setCust_direc(String cust_direc) {
		this.cust_direc = cust_direc;
	}
	public int getCust_houseold() {
		return cust_houseold;
	}
	public void setCust_houseold(int cust_houseold) {
		this.cust_houseold = cust_houseold;
	}
	public String getCust_pet() {
		return cust_pet;
	}
	public void setCust_pet(String cust_pet) {
		this.cust_pet = cust_pet;
	}
	public String getCust_region() {
		return cust_region;
	}
	public void setCust_region(String cust_region) {
		this.cust_region = cust_region;
	}
	public String getCust_style() {
		return cust_style;
	}
	public void setCust_style(String cust_style) {
		this.cust_style = cust_style;
	}
	public String getCust_color() {
		return cust_color;
	}
	public void setCust_color(String cust_color) {
		this.cust_color = cust_color;
	}
	public String getCust_pic() {
		return cust_pic;
	}
	public void setCust_pic(String cust_pic) {
		this.cust_pic = cust_pic;
	}
	public String getCust_introduce() {
		return cust_introduce;
	}
	public void setCust_introduce(String cust_introduce) {
		this.cust_introduce = cust_introduce;
	}
	public String getCust_sex() {
		return cust_sex;
	}
	public void setCust_sex(String cust_sex) {
		this.cust_sex = cust_sex;
	}
	
	
}
