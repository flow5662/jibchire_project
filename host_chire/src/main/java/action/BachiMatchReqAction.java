package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Bachi_match;
import dto.ActionForward;
import dto.Bachi_match_Been;
import svc.Bachi_Match_Req_Service;
import dto.PageInfo;

public class BachiMatchReqAction implements Action{

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ArrayList<Bachi_match_Been> match_been= new ArrayList<Bachi_match_Been>(); //ArrayList 객체 생성
		HttpSession session = request.getSession();
		
		int page=1;
		int limit=10;
	
		
		String cust_id = (String) session.getAttribute("ID"); //가져올때 로그인 된 아이디만 답변완료 - 기능이 뜨도록
		System.out.println(cust_id);
		
		String gosu_menu1 = request.getParameter("gosu_menu1"); //select태그
		String gosu_menu2 = request.getParameter("gosu_menu2");
		
		
		System.out.println(gosu_menu1);
		System.out.println(gosu_menu2);
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		Bachi_Match_Req_Service match_req = new Bachi_Match_Req_Service();
		
		int listCount = match_req.getListCount(gosu_menu1,gosu_menu2);
		match_been = match_req.select_matchReq(page,limit,gosu_menu1,gosu_menu2,cust_id); //ArrayList 객체 호출, 서비스 클래스의 메소드의 return값 담기
		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;
   	    
   	    if (endPage> maxPage) endPage= maxPage;
   	    
   	    
	   	PageInfo pageInfo = new PageInfo();
	   	pageInfo.setEndPage(endPage);
	   	pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		
		
		request.setAttribute("match_been", match_been);//key value 설정
		ActionForward forward= new ActionForward(); //이동 클래스
   		forward.setPath("bachi_match_req.jsp");
   		return forward; //bachi_match_req.jsp 이동
	}
	
}
