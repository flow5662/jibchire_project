package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Feed;
import dto.Feed_comment;
import svc.SnsReadCommentService;
import svc.SnsReadService;

 public class SnsReadCommentAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int feed_id = Integer.parseInt(request.getParameter("feed_id")); //고유번호 feed_id 가져오기
		String cust_id= request.getParameter("cust_id");
		ArrayList<Feed_comment> commentlist = null;

		SnsReadCommentService srv = new SnsReadCommentService();
		commentlist = srv.getFeedComment(feed_id,cust_id);
		
		request.setAttribute("commentlist",commentlist);
		request.setAttribute("cust_id", cust_id);

		ActionForward forward = new ActionForward();
   		forward.setPath("snsReadComment.jsp");
   		return forward;

	 }
	 
}