package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Feed;
import dto.Feed_comment;
import svc.SnsReadService;

 public class SnsReadAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int feed_id=Integer.parseInt(request.getParameter("feed_id")); //고유번호 feed_id 가져오기
		Feed feed = null;
		ArrayList<Feed> articleList = null;

		
		SnsReadService snsReadService = new SnsReadService();
		/*로그인 되어있으면 좋아요&팔로잉 정보까지 가져오기, 로그인 안되어있으면 전체정보만 가져오기*/
		String feed_writer = request.getParameter("feed_writer");
		String cust_id= request.getParameter("cust_id");
		if(cust_id==null||cust_id.equals(null)||cust_id.equals("null")){
			System.out.println(" readaction도착 로그인 비완료 ==>> 그냥 출력 서비스 메소드로 ");
			articleList = snsReadService.getArticle(feed_id,feed_writer);    // articleList = feed테이블에 저장되어 있는 모든 값
		}else {
			System.out.println(" readaction도착 로그인 완료 ==>> "+cust_id+"  좋아요,팔로우 로그인 서비스 출력 메소드로");
			articleList = snsReadService.getHeartArticle(feed_id,cust_id,feed_writer);//로그인되어있으면 좋아요정보까지 가져오는 메소드 연결
			
		}
		
//		ArrayList<Feed_comment> commentlist = null;
//		commentlist = snsReadService.getFeedComment(articleList);
//		request.setAttribute("commentlist", commentlist);

		ActionForward forward = new ActionForward();
	   	request.setAttribute("articleList", articleList);
	   	request.setAttribute("feed_id", feed_id);
   		forward.setPath("snsRead.jsp");
   		return forward;

	 }
	 
}