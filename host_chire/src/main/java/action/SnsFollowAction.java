package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Cust_follow;
import svc.SnsFollowService;

public class SnsFollowAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
	 	System.out.println("follow action 도착");
		 	ActionForward forward = new ActionForward();
			String cust_following = request.getParameter("cust_following");
			String cust_id = request.getParameter("cust_id");
		System.out.println("팔로우 누른사람 ==>> "+cust_id+" 팔로우 할 사람 ==> "+cust_following);	
		 	
			Cust_follow follow = new Cust_follow();
		 	//ajax에서 url로 넘겨준 값 세팅하기

		
			follow.setCust_following(cust_following);
			follow.setCust_id(cust_id);
						
			SnsFollowService snsfollowservice = new SnsFollowService();
			boolean isLikeSuccess = snsfollowservice.registArticle(follow);
			
		   	//request.setAttribute("Feed", feed);
	   		//forward.setPath("snsListAction.sns.jsp");
			forward.setPath("empty.jsp");
	   		return forward;
	   		
	 }
	 
}