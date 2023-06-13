package dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Bachi_match_AnsBeen;
import dto.Bachi_match_Been;
import dto.Bachi_product;

@Repository
public class Bachi_market {

@Autowired
DataSource conn;
@Autowired
SqlSession sql;

public List<Bachi_match_Been> select_bachi_match(String cust_id,int page,int limit) throws Exception{
	 int startrow=(page-1)*10;
	 Map<String,Object> map = new HashMap<>();
	 map.put("cust_id", cust_id);
	 map.put("startrow", startrow);
	List<Bachi_match_Been> list = sql.selectList("bachi_req",map);
	return list;
}

public int count_bachi_request(String cust_id) throws Exception{
	int listcount = 0 ;
	listcount = sql.selectOne("bachi_req_count",cust_id);
	return listcount;
}

public List<Bachi_match_Been> select_bachi_match_req(int est_id)throws Exception{
	List<Bachi_match_Been> list_req = sql.selectList("bachi_req_det",est_id);
	return list_req;
}

public List<Bachi_match_AnsBeen> select_est_ans(int est_id)throws Exception{
	List<Bachi_match_AnsBeen> list_ans = sql.selectList("bachi_ans_det",est_id);
	return list_ans;
}

public List<Bachi_product> select_market_product(int gosu_id,int market_id)throws Exception{
	 Map<Object,Object> map = new HashMap<>();
	 map.put("gosu_id", gosu_id);
	 map.put("market_id", market_id);
	List<Bachi_product> market_product = sql.selectList("bachi_market_product",map);
	return market_product;
}

}
