<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="dao.CmtHousewarming"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.Post_house" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String imagePath=request.getRealPath("/community/postPics"); 
	int size = 15*1024*1024; 
	try{
		MultipartRequest multi=new MultipartRequest(request,
							imagePath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());

		CmtHousewarming com = new CmtHousewarming();  //insert할클래스에넣기
		Post_house post = new Post_house(); //값을담을객체생성

		String id = (String) session.getAttribute("ID");
		post.setCust_id(id);
		post.setPost_title(multi.getParameter("post_title"));
		post.setPost_txt(multi.getParameter("post_txt"));
		post.setPost_house(multi.getParameter("post_house"));
		post.setPost_family(multi.getParameter("post_family"));
		post.setPost_direc(multi.getParameter("post_direc"));
		post.setPost_pet(multi.getParameter("post_pet"));
	out.println(multi.getParameter("post_pet")+"=post_pet value");	
		/*복수의 값을 가진 경우는 한꺼번에 넣기*/
		String [] pstl = multi.getParameterValues("post_style");
		String [] pcol = multi.getParameterValues("post_color");
		String colorsum="";
		String stylesum="";
		for(int i=0; i<pcol.length;i++){
			colorsum += pcol[i];
		}
		for(int i=0; i<pstl.length;i++){
			stylesum += pstl[i];
		}
		post.setPost_color(colorsum);
// 		post.setPost_style(stylesum);

		String region1 = multi.getParameter("post_region");
		String region2 = multi.getParameter("post_region2");
		post.setPost_region(region1+region2);
		//지역

		String syear = multi.getParameter("post_startdate_year");
		String smonth = multi.getParameter("post_startdate_month");
		String sdate = multi.getParameter("post_startdate_date");
		String eyear = multi.getParameter("post_enddate_year");
		String emonth = multi.getParameter("post_enddate_month");
		String edate = multi.getParameter("post_enddate_date");
		//날짜값깔끔하게합치려고변수에넣음
		post.setPost_startdate(syear+smonth+sdate);
		post.setPost_enddate(eyear+emonth+edate);


		//변수값합쳐서메소드에보내기
		int rooms = Integer.parseInt(multi.getParameter("post_rooms"));
		int m2 = Integer.parseInt(multi.getParameter("post_m2"));
		int fam = Integer.parseInt(multi.getParameter("post_fam"));
		int houseold = Integer.parseInt(multi.getParameter("post_houseold"));
		int budget = Integer.parseInt(multi.getParameter("post_budget"));
		//int값인변수변환
		post.setPost_rooms(rooms);
		post.setPost_m2(m2);
		post.setPost_fam(fam);
		post.setPost_houseold(houseold);
		post.setPost_budget(budget);
		
		/*파일관련 적업공간*/
		Enumeration files=multi.getFileNames(); //file의 이름을 불러올 수 있음. input type files를 여러개 가져올 수 있음		
		String file1=(String) files.nextElement();
		String filename1 = multi.getFilesystemName(file1);   //소비자가 올린 이름이 있고, 그게 다른사람이 올린 파일명과 중복될 수 있기 때문에, 중복된다면 컴퓨터가 다르게 저장함
		String origfilename1 = multi.getOriginalFileName(file1);
		post.setPost_pics(filename1);
		//파일이름넣기
		
		
		/*썸네일 파일 저장하기*/
		ParameterBlock pb=new ParameterBlock();
		pb.add(imagePath+"/"+post.getPost_pics());
		BufferedImage bufferedImage = ImageIO.read(new File(imagePath+"/"+post.getPost_pics())); 		// jpg->png로 변경하기		// read a jpeg from a inputFile
		// write the bufferedImage back to outputFile
		
	out.println(imagePath+"/"+post.getPost_pics());	
		ImageIO.write(bufferedImage, "png", new File(imagePath+"/"+post.getPost_pics()));
		RenderedOp rOp=JAI.create("fileload",pb);  //썸네일로 만들어질 원본이미지 이름(경로포함)
		BufferedImage bi= rOp.getAsBufferedImage(); // 지우면 일반화면은 보이고 썸네일은 보이지 않음
		BufferedImage thumb=new BufferedImage(350,350,BufferedImage.TYPE_INT_RGB);   //BufferedImage(int width, int height, int imageType)
		Graphics2D g=thumb.createGraphics();
		g.drawImage(bi,0,0,350,350,null);   //drawImage : 이미지의 일부분을 크기조절 drawImage(image, sx, sy, sWidth, sHeight)
											//sx : 이미지 왼쪽 상단 모서리가 위치할 Canvas내 X 좌표, sy : 이미지 왼쪽 상단 모서리가 위치할 Canvas내 y 좌표
		
		/*작은 이미지를 폴더 안에 저장하기*/
		File file=new File(imagePath+"/sm_"+post.getPost_pics());
		ImageIO.write(thumb,"jpg",file);
	out.println("action write action 잘 되어가는가");
		
		com.insert_board(post);
		//게시글 내용을 insert하는 method 호출 
		response.sendRedirect("view_board.jsp");
		//글쓰기 완료하면 메인화면으로 넘어감
		
	}catch(Exception e){
		e.printStackTrace();
	}
	%>

</body>
</html>