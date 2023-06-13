package action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.el.fmt.RequestEncodingTag;

import dto.ActionForward;
import dto.Bachi_info;

public class BachiInsertAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		ActionForward forward = null;
		Bachi_info bachi_info = null;
		ServletContext context = request.getServletContext();
		
		bachi_info = new Bachi_info();
		
		bachi_info.setCust_id(request.getParameter("id"));
		bachi_info.setGosu_car(request.getParameter("gosu_car"));
		bachi_info.setGosu_comp(request.getParameter("gosu_comp"));
		bachi_info.setGosu_intro(request.getParameter("gosu_intro"));
		bachi_info.setGosu_menu1(request.getParameter("gosu_menu1"));
		bachi_info.setGosu_menu2(request.getParameter("gosu_menu2"));	
		bachi_info.setGosu_reg(request.getParameter("gosu_reg"));
		bachi_info.setWorktime_e(request.getParameter("worktime_e"));
		bachi_info.setWorktime_s(request.getParameter("worktime_s"));
		
		
		
		return forward;
	}
}
