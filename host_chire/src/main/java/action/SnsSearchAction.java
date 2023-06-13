package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.ActionForward;
import dto.Feed;
import dto.PageInfo;
import dto.SearchSns;
import svc.SnsListService;
import svc.SnsSearchService;

 public class SnsSearchAction implements Action {
	 
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<Feed> articleList=new ArrayList<Feed>();
		SearchSns search = new SearchSns();
		/*페이지 기본 값 세팅하기*/
	  	int page=1;
		int limit=8;	
		search.setPage(page);
		search.setLimit(limit);
		String searchword = request.getParameter("snsSearchWord");
		search.setSearchword(searchword);
	System.out.println("  보내진 검색어는 ? => "+search.getSearchword());
		if(request.getParameter("page")!=null){ 
			page=Integer.parseInt(request.getParameter("page"));
			search.setPage(page);
			//page가 1일경우의 설정이지만, page가 2,3 등등으로 넘어갈때는 page의 값을 앞장에서 넘겨받은 "page"의 값으로 설정한다
			//snsList.jsp에서 2페이지, 3페이지를 각각 클릭할때 a href = ~~.bo?page= ~~ 이런식으로 넘겨줄 것
		}
		// arraylist로 값을 가져오면 size가 listcount 값이겠지
		// feed_txt, feed_hashtag으로 각각 다 검색해서 list에 공간을 분리해서 가져오면 될 것 같다.
		// 메소드는 문장 하나만 실행해야 하니까, 메소드를 계속 호출해서 나중에 하나만 리턴한다면...? 근데 그럼 구역 분리가 안될텐데
		// 1차가 select feed_txt, 2차가 feed_hashtag일테니
		
		
		
		/*필요 기능에 따라 메소드 호출*/
		SnsSearchService searchService = new SnsSearchService(); 
		articleList = searchService.getArticleList(search);    // articleList = feed테이블에 저장되어 있는 모든 값
		int listCount = articleList.size(); // listCount = select한 문장의 크기가 곧 전체의 길이
		
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
		request.setAttribute("searchword", searchword);
		
		/*path를 세팅하기 위해 ActionForward class의 객체 생성*/
		ActionForward forward= new ActionForward();
   		forward.setPath("snsSearch.jsp"); //ActionForward.java 클래스에 setpath메소드에 setting.
   		return forward;
   		
	 }
	 
 }