package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Feed;
import svc.SnsReadService;
import svc.SnsUpdateDataService;

 public class SnsUpdateDataAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int feed_id=Integer.parseInt(request.getParameter("feed_id")); //고유번호 feed_id 가져오기
		Feed feed = null;
		
		SnsUpdateDataService srv = new SnsUpdateDataService();
		/*로그인 되어있으면 좋아요&팔로잉 정보까지 가져오기, 로그인 안되어있으면 전체정보만 가져오기*/
		String cust_id= request.getParameter("cust_id");
			feed = srv.getArticle(feed_id);    // articleList = feed테이블에 저장되어 있는 모든 값
			feed = srv.getHeartArticle(feed_id,cust_id);//로그인되어있으면 좋아요정보까지 가져오는 메소드 연결
			

		ActionForward forward = new ActionForward();
	   	request.setAttribute("Feed", feed);
   		forward.setPath("snsUpdate.jsp");
   		return forward;

	 }
	 
}