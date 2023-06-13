package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Bachi_match_Been;
import svc.Bachi_Match_Category_Service;

public class Bachi_match_categoryAction implements Action{ //gosu_menu1,gosu_menu2
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		
	ArrayList<Bachi_match_Been> match_cate = new ArrayList<Bachi_match_Been>();
	
	Bachi_Match_Category_Service match_category = new Bachi_Match_Category_Service();
	
	match_cate = match_category.select_match_cate();

	request.setAttribute("match_category", match_cate);

	ActionForward forward = new ActionForward();
	forward.setPath("bachi_match_gosumenu.jsp");
	return forward;
	}
}
