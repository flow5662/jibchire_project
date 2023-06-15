package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.ActionForward;
import dto.Bachi_match_AnsBeen;
import dto.Bachi_match_Been;
import svc.Bachi_Match_Ans_Service;
import svc.Bachi_Match_Req_S_Service;

public class BachiMatchReqAns implements Action { //답변 완료 화면으로 이동
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ArrayList<Bachi_match_Been> match_been = new ArrayList<Bachi_match_Been>();
		 String id = request.getParameter("est_id");
		int est_id =Integer.parseInt(id);
		
		//세션에 저장된 아이디(바치)
		HttpSession session = request.getSession();	
		String cust_id = (String) session.getAttribute("ID");
		
		
		Bachi_Match_Req_S_Service match_req_s = new Bachi_Match_Req_S_Service();
		match_been = match_req_s.select_one(est_id);
		request.setAttribute("been", match_been);//key value 설정
		
		
		ArrayList<Bachi_match_AnsBeen> match_ans_been = new ArrayList<Bachi_match_AnsBeen>();
		Bachi_Match_Ans_Service match_ans_s = new Bachi_Match_Ans_Service();
		match_ans_been = match_ans_s.select_matchAns(est_id,cust_id);
		
		request.setAttribute("ansbeen", match_ans_been);
		//질문 및 답변 모두 출력 위해 사용
		
		ActionForward forward= new ActionForward(); //이동 클래스
		forward.setPath("bachi_match_req_ans.jsp?board="+est_id); //
		return forward;
		
	}
}
