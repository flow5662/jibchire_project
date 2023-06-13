package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Feed;
import dto.Feed_like;
import dto.PageInfo;
import svc.SnsHeartLoginService;
import svc.SnsHeartService;
import svc.SnsReadService;

public class SnsHeartLoginAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			/*페이지 기본 값 세팅하기*/
		  	int page=1;
			int limit=8;		
			if(request.getParameter("page")!=null){ 
				page=Integer.parseInt(request.getParameter("page"));
				System.out.println(page);
				//page가 1일경우의 설정이지만, page가 2,3 등등으로 넘어갈때는 page의 값을 앞장에서 넘겨받은 "page"의 값으로 설정한다
				//snsList.jsp에서 2페이지, 3페이지를 각각 클릭할때 a href = ~~.bo?page= ~~ 이런식으로 넘겨줄 것
			}
		 	
		 	//url로 넘겨준 값 세팅하기
			String cust_id = request.getParameter("cust_id");
			System.out.println("좋아요 전달받은 아이디는 => "+cust_id);
			SnsHeartLoginService snsheartloginservice = new SnsHeartLoginService();
			int listCount = snsheartloginservice.getListCount(cust_id);				 // listCount = feed_like 테이블에서 로그인 한 아이디가 좋아요를 누른 레코드 수
			ArrayList<Feed> articleList = snsheartloginservice.registArticle(page, limit, cust_id);
			
			System.out.println("좋아요 페이지는 => "+listCount);
			
			/* 페이징을 하는 거의 공식과 같은 문장들 */
	   		int maxPage=(int)((double)listCount/limit+0.95); // 15/10+0.95=2.45, maxPage=2
	   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
	   	    int endPage = startPage+10-1;
	   	    
	   	    /*페이징*/
	   		if (endPage> maxPage) endPage= maxPage;
	   		
	   		PageInfo pageInfo = new PageInfo();
	   		pageInfo.setEndPage(endPage);
	   		pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			
			/*snsList.jsp 에서 이 값들을 사용하기 위해서 setAttribute로 객체를 세팅*/
			request.setAttribute("pageInfo", pageInfo); 
			request.setAttribute("articleList", articleList); 

	   		forward.setPath("snsHeartLogin.jsp"); //좋아요 페이지로 나중에 수정하기
	   		return forward;
	   		
	 }
	 
}