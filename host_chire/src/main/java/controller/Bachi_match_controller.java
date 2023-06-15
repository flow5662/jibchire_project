package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BachiInfoAction;
import action.BachiMatchAnsAction;
import action.BachiMatchCateAction;
import action.BachiMatchReqAction;
import action.BachiMatchReqAns;
import action.BachiMatchReqSAction;
import action.BachiQuestionsAction;
import action.Bachi_match_categoryAction;
import dto.ActionForward;
import dto.Bachi_match_Been;
import svc.BachiInfoSelectService;

@WebServlet("*.bc")
public class Bachi_match_controller extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action=null;
		System.out.println(command);
		if(command.equals("/bachi/bachi_match.bc")){ //미사용 코드, 정리 예정
			action= new BachiMatchCateAction();	
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/bachi/bachi_question.bc")) { //카테고리별 타고 들어가는 경로
			action  = new BachiQuestionsAction(); //질문을 받는 Action 호출
			try {
				forward = action.execute(request, response);				
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/bachi/bachi_match_req.bc")) {
			
			action = new BachiMatchReqAction();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
			e.printStackTrace();			
			}
		}else if(command.equals("/bachi/bachi_match_ans.bc")) {
			action = new BachiMatchAnsAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/bachi/bachi_insert.bc")) {
			forward=new ActionForward();
			forward.setPath("bachi_insert.jsp");
		}else if(command.equals("/bachi/bachi_select_id.bc")) { //중복확인용
		    String cust_id = request.getParameter("cust_id"); //hidden에 저장된 id 값
		    
		    BachiInfoSelectService service = new BachiInfoSelectService();
		    boolean isCheck; //id가 중복이면 true, 중복이 아니면 false 
		    try {
		        isCheck = service.select_bachi_id(cust_id);

		        if(isCheck == true) {
		            response.getWriter().print("false");
		        } else {
		            response.getWriter().print("true");
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}else if(command.equals("/bachi/bachi_info.bc")) {
			action= new BachiInfoAction();	
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/bachi/bachi_match_req_s.bc")) { //상세
			action = new BachiMatchReqSAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/bachi/bachi_match_req_sw.bc")) {
			action = new BachiMatchReqAns();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/bachi/bachi_match_anser.bc")) {
			forward=new ActionForward();
			forward.setPath("bachi_match_req_ans_info.jsp");
		}else if(command.equals("/bachi/bachi_match-home.bc")) {
			forward=new ActionForward();
			forward.setPath("bachi_match.jsp");
		}else if(command.equals("/bachi/bachi_match_cate.bc")) { //gosu_menu1~2 
			action = new Bachi_match_categoryAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/bachi/bachi_match_final.bc")) {
			forward = new ActionForward();
			forward.setPath("bachi_match_final.jsp");
		}
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	} 
}		