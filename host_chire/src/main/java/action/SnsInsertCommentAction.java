package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Feed_comment;
import svc.SnsInsertCommentService;


public class SnsInsertCommentAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward=null;
		Feed_comment comment = new Feed_comment();
		/*다시 값을 가지고 돌아가야 하기 때문에 변수에 넣어줬음*/
		int feed_id = Integer.parseInt(request.getParameter("feed_id"));
		String cust_id = request.getParameter("cust_id");
		String cmt_txt = request.getParameter("cmt_txt");
		String feed_writer = request.getParameter("feed_writer");
		comment.setCust_id(cust_id);
		comment.setFeed_id(feed_id);
		comment.setCmt_txt(cmt_txt);
		
		/*service 부르기*/
		SnsInsertCommentService srv = new SnsInsertCommentService();
		boolean isWriteSuccess = srv.registArticle(comment);
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 올리기에 실패했습니다')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("snsSelectComment.sns?feed_id="+feed_id+"&cust_id="+cust_id);
//			forward.setPath("snsReadAction.sns?feed_id="+feed_id+"&cust_id="+cust_id+"&feed_writer="+feed_writer);
			// 계속 데이터 작업을 할 필요는 없으니까 잠시 주석처리
//			forward.setPath("snsReadComment.jsp");
		}

		return forward; //actionfoward의 객체를 리턴.

	}  	

}