package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CommunityMainAction;
import action.PublicApiMyInfoAction;
import action.MyPageWriteAction;
import action.MyRecommendListAction;
import action.PublicApiRent;
import action.PublicApiRepairStore;
import action.SnsDeleteAction;
import action.SnsDeleteCommentAction;
import action.SnsFollowAction;
import action.SnsFollowLoginAction;
import action.SnsHeartAction;
import action.SnsHeartLoginAction;
import action.SnsIndexAction;
import action.SnsInsertCommentAction;
import action.SnsListAction;
import action.SnsReadAction;
import action.SnsReadCommentAction;
import action.SnsSearchAction;
import action.SnsUpdateAction;
import action.SnsUpdateCommentAction;
import action.SnsUpdateDataAction;
import action.SnsWriteAction;
import dto.ActionForward;

@WebServlet("*.sns")
public class SnsController extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)  /*jsp는 request와 response를 server page에서 객체를 사용할 수 있는게 이미 약속이 되어있기 때문에 괜찮지만
																						servlet은 java를 통해 사용할 부분을 import를 해왔기 때문에
																							method에서 request와 response를 parameter로 가져와야만 사용이 가능한 것.*/
		throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();   //project와 파일경로
		String contextPath=request.getContextPath(); //project이름만
		String command=RequestURI.substring(contextPath.length()); //substring=>문자열자르기
		ActionForward forward=null; 							
		Action action=null;  									
		System.out.println("이번 요청 path는 : "+command);
		
		if(command.equals("/sns/snsWriteAction.sns")){
			action  = new SnsWriteAction(); 		    // 클래스가 상속관계일때 다형성 성립
			System.out.println("글쓰기 완료 및 컨트롤러도착");
			try {
				forward=action.execute(request, response ); // 메소드 호출 후 리턴 받음
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsListAction.sns")) {
			action = new SnsListAction();
			System.out.println("insert 완료 및 List 화면으로 ");
			try {
				forward=action.execute(request, response ); // forward는 요청path를 받아오는 객체다
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/sns/snsReadAction.sns")){
			System.out.println("글읽기 컨트롤러 실행");
			action = new SnsReadAction();		    	// 클래스가 상속관계일때 다형성 성립
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/sns/snsDeleteAction.sns")){  //글삭제
			System.out.println("글삭제 컨트롤러 실행");
			action = new SnsDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/sns/snsUpdateAction.sns")){  //글수정
			System.out.println("글수정 컨트롤러 실행");
			action = new SnsUpdateAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsUpdateDataAction.sns")){  //수정 데이터 겟
			System.out.println("snsUpdateDataAction 컨트롤러 실행");
			action = new SnsUpdateDataAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsHeartAction.sns")){  //sns좋아요
			System.out.println("sns좋아요 컨트롤러 실행");
			action = new SnsHeartAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsHeartLoginAction.sns")){  //로그인했을 때 sns좋아요 누른 피드만 가져오기
			System.out.println("snslogin좋아요 컨트롤러 실행");
			action = new SnsHeartLoginAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsSearchAction.sns")){  //검색에 대한 결과창 만들기
			System.out.println("snsSearch 컨트롤러 실행");
			action = new SnsSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsFollowAction.sns")){  //다른 회원 follow하는 액션
			System.out.println("snsFollow 컨트롤러 실행");
			action = new SnsFollowAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsFollowLoginAction.sns")){  //follow한 회원의 글만 보기
			System.out.println("snsFollowLogin 컨트롤러 실행");
			action = new SnsFollowLoginAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/myPageWrite.sns")){  //follow한 회원의 글만 보기
			System.out.println("myPageWrite 컨트롤러 실행");
			action = new MyPageWriteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/community/snsIndexList.sns")){  //index화면에서 보여줄 데이터 연결
			System.out.println("index 컨트롤러 실행");
			action = new SnsIndexAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsIndexList.sns")){  //index화면에서 보여줄 데이터 연결
			System.out.println("index 컨트롤러 실행");
			action = new SnsIndexAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/bachi/snsIndexList.sns")){  //index화면에서 보여줄 데이터 연결
			System.out.println("index 컨트롤러 실행");
			action = new SnsIndexAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsInsertComment.sns")){  //댓글 집어넣기
			System.out.println("댓글 insert 컨트롤러 실행");
			action = new SnsInsertCommentAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsSelectComment.sns")){  //읽기화면에서 댓글 불러오기 
			System.out.println("댓글 select 컨트롤러 실행");
			action = new SnsReadCommentAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsDeleteComment.sns")){  //읽기화면에서 댓글 삭제
			System.out.println("댓글 delete 컨트롤러 실행");
			action = new SnsDeleteCommentAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/snsUpdateComment.sns")){  //읽기화면에서 댓글 수정
			System.out.println("댓글 update 컨트롤러 실행");
			action = new SnsUpdateCommentAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/publicapirent.sns")){  //공공api대여소 데이터 가져오기 
			action = new PublicApiRent();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/publicapirepairstore.sns")){  //공공api 시공업체 데이터 가져오기 
			action = new PublicApiRepairStore();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/publicapiinfo.sns")){  // 내가 로그인 한 상태면 공공api에 디폴트 값으로 내 주소 가져올 수 있도록 
			action = new PublicApiMyInfoAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/communitymain.sns")){  //커뮤니티 메인에 데이터 가져오기 
			action = new CommunityMainAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns/myRecommendList.sns")){  //커뮤니티 메인에 데이터 가져오기 
			action = new MyRecommendListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
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
		doProcess(request,response); //doGet 메소드를 호출했을 때 doProcess 실행
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response); //doPost 메소드를 호출했을 때 doProcess 실행
	}   
	
}