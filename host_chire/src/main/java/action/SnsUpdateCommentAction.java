package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Feed_comment;
import svc.SnsUpdateCommentService;

 public class SnsUpdateCommentAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		Feed_comment comment = new Feed_comment();
		int cmt_id = Integer.parseInt(request.getParameter("cmt_id"));
		int feed_id = Integer.parseInt(request.getParameter("feed_id")); //고유번호 feed_id 가져오기
		String cust_id= request.getParameter("cust_id");
		String cmt_txt = request.getParameter("cmt_txt");
		System.out.println("cmt_id  : "+cmt_id);
		System.out.println("feed_id  : "+feed_id);
		System.out.println("cust_id  : "+cust_id);
		System.out.println("cmt_txt  : "+cmt_txt);
		
		comment.setCmt_id(cmt_id);
		comment.setFeed_id(feed_id);
		comment.setCust_id(cust_id);
		comment.setCmt_txt(cmt_txt);

		System.out.println("snsUpdateCommentAction도착");
		SnsUpdateCommentService srv = new SnsUpdateCommentService();
		boolean isUpdateSuccess = srv.updateComment(comment);
		
		ActionForward forward = new ActionForward();
		
		if(!isUpdateSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정하기에 실패했습니다')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("snsSelectComment.sns?feed_id="+feed_id+"&cust_id="+cust_id);
			// 계속 데이터 작업을 할 필요는 없으니까 잠시 주석처리
			forward.setPath("empty.jsp");
		}
   		return forward;

	 }
	 
}