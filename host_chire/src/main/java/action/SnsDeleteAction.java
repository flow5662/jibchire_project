package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import svc.SnsDeleteService;

public class SnsDeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = null;
		int feed_id=Integer.parseInt(request.getParameter("feed_id"));
		System.out.println("deleteaction 도착 feed_id는? ==> "+feed_id);

		SnsDeleteService snsDeleteService = new SnsDeleteService();
			
		boolean isDeleteSuccess = snsDeleteService.removeArticle(feed_id);

		if(!isDeleteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제가 이뤄지지 않았습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close(); // 닫아줘야 하는 걸 알게되었다.
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			//String nowPage = "1";  // 삭제 후에 무조건 1페이지로 넘어가기 위해서 
			forward = new ActionForward();
			forward.setRedirect(true);
			/* 여기에 알림창이 있으면 응답이 되었다고 생각하고 이 다음페이지로 진행되지 않는다*/
			PrintWriter out=response.getWriter();
			out.println("<script> alert('삭제가 완료되었습니다');  </script>");
			out.close(); // 닫아줘야 하는 걸 알게되었다
			forward.setPath("snsListAction.sns");
		}
			


		return forward;
	}

}