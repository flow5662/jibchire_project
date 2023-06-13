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
    
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <jsp:useBean id="market1" class="dao.Gosu_mark">
<%
ServletContext context = request.getServletContext();
String imagePath=context.getRealPath("bachi/bachi_market");

int size = 1*1024*1024 ;
String filename="";

try{
	MultipartRequest multi=	new MultipartRequest(request,
	  					  imagePath,
						  size,
						  "utf-8",
						new DefaultFileRenamePolicy());
	
	Enumeration files=multi.getFileNames();
	
	String file =(String)files.nextElement();
	filename=multi.getFilesystemName(file);
	
	Bachi_market mark = new Bachi_market();
	mark.setGosu_id(multi.getParameter("gosu_id"));
	
	mark.setMarket_text(multi.getParameter("market_text"));
	mark.setMarket_title(multi.getParameter("market_title"));
	mark.setGosu_menu1(multi.getParameter("gosu_menu1"));
	mark.setGosu_menu2(multi.getParameter("gosu_menu2"));
	filename = multi.getFilesystemName("filename");
	mark.setMarket_picture(filename);
	
	String market_id = multi.getParameter("market_id"); //market_id 값 정의
	int market_id_int = Integer.parseInt(market_id); //delete용
	int mark_id = 0;
	if(market_id != null && !market_id.isEmpty()) { //request.getParameter은 String값만 가져올 수 있음.
	    mark_id = Integer.parseInt(market_id); //형변환 Int
	}
	mark.setMarket_id(mark_id);
	

	dao.Gosu_mark market = new dao.Gosu_mark();
	
	String[] gosu_id  = multi.getParameterValues("gosu_id"); //상품옵션 선택받은거
	int minPrice = Integer.MAX_VALUE; //최대값으로 초기화
	String minId = ""; //gosu_id를 받기 위함
	
	//application.log(gosu_id[0]); //로그찍기
	int market_num = market.market_id();
	market_id = market_id + 1;
	market.gosu_middle_delete(market_id_int); //먼저 삭제 후
	
	for(int i=0;i<gosu_id.length;i++){
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
	
	
	
	market.gosu_mark_update(mark);
	
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
BufferedImage thumb=new BufferedImage(600,600,BufferedImage.TYPE_INT_RGB);

Graphics2D g=thumb.createGraphics();
g.drawImage(bi,0,0,600,600,null);

File file=new File(imagePath+"/sm_"+filename);
ImageIO.write(thumb,"jpg",file);


%>
</jsp:useBean>

</body>
</html>