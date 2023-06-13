package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Gosu_info;
import svc.BachiInfoService;

public class BachiInfoAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = null;
		Gosu_info bachi_info = null;
		ServletContext context = request.getServletContext();
		
		bachi_info = new Gosu_info();
		
		bachi_info.setCust_id(request.getParameter("cust_id"));
		bachi_info.setGosu_menu1(request.getParameter("gosu_menu1"));
		bachi_info.setGosu_menu2(request.getParameter("gosu_menu2"));
		bachi_info.setGosu_intro(request.getParameter("gosu_intro"));
		bachi_info.setGosu_car(request.getParameter("gosu_car"));
		bachi_info.setGosu_reg(request.getParameter("gosu_reg"));
		bachi_info.setGosu_comp(request.getParameter("gosu_comp"));
		bachi_info.setWorktime_s(request.getParameter("worktime_s"));
		bachi_info.setWorktime_e(request.getParameter("worktime_e"));
		
		BachiInfoService bachi_info_serv = new BachiInfoService();
		boolean isWriteSuccess = bachi_info_serv.infoinsert(bachi_info);
		
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail');");
			out.println("history.back();");
			out.println("</script>");
			
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("bachi_match-home.bc");
		
		}
		
		return forward;
	}
}
