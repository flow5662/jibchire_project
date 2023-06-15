package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;

public class BachiMatchCateAction implements Action { //매칭화면
	
 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
	 
	 ActionForward forward = new ActionForward();
	 String category = request.getParameter("category");

	 forward.setPath("/bachi/bachi_match_cate.jsp?category="+ category);
	 
	 return forward;
 }
}
