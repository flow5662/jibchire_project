 <%@page import="dto.Bachi_product"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Bachi_market"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="dao.Gosu_mark"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.awt.Graphics2D" %>
<%@ page import="java.awt.image.renderable.ParameterBlock" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.media.jai.JAI" %>
<%@ page import="javax.media.jai.RenderedOp" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <jsp:useBean id="market1" class="dao.Gosu_mark">
<%
//SE17버전은 jpg 지원불가능, 따로 라이브러리 설치해야함.
//SE18버전으로 실행요망


ServletContext context = request.getServletContext();
String imagePath=context.getRealPath("bachi/bachi_market");

int size = 1*1024*1024 ;
String filename="";

try{ //png이외의 파일이면 이슈발생, 수정요망
	MultipartRequest multi=	new MultipartRequest(request,
	  					  imagePath,
						  size,
						  "utf-8",
						new DefaultFileRenamePolicy());
	
	Enumeration files=multi.getFileNames();
	
	String file =(String)files.nextElement();
	filename=multi.getFilesystemName(file);
	
	Bachi_market mark = new Bachi_market();
	mark.setCust_id((String) session.getAttribute("ID"));
	
	mark.setMarket_text(multi.getParameter("market_text"));
	mark.setMarket_title(multi.getParameter("market_title"));
	mark.setGosu_menu1(multi.getParameter("gosu_menu1"));
	mark.setGosu_menu2(multi.getParameter("gosu_menu2"));
	filename = multi.getFilesystemName("filename");
	mark.setMarket_picture(filename);

	dao.Gosu_mark market = new dao.Gosu_mark();
	
	
	// 여기까지는 market 넣는곳이라면
	
	String[] gosu_id  = multi.getParameterValues("gosu_id"); //상품옵션 선택받은거
	int minPrice = Integer.MAX_VALUE; //최대값으로 초기화
	String minId = ""; //gosu_id를 받기 위함
	
	int market_num = market.market_id();
	market_num = market_num + 1;
	
	for(int i=0;i<gosu_id.length;i++){
		application.log(gosu_id[i]);
		market.gosu_middle(market_num,Integer.parseInt(gosu_id[i])); //insert
		Bachi_product product = market.gosu_product_id(Integer.parseInt(gosu_id[i])); //product객체에 id와 가격 넣기
		int price = product.getGosu_price(); //객체에 받은 price만 가져옴
		 if (price < minPrice) { //1)최소가격(최대값으로 초기화)이 현재 가격보다 크면/2)최신 가격으로 맞춰진
		        minPrice = price; //값을 현재 값으로 넣음
		        minId= gosu_id[i]; //현재 for문이 돌아가고있기에 최소값의 gosu_id로
		    }
	
	} // 중간테이블에 값 넣기
	
	application.log(minId); //로그찍기
	
	mark.setGosu_id(minId); //set으로 가격이 min값인 gosu_id 넣음
	

	market.gosu_mark_add(mark); //gosu_market 테이블에 입력됨
	
	
	response.sendRedirect("bachi_market_list.jsp");
}catch(Exception e){
	e.printStackTrace();
}


ParameterBlock pb=new ParameterBlock();
pb.add(imagePath+"/"+filename);
BufferedImage bufferedImage = ImageIO.read(new File(imagePath+"/"+filename)); 		// jpg->png 변경
ImageIO.write(bufferedImage, "png", new File(imagePath+"/"+filename));

RenderedOp rOp=JAI.create("fileload",pb);

BufferedImage bi= rOp.getAsBufferedImage();
BufferedImage thumb=new BufferedImage(600,600,BufferedImage.TYPE_INT_RGB); //이미지가 png여야 하는이유

Graphics2D g=thumb.createGraphics();
g.drawImage(bi,0,0,600,600,null);

File file=new File(imagePath+"/sm_"+filename);
ImageIO.write(thumb,"jpg",file);

%>
</jsp:useBean>

</body>
</html>