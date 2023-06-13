package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Feed;
import dto.Feed_like;
import svc.SnsHeartService;
import svc.SnsReadService;

public class SnsHeartAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
		 	Feed_like heart = new Feed_like();
		 	
		 	//ajax에서 url로 넘겨준 값 세팅하기
			int feed_id=Integer.parseInt(request.getParameter("feed_id"));
			String cust_id = request.getParameter("cust_id");
			heart.setFeed_id(feed_id);
			heart.setCust_id(cust_id);
			
			SnsHeartService snsheartservice = new SnsHeartService();
			boolean isLikeSuccess = snsheartservice.registArticle(heart);
			
		   	//request.setAttribute("Feed", feed);
//	   		forward.setPath("snsListAction.sns.jsp");
			forward.setPath("empty.jsp");
	   		return forward;
	   		
	 }
	 
}