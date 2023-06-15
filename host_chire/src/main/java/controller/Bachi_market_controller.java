package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import dto.Bachi_match_AnsBeen;
import dto.Bachi_match_Been;
import dto.Bachi_product;
import dto.Cust_info;
import dto.PageInfo;
import svc.Bachi_market_service;

@Controller
public class Bachi_market_controller {

	@Autowired
	Bachi_market_service bachi_mark;
	
	@RequestMapping("/") //기본 로그인 화면
	public String login() {
		String login = "/bachi/test.jsp";
		return login;
	}
	
	@RequestMapping("/bachi/bachi_match_anser")
	public String bachi_match_ans(Model mod,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(); //세션가져옴
		String cust_id = (String) session.getAttribute("ID"); //세션에 저장된 아이디 값을 불러옴
		
		int page=1;
		int limit=10;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		System.out.println(cust_id); //세션 저장됨 확인
		
		int listcount = bachi_mark.select_reqest_count(cust_id); //현재 로그인 한 아이디의 질문의 갯수
		System.out.println(listcount); // 현재 갯수 확인
		
		/*페이징 공식*/
		int maxPage=(int)((double)listcount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;
   	    
   	    if (endPage> maxPage) endPage= maxPage;
		
   	 	PageInfo pageInfo = new PageInfo();
	   	pageInfo.setEndPage(endPage);
	   	pageInfo.setListCount(listcount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		
		List<Bachi_match_Been> list = bachi_mark.select_bachi_match(cust_id,page,limit);
		//로그인 한 아이디(바치)가 한 질문영역들이 보일 수 있도록
		
		mod.addAttribute("bachi_reqest", list);
		String bachi_match_ans = "bachi_match_req_ans_info.jsp";
		return bachi_match_ans;
	}
	
	
	@RequestMapping("/bachi/bachi_match_anser_det")
	public String bachi_match_ans_det(Model mod,HttpServletRequest request,@RequestParam int est_id)throws Exception {
		List<Bachi_match_Been> list_req = bachi_mark.select_one_bachi_req(est_id);//질문
		List<Bachi_match_AnsBeen> list_ans = bachi_mark.select_est_ans(est_id);//답변
		mod.addAttribute("bachi_req_det", list_req); //jstl로 값을 출력하기 위함
		mod.addAttribute("bachi_req_ans", list_ans);
		String bachi_match_req_ans = "bachi_match_req_ans_det.jsp";
		return bachi_match_req_ans;
		
	}
	
	@RequestMapping("/bachi/bachi_market_order")
	public String bachi_market_product(Model mod,HttpServletRequest requeset,@RequestParam int gosu_id,@RequestParam int market_id)throws Exception{
		List<Bachi_product> market_product_list = bachi_mark.select_market_product(gosu_id,market_id);
		mod.addAttribute("bachi_market_pro",market_product_list);
		String bachi_market_product = "bachi_market_payment.jsp";
		return bachi_market_product;	
	}
	
}
