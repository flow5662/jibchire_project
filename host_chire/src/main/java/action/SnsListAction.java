package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.ActionForward;
import dto.Feed;
import dto.PageInfo;
import svc.SnsListService;

 public class SnsListAction implements Action {
	 
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<Feed> articleList=new ArrayList<Feed>();
		/*페이지 기본 값 세팅하기*/
	  	int page=1;
		int limit=8;		
		if(request.getParameter("page")!=null){ 
			page=Integer.parseInt(request.getParameter("page"));
			//page가 1일경우의 설정이지만, page가 2,3 등등으로 넘어갈때는 page의 값을 앞장에서 넘겨받은 "page"의 값으로 설정한다
			//snsList.jsp에서 2페이지, 3페이지를 각각 클릭할때 a href = ~~.bo?page= ~~ 이런식으로 넘겨줄 것
		}
		
		/*필요 기능에 따라 메소드 호출*/
		SnsListService listService = new SnsListService(); 
		int listCount = listService.getListCount();				 // listCount = feed테이블의 행 수

		/*로그인 되어있으면 좋아요 정보까지 가져오기, 로그인 안되어있으면 전체정보만 가져오기*/
		String cust_id= request.getParameter("cust_id");
		if(cust_id==null){
			articleList = listService.getArticleList(page,limit);    // articleList = feed테이블에 저장되어 있는 모든 값
			System.out.println("로그인 비완료 ==>> 그냥 출력 서비스 메소드로 ");
		}else {
			articleList = listService.getHeartArticleList(page,limit,cust_id); //로그인되어있으면 좋아요정보까지 가져오는 메소드 연결
			System.out.println("로그인 완료 ==>> 좋아요,팔로우 로그인 서비스 출력 메소드로");
		}

		
		/* 페이징을 하는 거의 공식과 같은 문장들 */
   		int maxPage=(int)((double)listCount/limit+0.95); // 15/10+0.95=2.45, maxPage=2
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;
   	    
   	    /*페이징*/
   		if (endPage> maxPage) endPage= maxPage;
   		
   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		
		/*snsList.jsp 에서 이 값들을 사용하기 위해서 setAttribute로 객체를 세팅*/
		request.setAttribute("pageInfo", pageInfo);  // "pageInfo"라는 key값에 pageInfo라는 객체를 value값으로 넣음
		request.setAttribute("articleList", articleList);
		
		/*path를 세팅하기 위해 ActionForward class의 객체 생성*/
		ActionForward forward= new ActionForward();
   		forward.setPath("snsList.jsp"); //ActionForward.java 클래스에 setpath메소드에 setting.
   		return forward;
   		
	 }
	 
 }