package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import svc.SnsDeleteCommentService;
import svc.SnsDeleteService;

public class SnsDeleteCommentAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		int cmt_id = Integer.parseInt(request.getParameter("cmt_id"));
		int feed_id = Integer.parseInt(request.getParameter("feed_id")); //고유번호 feed_id 가져오기
		String cust_id= request.getParameter("cust_id");

		SnsDeleteCommentService srv = new SnsDeleteCommentService();
		boolean isDeleteSuccess = srv.removeArticle(cmt_id);
		System.out.println("deletecmt action 도착");
		
		if (!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제가 이뤄지지 않았습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close(); // 닫아줘야 하는 걸 알게되었다.
		} else {
			response.setContentType("text/html;charset=UTF-8");
			// String nowPage = "1"; // 삭제 후에 무조건 1페이지로 넘어가기 위해서
			forward = new ActionForward();
			forward.setRedirect(true);
			/* 여기에 알림창이 있으면 응답이 되었다고 생각하고 이 다음페이지로 진행되지 않는다 */
//			PrintWriter out=response.getWriter();
//			out.println("<script>");
//			out.println("alert('삭제가 완료되었습니다');");
//			out.println("</script>");
//			out.close(); // 닫아줘야 하는 걸 알게되었다.
//			forward.setPath("snsSelectComment.sns?feed_id="+feed_id+"&cust_id="+cust_id); 
			// 계속 데이터 작업을 할 필요는 없으니까 잠시 주석처리
			forward.setPath("empty.jsp");
		}

		return forward;
	}

}