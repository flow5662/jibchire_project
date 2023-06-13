package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Bachi_match_AnsBeen;
import svc.Bachi_Match_Ans;

public class BachiMatchAnsAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
	ActionForward forward = null;
	Bachi_match_AnsBeen bachi_match_been_a = null;
	ServletContext context = request.getServletContext();
	
	bachi_match_been_a = new Bachi_match_AnsBeen();
	bachi_match_been_a.setEst_id(Integer.parseInt(request.getParameter("est_id")));
	bachi_match_been_a.setCust_id(request.getParameter("cust_id")); //아이디 가져오기
	//request.getParameter로 값을 form태그에서 값을 받아오기

	
	bachi_match_been_a.setEst_a1(request.getParameter("est_a1"));
	bachi_match_been_a.setEst_a2(request.getParameter("est_a2"));
	bachi_match_been_a.setEst_a3(request.getParameter("est_a3"));
	
	Bachi_Match_Ans ansService = new Bachi_Match_Ans();
	boolean isWriteSuccess = ansService.Answer(bachi_match_been_a); 
	System.out.println(isWriteSuccess);
	if (!isWriteSuccess) {
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.println("<script>");
	    out.println("alert('fail')");
	    out.println("history.back();");
	    out.println("</script>");
	} else {
	    response.sendRedirect("bachi_match_req.bc"); //redirect해야함!!redirect 안하면 경로가 bc?id~~ 경로로 새로고침하면 값이 계속 insert되는 현상 발생함
	}
	return null;
	}
}
