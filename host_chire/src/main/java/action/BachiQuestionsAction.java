package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ActionForward;
import dto.Bachi_match_Been;
import svc.Bachi_Match_Service;

public class BachiQuestionsAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward=null;
		Bachi_match_Been bachi_matchi_been = null;
		ServletContext context = request.getServletContext();
		
		
		bachi_matchi_been = new Bachi_match_Been();
		bachi_matchi_been.setCust_id(request.getParameter("cust_id"));

		
		String[] servs = request.getParameterValues("serv"); // 선택된 모든 유형 값을 배열로 받아옴
		String ServStr = String.join(",", servs); // 배열 값을 쉼표로 구분하여 하나의 문자열로 합침
		bachi_matchi_been.setEst_q1(ServStr); // 객체에 저장
		
		
		String[] places = request.getParameterValues("place"); //라디오버튼이지만, 기타 항목 입력 위헤
		String placeStr = String.join(",", places);
		bachi_matchi_been.setEst_q2(placeStr);
		
		//bachi_matchi_been.setEst_q2(request.getParameter("place")); //라디오버튼
		
		String[] types = request.getParameterValues("type"); // 선택된 모든 유형 값을 배열로 받아옴
		String typeStr = String.join(",", types); // 배열 값을 쉼표로 구분하여 하나의 문자열로 합침
		bachi_matchi_been.setEst_q3(typeStr); // 객체에 저장

		
		bachi_matchi_been.setGosu_menu1(request.getParameter("gosu_menu1"));
		bachi_matchi_been.setGosu_menu2(request.getParameter("gosu_menu2"));
		
		Bachi_Match_Service bachi_matchi_service = new Bachi_Match_Service(); //서비스 호출
		boolean isWriteSuccess = bachi_matchi_service.registArticle(bachi_matchi_been); //서비스 메소드 호출,객체를 서비스의 dao에 넣음.
		System.out.println(isWriteSuccess);
		
	
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
			forward.setPath("bachi_match_final.bc");
		}
		
	
		
		return forward;
	}
}
