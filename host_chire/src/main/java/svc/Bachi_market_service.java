package svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Bachi_market;
import dto.Bachi_match_AnsBeen;
import dto.Bachi_match_Been;
import dto.Bachi_product;

@Service
public class Bachi_market_service {

	@Autowired
	public Bachi_market dao_market;
	
	
	public List<Bachi_match_Been> select_bachi_match(String cust_id,int page,int limit) throws Exception{
		List<Bachi_match_Been> list = dao_market.select_bachi_match(cust_id,page,limit);
		return list;
	}
	
	public int select_reqest_count(String cust_id) throws Exception{
		int listcount = 0;
		listcount = dao_market.count_bachi_request(cust_id);
		return listcount;
	}
	
	public List<Bachi_match_Been> select_one_bachi_req(int est_id)throws Exception{
		List<Bachi_match_Been> list_req = dao_market.select_bachi_match_req(est_id);
		return list_req;
	}
	
	public List<Bachi_match_AnsBeen> select_est_ans(int est_id)throws Exception{
		List<Bachi_match_AnsBeen> list_ans = dao_market.select_est_ans(est_id);
		return list_ans; 
	}
	
	public List<Bachi_product> select_market_product(int gosu_id,int market_id)throws Exception{
		List<Bachi_product> list_product = dao_market.select_market_product(gosu_id,market_id);
		return list_product;
	}
	
}
