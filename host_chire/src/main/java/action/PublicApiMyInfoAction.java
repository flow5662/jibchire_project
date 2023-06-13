package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.ActionForward;
import dto.Cust_info;
import dto.Feed;
import dto.PageInfo;
import svc.PublicApiMyInfoService;
import svc.SnsListService;

 public class PublicApiMyInfoAction implements Action {
	 
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		/*/sns/publicapiinfo.sns?cust_id=jessie*/
		ArrayList<Feed> articleList=new ArrayList<Feed>();
		Cust_info info = null;
		/*서비스 호출*/
		PublicApiMyInfoService srv = new PublicApiMyInfoService();

		/*로그인 되어있으면 지역 정보 가져오기, 로그인 안되어있으면 전체정보만 가져오기*/
		String cust_id = request.getParameter("cust_id");
		if(!(cust_id==null || cust_id.equals(null))){
			System.out.println(cust_id);
			info = srv.getmyregion(cust_id);
		}
		request.setAttribute("Cust_info", info);
		ActionForward forward= new ActionForward();
   		forward.setPath("view_Api.jsp"); //ActionForward.java 클래스에 setpath메소드에 setting.
   		return forward;
   		
	 }
	 
 }